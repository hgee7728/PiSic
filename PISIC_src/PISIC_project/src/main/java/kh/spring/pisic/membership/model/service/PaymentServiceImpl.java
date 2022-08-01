package kh.spring.pisic.membership.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.membership.domain.MembershipInfo;
import kh.spring.pisic.membership.model.dao.MembershipDao;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	MembershipDao dao;
	
	@Override
	public int insertMembershipInfo(MembershipInfo membershipInfo) {
		return dao.insertMembershipInfo(membershipInfo);
	}
	
}
