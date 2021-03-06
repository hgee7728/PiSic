package kh.spring.pisic.pjboard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.pjboard.domain.PjBoardRecomment;
import kh.spring.pisic.pjboard.domain.PjBoardReport;
import kh.spring.pisic.pjboard.model.dao.PjBoardDao;
import kh.spring.pisic.sound.domain.Criteria;

@Service
public class PjBoardServiceImpl implements PjBoardService{
	
	@Autowired
	private PjBoardDao dao;
	
	
	// 글의 총 갯수 - 페이징
	@Override
	public int totalCntBoard() {
		return dao.totalCntBoard();
	}

	// 글 목록 조회 - 페이징
	@Override
	public List<PjBoard> selectBoardList(Criteria cri) {
		return dao.selectBoardList(cri);
	}

	// 글 조회수 증가
	@Override
	public int updateCnt(int b_no) {
		return dao.updateCnt(b_no);
	}
	
	// 글 상세조회
	@Override
	public PjBoard selectBoard(int b_no) {
		return dao.selectBoard(b_no);
	}

	// 글 좋아요 확인
	@Override
	public int checkLike(Member member, PjBoard pjBoard) {
		return dao.checkLike(member, pjBoard);
	}

	// 글 좋아요 - ajax
	@Override
	public int insertLike(Member member, PjBoard pjBoard) {
		return dao.insertLike(member, pjBoard);
	}

	// 글 좋아요 취소
	@Override
	public int deleteLike(Member member, PjBoard pjBoard) {
		return dao.deleteLike(member, pjBoard);
	}

	// 게시글 댓글 쓰기- ajax
	@Override
	public int insertPjBoardRecomment(Member member, PjBoardRecomment pjBoardRecomment) {
		return dao.insertPjBoardRecomment(member, pjBoardRecomment);
	}

	// 게시글 댓글 삭제 - ajax
	@Override
	public int deletePjBoardRecomment(Member member, PjBoardRecomment pjBoardRecomment) {
		return dao.deletePjBoardRecomment(member, pjBoardRecomment);
	}

	// 글쓰기
	@Override
	public int insertBoard(Member member, PjBoard pjBoard) {
		return dao.insertBoard(member, pjBoard);
	}

	// 글 수정
	@Override
	public int updateBoard(PjBoard pjBoard) {
		return dao.updateBoard(pjBoard);
	}

	// 글 삭제
	@Override
	public int deleteBoard(int b_no) {
		return dao.deleteBoard(b_no);
	}

	// 게시글 신고 여부 확인
	@Override
	public int checkReport(PjBoardReport report) {
		return dao.checkReport(report);
	}

	// 게시글 신고
	@Override
	public int insertReport(PjBoardReport report) {
		return dao.insertReport(report);
	}
	
	
	

	
}
