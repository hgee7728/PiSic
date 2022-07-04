package kh.spring.pisic.pjboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.pjboard.domain.PjBoard;

@Repository
public class PjBoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	//pj board 리스트 목록
	public List<PjBoard> selectPjList(){
		return sqlSession.selectList("PjBoard.selectPjList");
	}

}
