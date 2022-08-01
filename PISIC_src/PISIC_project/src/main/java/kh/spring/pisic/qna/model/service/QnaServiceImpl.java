package kh.spring.pisic.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.pisic.qna.domain.Criteria;
import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.qna.domain.QnaPaging;
import kh.spring.pisic.qna.model.dao.QnaDao;

@Service("QnaService")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDao dao;
	
	@Override
	public int totalQnaBoard() {
		return dao.totalQnaBoard();
	}
	
	public List<QnaBoard> pageSelectQna(QnaPaging qnaPaging) {
		return dao.pageSelectQna(qnaPaging);
	}
	public QnaBoard selectQnaBoard(String qna_no) {
		return dao.selectQnaBoard(qna_no);
	}
	
	@Transactional
	public int insertQna(QnaBoard qnaBoard) {
		if(qnaBoard.getQna_no()>0) {
			dao.updateQna(qnaBoard); // 수정하기
			return dao.insertQna(qnaBoard);
		}else {
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
