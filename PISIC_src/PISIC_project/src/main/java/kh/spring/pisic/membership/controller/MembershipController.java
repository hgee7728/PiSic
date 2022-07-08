package kh.spring.pisic.membership.controller;

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
	
}
