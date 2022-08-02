package kh.spring.pisic.membership.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.member.model.service.MemberService;
import kh.spring.pisic.membership.domain.Membership;
import kh.spring.pisic.membership.model.service.MembershipService;

@Controller
@RequestMapping("/membership")
public class MembershipController {
	
	@Autowired
	private MembershipService service;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/list")
	public ModelAndView pageSelectMembership(
			ModelAndView mv
			, Principal principal) {
		
		mv.addObject("membershipList", service.selectMembership());
		mv.setViewName("membership/list");
		return mv;
	}
	
	@GetMapping("/cancel")
	public String pageCancelMembership(
			HttpSession session) {
		
		return "membership/cancel";
	}
	
	@GetMapping("/history")
	public ModelAndView pageHistoryMembership(
			ModelAndView mv
			, Authentication auth) {
		// 현재 사용자 id
		UserDetails ud = (UserDetails)auth.getPrincipal();
		String uid = ud.getUsername();
		
		mv.addObject("membershipInfoList", service.selectMembershipInfoList(uid));
		mv.setViewName("membership/history");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/checkMembership")
	public int checkMembership(String m_id) {
		int result1 = memberService.checkMembershipYn(m_id);
		int result2 = service.checkMembership(m_id);
		return result1;
	}
}
