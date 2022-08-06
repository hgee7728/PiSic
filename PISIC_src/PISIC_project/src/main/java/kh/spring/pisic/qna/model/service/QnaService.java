package kh.spring.pisic.qna.model.service;

import java.util.List;

import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.sound.domain.Criteria;

public interface QnaService {
	
	public int totalQnaBoard(String uid);
	public List<QnaBoard> pageSelectQna(Criteria cri, String uid);
	public QnaBoard selectQnaBoard(String qna_no);
	public int insertQna(QnaBoard qnaBoard);
	public int updateQna(QnaBoard qnaBoard);
	public int deleteQna(QnaBoard qnaBoard);
	public int deleteQna(List<Integer> qna_no_list);
}
