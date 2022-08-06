package kh.spring.pisic.qna.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.sound.domain.Criteria;

@Repository
public class QnaDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 글 목록 - 페이징
	public List<QnaBoard> pageSelectQna(Criteria cri, String uid){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("m_id", uid);
		return sqlsession.selectList("QnaBoard.pageSelectQna", map);
	}
	// 전체 글 갯수 - 페이징
	public int totalQnaBoard(String uid) {
		return sqlsession.selectOne("QnaBoard.totalQnaBoard", uid);
	}
	// 글 상세조회
	public QnaBoard selectQnaBoard(String qna_no) {
		return sqlsession.selectOne("QnaBoard.selectQnaBoard",qna_no);
	}
	
	// QNA 등록
	public int insertQna(QnaBoard qnaBoard) {
		return sqlsession.insert("QnaBoard.insertQna",qnaBoard);
	}
	
	// QNA OREDR 수정 - 글쓰기
	public int updateQnaOrd(QnaBoard qnaBoard) {
		return sqlsession.insert("QnaBoard.updateQnaOrd",qnaBoard);
	}
	// QNA 수정
	public int updateQna(QnaBoard qnaBoard) {
		return sqlsession.update("QnaBoard.updateQna",qnaBoard);
	}
	// QNA 삭제
	public int deleteQna(QnaBoard qnaBoard) {
		return sqlsession.delete("QnaBoard.deleteQna", qnaBoard);
	}
	
	// QNA OREDR 수정 - 글삭제
	public int updateDeleteQnaOrd(QnaBoard qnaBoard) {
		return sqlsession.insert("QnaBoard.updateDeleteQnaOrd",qnaBoard);
	}
	



}
