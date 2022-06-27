package kh.spring.pisic.faq.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.faq.domain.FaqBoard;
import kh.spring.pisic.faq.model.dao.FaqDao;


@Service
public class FaqServiceImpl {
	
	@Autowired
	private FaqDao dao;
	
	public List<FaqBoard> selectFaqList()   {
		return dao.selectFaqList();
	}

	

}
