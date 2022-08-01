package kh.spring.pisic.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.qna.domain.QnaBoard;
import kh.spring.pisic.qna.domain.Criteria;
import kh.spring.pisic.qna.domain.QnaPaging;
import kh.spring.pisic.qna.model.service.*;


@Controller
@RequestMapping("/qna")
public class QnaController {
	private static final Logger Logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaService service;

	// QNA 리스트 / 페이징처리
	@GetMapping("/qnaList")
	public ModelAndView pageSelectQna(ModelAndView mv, Criteria cr
			, Authentication auth) {
        
     // 현재 사용자 id
     UserDetails ud = (UserDetails)auth.getPrincipal();
     String uid = ud.getUsername();
		Logger.info(cr.toString());
		
		QnaPaging qnaPaging = new QnaPaging(cr, service.totalQnaBoard(uid)); 
		mv.addObject("qnaPaging", qnaPaging);
		mv.addObject("qnalist", service.pageSelectQna(qnaPaging, uid));
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
	
	//QNA 작성하기
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
//	         , @RequestParam(name="gr_ord", defaultValue = "0") String gr_ord
	         , QnaBoard qnaBoard
	         , HttpServletRequest req
	         , HttpSession session
	         , RedirectAttributes rttr
	         , Authentication auth
	         )  {
	      // 현재 사용자 id
	      UserDetails ud = (UserDetails)auth.getPrincipal();
	      String uid = ud.getUsername();
	      
	      qnaBoard.setM_id(uid);
	      
	      int result = service.insertQna(qnaBoard);
	      if(result > 1)
	         mv.setViewName("redirect:/qna/qnaList");
	      else
	         mv.setViewName("redirect:/qna/qnaList");
	      return mv;
	   }
		
		// QNA 수정페이지로 이동
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
				e.printStackTrace();
			}
			mv.setViewName("qna/qnaUpdate");
			return mv;
		}
		
		// QNA 수정하기
		@PostMapping("/qnaUpdateDo")
		public ModelAndView pageUpdateQnaDo(ModelAndView mv
				, @RequestParam(name="qna_no", required = false) String qna_no 
				, QnaBoard qnaBoard
				, HttpServletRequest req
				, HttpSession session
				, RedirectAttributes rttr
				, Authentication auth
				) {
			 // 현재 사용자 id
		      UserDetails ud = (UserDetails)auth.getPrincipal();
		      String uid = ud.getUsername();
		      qnaBoard.setM_id(uid);
		      
		  	// DB  update
				int result = service.updateQna(qnaBoard);
				System.out.println("[냐냐]: 똑똑?");
				
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
			
		
			mv.addObject("qna_no", qna_no);
			mv.setViewName("redirect:/qna/qnaRead");
			return mv;

		}
		
		// QNA 삭제
		@ResponseBody
		@PostMapping(value="/delete")
		public int deleteQna(
				@RequestParam(name="qna_no", required = false) int qna_no 
				) throws Throwable {
			int result = service.deleteQna(qna_no);
			// ajax인 경우 페이지 이동 설정이 필요없음. 이동할 데이터를 return에 실어주면됨.
//			String msg="";
			if (result == 0) {
				return 0;

			} else {
				return 1;
			}
//			if(result>0) {
//				msg= "게시글 "+qna_no+"번 삭제되었습니다.";
//			}else {
//				msg="게시글이 삭제되지 못했습니다. 다시 확인하고 삭제해주세요.";
//			}
//			return msg;
//		}
//		
		
		}
		

}
