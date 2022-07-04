package kh.spring.pisic.pjboard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.pjboard.model.dao.PjBoardDao;

@Service
public class PjBoardServiceImpl {
	
	@Autowired
	private PjBoardDao dao;
	
	public List<PjBoard> selectPjList(){
		return dao.selectPjList();
	}
}
