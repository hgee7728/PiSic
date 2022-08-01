package kh.spring.pisic.membership.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.membership.domain.Membership;
import kh.spring.pisic.membership.domain.MembershipInfo;
import kh.spring.pisic.membership.model.dao.MembershipDao;

@Service
public class MembershipServiceImpl implements MembershipService {

	@Autowired
	private MembershipDao dao;

	@Override
	public List<Membership> selectMembership() {
		return dao.selectMembership();
	}

	@Override
	public List<MembershipInfo> selectMembershipInfoList(String m_id) {
		return dao.selectMembershipInfoList(m_id);
	}

	@Override
	public int checkMembership(String m_id) {
		return dao.checkMembership(m_id);
	}
}
