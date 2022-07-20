package kh.spring.pisic.membership.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.membership.domain.Membership;

@Repository
public class MembershipDao {

	@Autowired
	private SqlSession session;
	
	public List<Membership> selectMembership() {
		return session.selectList("Membership.selectMembership");
	}
}
