package kh.spring.pisic.pjboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.member.model.service.MemberService;
import kh.spring.pisic.mymusic.model.service.MyMusicService;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.pjboard.domain.PjBoardRecomment;
import kh.spring.pisic.pjboard.domain.PjBoardReport;
import kh.spring.pisic.pjboard.model.service.PjBoardService;
import kh.spring.pisic.sound.domain.Criteria;
import kh.spring.pisic.sound.domain.Paging;

@Controller
@RequestMapping("/pjBoard")
public class PjBoardController {
	private static final Logger Logger = LoggerFactory.getLogger(PjBoardController.class);
	
	@Autowired
	private PjBoardService service;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MyMusicService mymusicService;
	
	// 글목록 - 페이징
	@GetMapping("/list")
	public ModelAndView mainSelectPj(ModelAndView mv, Criteria cri) {
		
		// 페이징 - 읽어올 갯수 설정
		cri.setAmount(6);
		
		// 페이징 처리 후 목록 불러오기
		Paging paging = new Paging(cri, service.totalCntBoard());
        mv.addObject("paging", paging);
		mv.addObject("boardList", service.selectBoardList(cri));
		mv.setViewName("pjBoard/list");
		return mv;
	}
	
	// 글 상세조회 페이지로 이동
	@GetMapping("/read")
	public ModelAndView readBoard(
			ModelAndView mv
			, PjBoard pjBoard
			, Authentication auth) {
		// 조회수 증가
		service.updateCnt(pjBoard.getB_no());
		
		// 상세 페이지 불러오기
		if(auth != null) {
			UserDetails ud = (UserDetails)auth.getPrincipal();
			Member member = memberService.selectLoginMember(ud.getUsername());
			mv.addObject("member", member);
		}
		// 개행 문자 처리
//		PjBoard result = service.selectBoard(pjBoard.getB_no());
//		result.getB_content().replaceAll("\n", "<br>");
		
		mv.addObject("board", service.selectBoard(pjBoard.getB_no()));
		mv.setViewName("pjBoard/read");
		return mv;
	}
	
	// 글쓰기 페이지로 이동
	@GetMapping("/write")
	public ModelAndView pageInsertBoard(ModelAndView mv
			, Authentication auth
			){
		UserDetails ud = (UserDetails)auth.getPrincipal();
		mv.addObject("mymusicList", mymusicService.selectPlaylist(ud.getUsername()));
		mv.setViewName("pjBoard/write");
		return mv;
	}
	
	// 글쓰기
	@PostMapping("/write")
	public ModelAndView InsertBoard(ModelAndView mv
			, Authentication auth
			, PjBoard pjboard
			, RedirectAttributes rttr
			){
		UserDetails ud = (UserDetails)auth.getPrincipal();
		Member member = memberService.selectLoginMember(ud.getUsername());
		if(service.insertBoard(member, pjboard) < 1) {
			rttr.addFlashAttribute("msg", "글쓰기에 실패했습니다. 다시 시도해주세요.");
			mv.setViewName("redirect:/pjBoard/write");
		} else {
			rttr.addFlashAttribute("msg", "글쓰기에 성공했습니다.");
			mv.setViewName("redirect:/pjBoard/list");
		}
		mv.setViewName("redirect:/pjBoard/list");
		return mv;
	}
	
	// 글 수정 - 페이지 이동
	@PostMapping("/update")
	public ModelAndView pageUpdateBoard(
			ModelAndView mv
			, PjBoard pjBoard
			, Authentication auth
			) {
		
		UserDetails ud = (UserDetails)auth.getPrincipal();
		mv.addObject("mymusicList", mymusicService.selectPlaylist(ud.getUsername()));
		mv.addObject("board", service.selectBoard(pjBoard.getB_no()));
		mv.setViewName("pjBoard/update");
		return mv;
	}
	
