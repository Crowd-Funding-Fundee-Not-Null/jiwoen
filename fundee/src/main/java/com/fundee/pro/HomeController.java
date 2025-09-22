package com.fundee.pro;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
		//Ȩ�� ȭ�� ���� ����
		@RequestMapping("/index") public String index(){return "index";}
		@RequestMapping("/home") public String home(){ return "home"; }
	    @RequestMapping("/about") public String about(){ return "about"; }
	    @RequestMapping("/book") public String book(){ return "book"; }
	    @RequestMapping("/notice") public String notice(){ return "notice"; }
	    @RequestMapping("/menu") public String menu(){ return "menu"; }
	    @RequestMapping("/notice/detail") public String noticeDetail(){ return "notice_detail"; }
	    @RequestMapping("/notice/write") public String noticeWrite(){ return "notice_write"; }
	    @RequestMapping("/loginForm") public String loginForm(){ return "loginForm"; }
	    @RequestMapping("/join") public String join(){ return "join"; }
	    @RequestMapping("/find_id") public String find_id(){ return "find_id"; }
	    @RequestMapping("/find_id_ok") public String find_id_ok(){ return "find_id_ok"; }
	    @RequestMapping("/find_pwd") public String find_pwd(){ return "find_pwd"; }
	    @RequestMapping("/find_pwd_ok") public String find_pwd_ok(){ return "find_pwd_ok"; }
	   

		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String home(Model model) {	
			
			return "index";
		}	
	
}
