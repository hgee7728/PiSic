package kh.spring.pisic.membership.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.membership.domain.Membership;
import kh.spring.pisic.membership.domain.MembershipInfo;

@Repository
public class MembershipDao {

	@Autowired
	private SqlSession session;
	
	public List<Membership> selectMembership() {
		return session.selectList("Membership.selectMembership");
	}
	
	public int insertMembershipInfo(MembershipInfo membershipInfo) {
		return session.insert("MembershipInfo.insertMembershipInfo", membershipInfo);
	}
	
	public List<MembershipInfo> selectMembershipInfoList(String m_id) {
		return session.selectList("MembershipInfo.selectMembershipInfoList", m_id);
	}
	
	public int checkMembership(String m_id) {
		return session.selectOne("MembershipInfo.checkMembership", m_id);
	}
}
