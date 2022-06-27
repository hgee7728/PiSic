package kh.spring.pisic.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.member.domain.Member;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession session;
	
	public int insertMember(Member member) {
		return session.insert("Member.insertMember", member);
	}
	
	public Member selectLogin(Member member) {
		return session.selectOne("Member.selectLogin", member);
	}

}
