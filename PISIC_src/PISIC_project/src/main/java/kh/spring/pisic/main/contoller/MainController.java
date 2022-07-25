package kh.spring.pisic.main.contoller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.artist.model.service.ArtistService;
import kh.spring.pisic.chart.model.service.ChartService;
import kh.spring.pisic.member.model.service.MemberService;
import kh.spring.pisic.sound.domain.Artist;

@Controller
public class MainController {
	@Autowired
	private ArtistService serviceA;

	@Autowired
	private ChartService serviceC;
	
	@Autowired
	private MemberService serviceM;
	
	@GetMapping(value = {"/", "/main"})
	public ModelAndView MainPage(ModelAndView mv, Model model) { 
		List<Artist> artistRandom = serviceA.selectArtistRandom();
		mv.addObject("artistRandom", artistRandom);
		
		mv.addObject("chartDetail", serviceC.selectChartTopTen("top", 10));
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		mv.setViewName("main");
		return mv; 
	}

	@GetMapping("/test")
	public ModelAndView testPage(
			ModelAndView mv
			) {
		
		mv.setViewName("testMain");
		return mv;
	}
	
	@GetMapping("/test/list")
	public String pageListMember(
			HttpSession session) {
		session.setAttribute("memberList", serviceM.listMember());
		session.setAttribute("adminList", serviceM.listAdmin());
		return "test/list";
	}
}
