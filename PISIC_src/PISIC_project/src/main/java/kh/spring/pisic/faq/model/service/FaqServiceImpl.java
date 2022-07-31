package kh.spring.pisic.faq.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.faq.domain.FaqBoard;
import kh.spring.pisic.faq.model.dao.FaqDao;


@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqDao dao;


	// 자주 묻는 질문 게시판
	@Override
	public List<FaqBoard> selectFaqBoard() {
		return dao.selectFaqBoard();
	}
	
	@Override
	public FaqBoard selectFaq(int faq_no) {
		return dao.selectFaq(faq_no);
	}

	// 자주 묻는 질문 등록
	@Override
	public int insertFaq(FaqBoard faqBoard) {
		return dao.insertFaq(faqBoard);
	}

	// 자주 묻는 질문 수정
	@Override
	public int updateFaq(FaqBoard faqBoard) {
		return dao.updateFaq(faqBoard);
	}

	// 자주 묻는 질문 삭제
	@Override
	public int deleteFaq(int faq_no) {
		return dao.deleteFaq(faq_no);
	}


	

}
