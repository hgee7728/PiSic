package kh.spring.pisic.membership.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.pisic.member.model.service.MemberService;
import kh.spring.pisic.membership.domain.MembershipInfo;
import kh.spring.pisic.membership.model.service.ImportService;
import kh.spring.pisic.membership.model.service.PaymentService;

@Controller
@RequestMapping("/payments")
public class PayMemtController {
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	ImportService importService;
	
	
	@Autowired
	MemberService memberService;
	
	// 정기 결제
//	@PostMapping("/payment")
//	public String selectPay(
//			MembershipInfo membershipInfo
//			, int period
//			, Model model
//			, Authentication auth) {
//		// 현재 사용자 id
//		UserDetails ud = (UserDetails)auth.getPrincipal();
//		String uid = ud.getUsername();
//		
//		membershipInfo.setM_id(uid);
//		membershipInfo.setMs_period(period);
//		
//		System.out.println(uid);
//		System.out.println(period);
//		
//		// 이용권 내역 등록
//		int result1 = paymentService.insertMembershipInfo(membershipInfo);
//		
//		//등록된 내역으로 결제정보 가져오기
//		MembershipInfo result2 = paymentService.getPayInfo(membershipInfo);		
//		System.out.println(result2);
//		model.addAttribute("payInfoVO", result2);
//		return "payment/paymentPeriod";
//	}
	
	@ResponseBody
	@PostMapping("/completeG")
	public int completeG(
			@RequestParam (name = "imp_uid", required = false) String imp_uid
			, @RequestParam (name = "merchant_uid", required = false) String merchant_uid
			, @RequestParam (name = "price", required = false) String price
			, @RequestParam (name = "pno", required = false) String pno
			, @RequestParam (name = "period", required = false) String period
			, @RequestParam (name = "ppg", required = false) String ppg
			, Authentication auth
			, MembershipInfo membershipInfo) {
		// 현재 사용자 id
		UserDetails ud = (UserDetails)auth.getPrincipal();
		String uid = ud.getUsername();
		
		System.out.println("============================================" + imp_uid);
		System.out.println("============================================" + merchant_uid);
		System.out.println("============================================" + price);
		System.out.println("============================================" + pno);
		System.out.println("============================================" + period);
		System.out.println("============================================" + ppg);
		
		membershipInfo.setMs_i_no(imp_uid);
		membershipInfo.setM_id(uid);
		membershipInfo.setMs_no(Integer.parseInt(pno));
		membershipInfo.setMs_i_pg(ppg);
		membershipInfo.setMs_period(Integer.parseInt(period));
//		membershipInfo.setMs_customer_uid(customer_uid);
		membershipInfo.setMs_merchant_uid(merchant_uid);
		
		// MembershipInfo 정보 insert
		int result1 = paymentService.insertMembershipInfo(membershipInfo);
		
		// Member m_membership_yn 수정
		int result2 = memberService.updateMemberMembershipYn(uid);
		
		return result1;
	}
}
