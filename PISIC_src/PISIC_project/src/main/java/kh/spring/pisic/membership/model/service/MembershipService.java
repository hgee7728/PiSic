package kh.spring.pisic.membership.model.service;

import java.util.List;

import kh.spring.pisic.membership.domain.Membership;

public interface MembershipService {
	
	public List<Membership> selectMembership();
}
