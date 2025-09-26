
package com.fundee.pro;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//------------------------09/23
@Controller
public class NotLoginedController {
	
	@RequestMapping("/notLogined.do")
	public String notLogined(@RequestParam int posts_num,
	                         HttpSession session,
	                         HttpServletRequest req) {
	   
		//로그인 후 가야 하는 주소
		//${pageContext.request.contextPath} 펀딩하기 주소에 이미 찍어 뒀으니 여기에 또 찍으면 
		//중복으로 찍힘 pro/pro 이렇게
	    String target = "/buyForm.do?posts_num=" + posts_num;
	    
	    // 세션에 "로그인 후 돌아갈 주소"를 저장해 둠
	    session.setAttribute("redirectAfterLogin", target);

	    return "loginForm"; 
	}
	//------------------------09/23
	
	
	
	
	
	
	
	
	
	
	
	

}
