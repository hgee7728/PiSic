package kh.spring.pisic.membership.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.membership.domain.Membership;
import kh.spring.pisic.membership.model.dao.MembershipDao;

@Service
public class MembershipServiceImpl implements MembershipService {

	@Autowired
	private MembershipDao dao;

	@Override
	public List<Membership> selectMembership() {
		return dao.selectMembership();
	}
}