	// 글 수정
	@PostMapping("/update.do")
	public ModelAndView updateBoard(
			ModelAndView mv
			, PjBoard pjBoard
			, Authentication auth
			, RedirectAttributes rttr
			) {
		
		if(service.updateBoard(pjBoard) < 1) { 
			rttr.addFlashAttribute("msg", "글수정에 실패했습니다. 다시 시도해주세요.");
			mv.setViewName("redirect:/pjBoard/list");
		} else {
			rttr.addFlashAttribute("msg", "글을 수정했습니다.");
			mv.setViewName("redirect:/pjBoard/list");
		}
		mv.setViewName("redirect:/pjBoard/list");
		return mv;
	}
	
	// 글 삭제 
	@PostMapping("/delete")
	public ModelAndView deleteBoard(
			ModelAndView mv
			, PjBoard pjBoard
			, RedirectAttributes rttr
			) {
		if(service.deleteBoard(pjBoard.getB_no()) < 1) {
			rttr.addFlashAttribute("msg", "글 삭제에 실패했습니다. 다시 시도해주세요.");
		} else {
			rttr.addFlashAttribute("msg", "글을 삭제했습니다.");
		}
		mv.setViewName("redirect:/pjBoard/list");
		return mv;
	}
	
	
	// 게시글 좋아요 - ajax
	@PostMapping(value = "/like", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String boardLike(PjBoard board, Authentication auth) {
		String resultAjax = "";
		if(auth != null) {
			UserDetails ud = (UserDetails)auth.getPrincipal();
			
			// 좋아요 여부 확인
			Member member = memberService.selectLoginMember(ud.getUsername());
			if(service.checkLike(member, board) > 0) { // 좋아요가 되어있는 경우
				int result = service.deleteLike(member, board);
				if(result < 1) { // 좋아요 취소 실패
					resultAjax = "-1";
				} else { // 좋아요 취소 성공
					resultAjax = "0";
				}
			} else { // 좋아요가 안되어있는 경우
				int result = service.insertLike(member, board);
				if(result < 1) { // 좋아요 실패
					resultAjax = "1";
				} else { // 좋아요 성공
					resultAjax = "2";
				}
			}
		} else {
			resultAjax = "-2";
		}
		return resultAjax;
	}
	
	// 게시글 댓글 등록 - ajax
	@PostMapping(value = "/insertRecomment", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertRecomment(PjBoardRecomment pjBoardRecomment, Authentication auth) {
		
		String resultAjax = "";
		if(auth == null) {
			resultAjax = "-1";
		} else {
			UserDetails ud = (UserDetails)auth.getPrincipal();
			Member member = memberService.selectLoginMember(ud.getUsername());
			// 댓글 등록
			int result = service.insertPjBoardRecomment(member, pjBoardRecomment);
			if(result < 1) { // 댓글 등록 실패
				resultAjax = "0"; 
			} else { // 댓글 등록 성공
				resultAjax = "1";
			}
		}
		
		
		return resultAjax;
	}
	
	// 게시글 댓글 삭제 - ajax
	@PostMapping(value = "/deleteRecomment", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteRecomment(PjBoardRecomment pjBoardRecomment, Authentication auth) {
		UserDetails ud = (UserDetails)auth.getPrincipal();
		Member member = memberService.selectLoginMember(ud.getUsername());
		String resultAjax = "";
		// 댓글 삭제
		int result = service.deletePjBoardRecomment(member, pjBoardRecomment);
		if(result < 1) { // 댓글 삭제 실패
			resultAjax = "0"; 
		} else { // 댓글 삭제 성공
			resultAjax = "1";
		}
		
		return resultAjax;
	}
	
	// 게시글 신고하기 - ajax
	@PostMapping("/report")
	@ResponseBody
	public String reportBoard(PjBoardReport report, Authentication auth) {
		String resultAjax = "";
		if(auth != null) {
			UserDetails ud = (UserDetails)auth.getPrincipal();
			
			// 신고 여부 확인
			report.setM_id(ud.getUsername());
			if(service.checkReport(report) > 0) { // 이미 신고 했음
				resultAjax = "0";
			} else { // 처음 신고
				int result = service.insertReport(report);
				if(result < 1) { // 신고 실패
					resultAjax = "1";
				} else { // 신고 성공
					resultAjax = "2";
				}
			}
		} else { // 로그인 풀렸을때
			resultAjax = "-1";
		}
		return resultAjax;
	}
	

	
}
