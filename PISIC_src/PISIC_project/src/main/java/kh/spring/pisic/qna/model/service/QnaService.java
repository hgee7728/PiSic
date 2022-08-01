package kh.spring.pisic.qna.model.service;

import java.util.List;

import kh.spring.pisic.qna.domain.Criteria;
import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.qna.domain.QnaPaging;

public interface QnaService {
	
	public int totalQnaBoard();
	public List<QnaBoard> pageSelectQna(QnaPaging qnaPaging);
	public QnaBoard selectQnaBoard(String qna_no);
	public int insertQna(QnaBoard qnaBoard);
	public int updateQna(QnaBoard qnaBoard);
	public int deleteQna(int qna_no);
	public int deleteQna(List<Integer> qna_no_list);
	
}
