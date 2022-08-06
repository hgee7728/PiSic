package kh.spring.pisic.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.qna.model.dao.QnaDao;
import kh.spring.pisic.sound.domain.Criteria;

@Service("QnaService")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDao dao;
	
	// 전체 글 갯수 - 페이징
	@Override
	public int totalQnaBoard(String uid) {
		return dao.totalQnaBoard(uid);
	}
	// 글 목록 - 페이징
	@Override
	public List<QnaBoard> pageSelectQna(Criteria cri, String uid) {
		return dao.pageSelectQna(cri, uid);
	}
	// 글 상세조회
	public QnaBoard selectQnaBoard(String qna_no) {
		return dao.selectQnaBoard(qna_no);
	}
	
	// 글쓰기
	@Override
	@Transactional
	public int insertQna(QnaBoard qnaBoard) {
		// 원글 쓰기 인지 답변 쓰기 인지 판별
		if(qnaBoard.getOrigin_no() > 0) { // 답변쓰기
			dao.updateQnaOrd(qnaBoard); // gr_ord 수정하기
			return dao.insertQna(qnaBoard);
		
		}else { // 원글 쓰기
			return dao.insertQna(qnaBoard);
		}
	}
	
	@Override
	public int updateQna(QnaBoard qnaBoard) {
		return dao.updateQna(qnaBoard);
	}

	@Override
	public int deleteQna(int qna_no){
		return dao.deleteQna(qna_no);
	}
	
	@Override
	public int deleteQna(List<Integer> qna_no_list)  {
		return 0;
	}

}
