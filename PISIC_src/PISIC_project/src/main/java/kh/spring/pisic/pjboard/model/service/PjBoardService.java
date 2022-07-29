package kh.spring.pisic.pjboard.model.service;

import java.util.List;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.sound.domain.Criteria;


public interface PjBoardService {
	
	public int totalCntBoard();
	public List<PjBoard> selectBoardList(Criteria cri);
	public int updateCnt(int b_no);
	public PjBoard selectBoard(int b_no);
	public int checkLike(Member member, PjBoard board);
	public int insertLike(Member member, PjBoard board);
	public int deleteLike(Member member, PjBoard board);

}
