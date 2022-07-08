package kh.spring.pisic.qna.model.service;

import java.util.List;

import kh.spring.pisic.qna.domain.QnaBoard;

public interface QnaService {
	
	public List<QnaBoard> pageSelectQna();
	public QnaBoard selectQnaBoard(String qna_no);
	
}
