package kh.spring.pisic.qna.model.service;

import java.util.List;

import kh.spring.pisic.qna.domain.QnaBoard;

public interface QnaService {
	
	public List<QnaBoard> pageSelectQna();
	public QnaBoard selectQnaBoard(String qna_no);
	public int insertQna(QnaBoard qnaBoard);
	public int updateQna(QnaBoard qnaBoard);
	public int deleteQna(String qna_no);
	public int deleteQna(List<Integer> qna_no_list);
}
