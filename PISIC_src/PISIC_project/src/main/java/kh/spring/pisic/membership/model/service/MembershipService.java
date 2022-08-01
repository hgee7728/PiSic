package kh.spring.pisic.membership.model.service;

import java.util.List;

import kh.spring.pisic.membership.domain.Membership;
import kh.spring.pisic.membership.domain.MembershipInfo;

public interface MembershipService {
	
	public List<Membership> selectMembership();
	
	public List<MembershipInfo> selectMembershipInfoList(String m_id);
	
	public int checkMembership(String m_id);
}
