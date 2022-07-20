package kh.spring.pisic.membership.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.membership.domain.Membership;
import kh.spring.pisic.membership.model.service.MembershipService;

@Controller
@RequestMapping("/membership")
public class MembershipController {
	@Autowired
	private MembershipService service;
	
	@GetMapping("/list")
	public String pageSelectMembership(
			HttpSession session) {
		
		session.setAttribute("membershipList", service.selectMembership());
		return "membership/list";
	}
	
	@GetMapping("/cancel")
	public String pageCancelMembership(
			HttpSession session) {
		
		return "membership/cancel";
	}
	
	@GetMapping("/history")
	public String pageHistoryMembership(
			HttpSession session) {
		
		return "membership/history";
	}
	
	
}
