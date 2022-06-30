package kh.spring.pisic.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.qna.model.dao.QnaDao;

@Service
public class QnaServiceImpl {
	
	@Autowired
	private QnaDao dao;
	
	public List<QnaBoard> selectQnaList(){
		return dao.selectQnaList();
	}
	
	
	

}
