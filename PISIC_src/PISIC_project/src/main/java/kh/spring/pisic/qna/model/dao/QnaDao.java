package kh.spring.pisic.qna.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.qna.domain.QnaBoard;

@Repository
public class QnaDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	//1:1문의 목록
	public List<QnaBoard> pageSelectQna(){
			return sqlsession.selectList("QnaBoard.pageSelectQna");
	}
	public QnaBoard selectQnaBoard(String qna_no) {
		return sqlsession.selectOne("QnaBoard.selectQnaBoard",qna_no);
	}
	
	public int insertQna(QnaBoard qnaBoard) {
		return sqlsession.insert("QnaBoard.insertQna",qnaBoard);
	}
	public int updateQna(QnaBoard qnaBoard) {
		return sqlsession.update("QnaBoard.selectQnaBoard",qnaBoard);
	}
	public int deleteQna(String qna_no) {
		return sqlsession.delete("QnaBoard.deleteQna", qna_no);
	}
	public int updateQnaReplySeq(QnaBoard qnaBoard) {
		return sqlsession.update("qnaBoard.updateQnaReplySeq", qnaBoard);
		
	}


}
