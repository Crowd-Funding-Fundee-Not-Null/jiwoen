package com.fundee.pro;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fundee.dao.MypageDAO;
import com.fundee.dto.LoginDTO;

@Controller
public class MyPageController {

	@Autowired
	MypageDAO mypageDAO;
	
	
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model){
	    String loginId = (String) session.getAttribute("loginId");
	    if(loginId == null){
	        return "redirect:/loginForm.do"; // 로그인 안 했으면 로그인 페이지로 보냄
	    }
	    model.addAttribute("me", mypageDAO.findById(loginId));
	    return "mypage"; // /WEB-INF/views/mypage.jsp 열기
	}
	
	//회원가입 할 때 중복 값 입력을 막았지만 정보 수정 할 때 수정 될 수 있다. 그걸 막는 부분
	@RequestMapping(value = "/mypage/update.do", method = RequestMethod.POST)
	public String updateMyInfo(@ModelAttribute LoginDTO form,
            @RequestParam("verifyPassword") String verifyPassword,
            @RequestParam(value="newPassword", required=false) String newPassword,
            @RequestParam(value="newPasswordConfirm", required=false) String newPasswordConfirm,
            HttpSession session,
            RedirectAttributes ra){
		
	String loginId = (String) session.getAttribute("loginId");
	
	if(loginId == null){
	return "redirect:/loginForm.do"; // 로그인 안 했으면 막기
	}
	
	//사용자는 nickname, email 같은 자기 정보만 바꿀 수 있음 
    //다른 사람의 id로 조작해서는 절대 수정 불가능 
	//수정 할 때 로그인 한 아이디로만 수정 할 수 있게 세션에서 로그인 정보를 불러옴
	form.setId(loginId);
	form.setPassword(null);
	
	//비밀번호 수정하는 공간
	 if (newPassword != null && !newPassword.trim().isEmpty()) {
	        if (!newPassword.equals(newPasswordConfirm)) {
	            ra.addFlashAttribute("message", "새 비밀번호 확인이 일치하지 않습니다.");
	            return "redirect:/mypage.do";
	        }
	        newPassword = newPassword.trim();
	    } else {
	        newPassword = null; // 미입력 → 비번 변경 안 함
	    }

	    try {
	        //현재 비번이 맞아야 업데이트. 새 비번이 있으면 함께 변경.
	        int r = mypageDAO.updateMyInfoWithPwAndMaybePassword(form, verifyPassword, newPassword);

	        if (r == 0) {
	            ra.addFlashAttribute("message", "비밀번호가 일치하지 않습니다.");
	        } else {
	            ra.addFlashAttribute("message", "수정 완료!");
	        }
	      //DuplicateKeyException db에서 중복 되어 있는지 확인해서 중복 값 입력 막는 부분
	    } catch (org.springframework.dao.DuplicateKeyException e) {
	        ra.addFlashAttribute("message", "이미 사용 중인 이메일/닉네임입니다.");
	    }
	    return "redirect:/mypage.do";
	}
	
	
	/*
	 @RequestMapping("/userpage.do")
	    public String userpage() {
	        return "userpage"; 
	    }
	*/
	
	//로그인 후 메인이 아닌 유저 페이지로 돌아가 라고 말하는 자리
	@RequestMapping(value = "/userpage.do", method = RequestMethod.GET)
	public String userpage(HttpSession session, Model model) {
	    String loginId = (String) session.getAttribute("loginId");
	    
	    if (loginId == null) {
	        // 로그인 후 돌아올 주소를 기록
	        session.setAttribute("redirectAfterLogin", "/userpage.do");
	        return "loginForm"; // 로그인 페이지 열기
	    }

	    // 로그인된 경우: 사용자 정보 조회
	    model.addAttribute("me", mypageDAO.findById(loginId));
	    return "userpage"; // /WEB-INF/views/userpage.jsp 열기
	}

	
	
	
	
	
	
}
