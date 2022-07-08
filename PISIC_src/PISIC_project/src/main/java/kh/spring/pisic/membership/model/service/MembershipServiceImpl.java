package kh.spring.pisic.membership.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.membership.model.dao.MembershipDao;

@Service
public class MembershipServiceImpl implements MembershipService {

	@Autowired
	private MembershipDao dao;
}
