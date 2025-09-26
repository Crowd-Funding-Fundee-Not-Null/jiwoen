
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
	   
		//�α��� �� ���� �ϴ� �ּ�
		//${pageContext.request.contextPath} �ݵ��ϱ� �ּҿ� �̹� ��� ������ ���⿡ �� ������ 
		//�ߺ����� ���� pro/pro �̷���
	    String target = "/buyForm.do?posts_num=" + posts_num;
	    
	    // ���ǿ� "�α��� �� ���ư� �ּ�"�� ������ ��
	    session.setAttribute("redirectAfterLogin", target);

	    return "loginForm"; 
	}
	//------------------------09/23
	
	
	
	
	
	
	
	
	
	
	
	

}
