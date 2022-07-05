package kh.spring.pisic.faq.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.faq.domain.*;
import kh.spring.pisic.faq.domain.FaqBoard;
import kh.spring.pisic.faq.model.dao.FaqDao;


@Service
public class FaqServiceImpl {
	
	@Autowired
	private FaqDao dao;
	
	public List<FaqBoard> pageSelectFaq()   {
		return dao.pageSelectFaq();
	}

	
	public FaqBoard selectFaqBoard(String faq_no)   {
		return dao.selectFaqBoard(faq_no);
	}



	

}
