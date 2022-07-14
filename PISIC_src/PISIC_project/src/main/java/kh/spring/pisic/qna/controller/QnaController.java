package kh.spring.pisic.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.qna.model.service.*;
import kh.spring.pisic.qna.model.service.QnaServiceImpl;

@Controller
@RequestMapping("/qna")
public class QnaController {
	private static final Logger Logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaService service;

	
	@GetMapping("/qnaList")
	public ModelAndView pageSelectQna(ModelAndView mv) {
		List<QnaBoard> qnalist = service.pageSelectQna();
		mv.addObject("qnalist", qnalist);
		mv.setViewName("qna/qnaList");
		return mv;
	}
//	문의글은 아무나 보지 못하도록 post
	@PostMapping("/qnaRead")
	public ModelAndView selectQnaBoard(ModelAndView mv
			, @RequestParam(name="qna_no", required = false) String qna_no  
			)  throws Throwable{
		if(qna_no == null) {
			mv.setViewName("redirect:qna/qnaList");
			return mv;
		}
		mv.addObject("qnaBoard", service.selectQnaBoard(qna_no));
		mv.setViewName("qna/qnaRead");
		return mv;
	}
	
	//0713시작

	@GetMapping("/qnaWrite")
	public ModelAndView pageInsertQna(ModelAndView mv
			, @RequestParam(name="gr_ord", defaultValue = "0") String gr_ordStr
			)  {
		int gr_ord = 0;
		try {
			gr_ord = Integer.parseInt(gr_ordStr);
		}catch (Exception e) {
		}
		mv.addObject("gr_ord", gr_ord);
		mv.setViewName("qna/qnaWrite");
		return mv;
	}
	
	@PostMapping("/qnaWrite")
	public ModelAndView insertQna(ModelAndView mv
//			, @RequestParam(name="gr_ord", defaultValue = "0") String gr_ord
			, QnaBoard qnaBoard
			, @RequestParam(name="uploadfile", required = false) MultipartFile multiFile
			, HttpServletRequest req
			, HttpSession session
			, RedirectAttributes rttr
			)  {
		Member loginInfo = (Member)session.getAttribute("loginSsInfo");
		if(loginInfo == null) {
			rttr.addFlashAttribute("msg", "로그인 후 글쓰기를 다시 시도해 주세요.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		
		qnaBoard.setM_id(loginInfo.getM_id());
		
		int result = service.insertQna(qnaBoard);
		if(result > 1)
			mv.setViewName("redirect:/qna/qnaList");
		else
			mv.setViewName("redirect:/qna/qnaList");
		return mv;
	}
		
		//수정
		@PostMapping("/qnaUpdate")
		public ModelAndView pageUpdateQna(ModelAndView mv
				, @RequestParam(name="qna_no", required = false) String qna_no  
				) {
			if(qna_no == null) {
				mv.setViewName("redirect:/qna/qnaList");
				return mv;
			}
			try {
				mv.addObject("qnaBoard", service.selectQnaBoard(qna_no));
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mv.setViewName("qna/qnaUpdate");
			return mv;
		}
		
		@PostMapping("/qnaUpdateDo")
		public ModelAndView updateQna(ModelAndView mv
				, @RequestParam(name="qna_no", required = false) String qna_no 
				, QnaBoard qnaBoard
				, HttpServletRequest req
				, HttpSession session
				, RedirectAttributes rttr
				) {
			
			// 예외처리
			if(qna_no == null) {
				mv.setViewName("redirect:/qna/qnaList");
				return mv;
			}
			// 예외처리 - 로그인
			Member loginInfo = (Member)session.getAttribute("loginSsInfo");
			if(loginInfo == null) {
				rttr.addFlashAttribute("msg", "로그인 후 글쓰기를 다시 시도해 주세요.");
				mv.setViewName("redirect:/member/login");
				return mv;
			}
			
			// DB  update
			int result = service.updateQna(qnaBoard);
			System.out.println("[냐냐]: 똑똑?");
			mv.addObject("qna_no", qna_no);
			mv.setViewName("redirect:/qna/qnaRead");
			return mv;

		}
		
		@PostMapping(value="/delete", produces = "text/plain;charset=UTF-8")
		@ResponseBody
		public String deleteQna(
				@RequestParam(name="qna_no", required = false) String qna_no 
				) {
			int result = service.deleteQna(qna_no);
			// ajax인 경우 페이지 이동 설정이 필요없음. 이동할 데이터를 return에 실어주면됨.
			String msg="";
			if(result>0) {
				msg= "게시글 "+qna_no+"번 삭제되었습니다.";
			}else {
				msg="게시글이 삭제되지 못했습니다. 다시 확인하고 삭제해주세요.";
			}
			return msg;
		}
}
