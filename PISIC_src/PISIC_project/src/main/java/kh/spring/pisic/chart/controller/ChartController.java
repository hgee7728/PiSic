package kh.spring.pisic.chart.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.chart.model.service.ChartService;
import kh.spring.pisic.sound.domain.Sound;

@Controller
@RequestMapping("/chart")
public class ChartController {
	@Autowired
	private ChartService serviceC;

	@GetMapping("/")
	public ModelAndView MainPage(ModelAndView mv, Model model) {
		List<Sound> chartTopten = serviceC.selectMainTopten();
		mv.addObject("chartTopten", chartTopten);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		mv.setViewName("chart/chartMain");

		return mv;
	}

	@GetMapping("/chartDetail")
	public ModelAndView DetailPage(ModelAndView mv, Model model) {
		List<Sound> chartTopten = serviceC.selectChartMain();
		mv.addObject("chartTopten", chartTopten);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		mv.setViewName("chart/chartDetail");

		return mv;
	}

}
