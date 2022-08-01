package kh.spring.pisic.qna.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.qna.domain.Criteria;
import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.qna.domain.QnaPaging;

@Repository
public class QnaDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	//1:1문의 목록 (페이징처리)
	public List<QnaBoard> pageSelectQna(QnaPaging qnaPaging, String uid){
		System.out.println("여기여기여기"+ qnaPaging);
		RowBounds rowBounds = new RowBounds((qnaPaging.getCr().getPage() -1) * qnaPaging.getDisplayPageNum(), qnaPaging.getDisplayPageNum());
		return sqlsession.selectList("QnaBoard.pageSelectQna",uid, rowBounds);
	}
	public int totalQnaBoard(String uid) {
		return sqlsession.selectOne("QnaBoard.totalQnaBoard", uid);
	}
	public QnaBoard selectQnaBoard(String qna_no) {
		return sqlsession.selectOne("QnaBoard.selectQnaBoard",qna_no);
	}
	
	// QNA 등록
	public int insertQna(QnaBoard qnaBoard) {
		return sqlsession.insert("QnaBoard.insertQna",qnaBoard);
	}
	// QNA 수정
	public int updateQna(QnaBoard qnaBoard) {
		return sqlsession.update("QnaBoard.updateQna",qnaBoard);
	}
	// QNA 삭제
	public int deleteQna(int qna_no) {
		return sqlsession.delete("QnaBoard.deleteQna", qna_no);
	}
	



}
