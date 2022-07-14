package kh.spring.pisic.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.qna.model.dao.QnaDao;

@Service("QnaService")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDao dao;

	public List<QnaBoard> pageSelectQna() {
		return dao.pageSelectQna();
	}
	public QnaBoard selectQnaBoard(String qna_no) {
		return dao.selectQnaBoard(qna_no);
	}
	
	@Transactional
	public int insertQna(QnaBoard qnaBoard) {
		if(qnaBoard.getQna_no()>0) {
			dao.updateQnaReplySeq(qnaBoard); // 수정하기
			return dao.insertQna(qnaBoard);
		}else {
			return dao.insertQna(qnaBoard);
		}
	}

	public int updateQna(QnaBoard qnaBoard) {
		return dao.updateQna(qnaBoard);
	}

	@Override
	public int deleteQna(String qna_no){
		return dao.deleteQna(qna_no);
	}
	
	@Override
	public int deleteQna(List<Integer> qna_no_list)  {
		return 0;
	}
	
	

}
