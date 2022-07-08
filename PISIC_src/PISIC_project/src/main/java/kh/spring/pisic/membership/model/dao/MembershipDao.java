package kh.spring.pisic.membership.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MembershipDao {

	@Autowired
	private SqlSession session;
}
