package kh.spring.pisic.faq.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.faq.domain.FaqBoard;

@Repository
public class FaqDao {
	@Autowired
	private SqlSession sqlSession;

	//자주묻는질문 목록
	public List<FaqBoard> selectFaqBoard() {
		return sqlSession.selectList("FaqBoard.selectFaqBoard");
	}
	public FaqBoard selectFaq(int faq_no) {
		return sqlSession.selectOne("FaqBoard.selectFaq",faq_no);
	}
	
	
	// 자주묻는 질문 등록하기
	public int insertFaq(FaqBoard faqBoard) {
		return sqlSession.insert("FaqBoard.insertFaq", faqBoard);
	}
	
	// 자주묻는 질문 등록하기
	public int updateFaq(FaqBoard faqBoard) {
		return sqlSession.update("FaqBoard.updateFaq", faqBoard);
	}
	
	// 자주묻는 질문 등록하기
	public int deleteFaq(int faq_no) {
		return sqlSession.update("FaqBoard.deleteFaq", faq_no);
	}
	
	


}
