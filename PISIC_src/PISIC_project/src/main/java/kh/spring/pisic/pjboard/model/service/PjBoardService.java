package kh.spring.pisic.pjboard.model.service;

import java.util.List;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.pjboard.domain.PjBoardRecomment;
import kh.spring.pisic.sound.domain.Criteria;


public interface PjBoardService {
	
	public int totalCntBoard();
	public List<PjBoard> selectBoardList(Criteria cri);
	public int updateCnt(int b_no);
	public PjBoard selectBoard(int b_no);
	public int checkLike(Member member, PjBoard pjBoard);
	public int insertLike(Member member, PjBoard pjBoard);
	public int deleteLike(Member member, PjBoard pjBoard);
	public int insertPjBoardRecomment(Member member, PjBoardRecomment pjBoardRecomment);
	public int deletePjBoardRecomment(Member member, PjBoardRecomment pjBoardRecomment);
	public int insertBoard(Member member, PjBoard pjBoard);
	public int updateBoard(PjBoard pjBoard);
	public int deleteBoard(int b_no);

}
