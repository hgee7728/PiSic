package kh.spring.pisic.faq.model.service;

import java.util.List;


import kh.spring.pisic.faq.domain.FaqBoard;


public interface FaqService {
	
	public List<FaqBoard> selectFaqList();
	public FaqBoard  selectFaqBoard(String faq_no);
}