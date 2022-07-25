package kh.spring.pisic.membership.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.membership.domain.Membership;
import kh.spring.pisic.membership.model.service.MembershipService;

@Controller
@RequestMapping("/membership")
public class MembershipController {
	@Autowired
	private MembershipService service;
	
	@GetMapping("/list")
	public ModelAndView pageSelectMembership(
			HttpSession session
			, ModelAndView mv
			, Principal principal) {
		
		session.setAttribute("membershipList", service.selectMembership());
		mv.setViewName("membership/list");
		return mv;
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
	
	@PostMapping("/payments/complete")
	public String paymentsComplete(
			@RequestParam (name = "imp_uid", required = true) String imp_uid
			, @RequestParam (name = "merchant_uid", required = true) String merchant_uid
			, @RequestParam (name = "m_id", required = true) String m_id) {
		return "";
	}
}
