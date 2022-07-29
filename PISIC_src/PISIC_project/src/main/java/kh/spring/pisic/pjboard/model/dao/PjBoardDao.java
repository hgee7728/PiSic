package kh.spring.pisic.pjboard.model.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.sound.domain.Criteria;


@Repository
public class PjBoardDao {
	@Autowired
	private SqlSession session;
	
	// 글의 총 갯수 - 페이징
	public int totalCntBoard() {
		return session.selectOne("PBoard.totalCntBoard");
	}
	
	// 글 목록 조회 - 페이징
	public List<PjBoard> selectBoardList(Criteria cri) {
		return session.selectList("PBoard.selectBoardList", cri);
	}
	
	// 글 조회수 증가
	public int updateCnt(int b_no) {
		return session.update("PBoard.updateCnt", b_no);
	}
		
	// 글 상세조회 
	public PjBoard selectBoard(int b_no) {
		return session.selectOne("PBoard.selectBoard", b_no);
	}
	
	// 글 좋아요 확인
	public int checkLike(Member member, PjBoard board) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("board", board);
		return session.selectOne("PBoard.checkLike", map);
	}
	
	// 글 좋아요 - ajax
	public int insertLike(Member member, PjBoard board) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("board", board);
		return session.insert("PBoard.insertLike", map);
	}
	
	// 글 좋아요 취소
	public int deleteLike(Member member, PjBoard board) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("board", board);
		return session.delete("PBoard.deleteLike", map);
	}
	


}
