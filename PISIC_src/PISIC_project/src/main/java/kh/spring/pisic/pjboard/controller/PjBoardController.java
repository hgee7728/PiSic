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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.member.model.service.MemberService;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.pjboard.model.service.PjBoardService;
import kh.spring.pisic.sound.domain.Criteria;
import kh.spring.pisic.sound.domain.Paging;

@Controller
@RequestMapping("/pjlounge")
public class PjBoardController {
	private static final Logger Logger = LoggerFactory.getLogger(PjBoardController.class);
	
	@Autowired
	private PjBoardService service;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/list")
	public ModelAndView mainSelectPj(ModelAndView mv, Criteria cri) {
		
		// 페이징 - 읽어올 갯수 설정
		cri.setAmount(6);
		
		// 페이징 처리 후 목록 불러오기
		Paging paging = new Paging(cri, service.totalCntBoard());
        mv.addObject("paging", paging);
		mv.addObject("boardList", service.selectBoardList(cri));
		mv.setViewName("pjlounge/pjlounge_list");
		return mv;
	}
	
	@GetMapping("/read")
	public ModelAndView readPjList(
			ModelAndView mv
			, PjBoard board) {
		
		// 조회수 증가
		service.updateCnt(board.getB_no());
		
		// 상세 페이지 불러오기
		mv.addObject("board", service.selectBoard(board.getB_no()));
		mv.setViewName("pjlounge/pjlounge_read");
		return mv;
	}
	
	@GetMapping("/pjlounge_write")
	public ModelAndView pageInsertPj(ModelAndView mv
			, @RequestParam(name="b_no", defaultValue = "0") String refnumStr
			)  throws Throwable {
		int b_no = 0;
		try {
			b_no = Integer.parseInt(refnumStr);
		}catch (Exception e) {
		}
		mv.addObject("b_no", b_no);
		mv.setViewName("pjlounge/pjlounge_write");
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
}
