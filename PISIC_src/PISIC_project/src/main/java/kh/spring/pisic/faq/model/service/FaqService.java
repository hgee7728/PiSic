package kh.spring.pisic.faq.model.service;

import java.util.List;


import kh.spring.pisic.faq.domain.FaqBoard;

public interface FaqService {
	public List<FaqBoard> selectFaqBoard();
	public FaqBoard selectFaq(int faq_no);
	public int insertFaq(FaqBoard faqBoard);
	public int updateFaq(FaqBoard faqBoard);
	public int deleteFaq(int faq_no);
}