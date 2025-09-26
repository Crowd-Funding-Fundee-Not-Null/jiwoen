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
	        return "redirect:/loginForm.do"; // �α��� �� ������ �α��� �������� ����
	    }
	    model.addAttribute("me", mypageDAO.findById(loginId));
	    return "mypage"; // /WEB-INF/views/mypage.jsp ����
	}
	
	//ȸ������ �� �� �ߺ� �� �Է��� �������� ���� ���� �� �� ���� �� �� �ִ�. �װ� ���� �κ�
	@RequestMapping(value = "/mypage/update.do", method = RequestMethod.POST)
	public String updateMyInfo(@ModelAttribute LoginDTO form,
            @RequestParam("verifyPassword") String verifyPassword,
            @RequestParam(value="newPassword", required=false) String newPassword,
            @RequestParam(value="newPasswordConfirm", required=false) String newPasswordConfirm,
            HttpSession session,
            RedirectAttributes ra){
		
	String loginId = (String) session.getAttribute("loginId");
	
	if(loginId == null){
	return "redirect:/loginForm.do"; // �α��� �� ������ ����
	}
	
	//����ڴ� nickname, email ���� �ڱ� ������ �ٲ� �� ���� 
    //�ٸ� ����� id�� �����ؼ��� ���� ���� �Ұ��� 
	//���� �� �� �α��� �� ���̵�θ� ���� �� �� �ְ� ���ǿ��� �α��� ������ �ҷ���
	form.setId(loginId);
	form.setPassword(null);
	
	//��й�ȣ �����ϴ� ����
	 if (newPassword != null && !newPassword.trim().isEmpty()) {
	        if (!newPassword.equals(newPasswordConfirm)) {
	            ra.addFlashAttribute("message", "�� ��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
	            return "redirect:/mypage.do";
	        }
	        newPassword = newPassword.trim();
	    } else {
	        newPassword = null; // ���Է� �� ��� ���� �� ��
	    }

	    try {
	        //���� ����� �¾ƾ� ������Ʈ. �� ����� ������ �Բ� ����.
	        int r = mypageDAO.updateMyInfoWithPwAndMaybePassword(form, verifyPassword, newPassword);

	        if (r == 0) {
	            ra.addFlashAttribute("message", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	        } else {
	            ra.addFlashAttribute("message", "���� �Ϸ�!");
	        }
	      //DuplicateKeyException db���� �ߺ� �Ǿ� �ִ��� Ȯ���ؼ� �ߺ� �� �Է� ���� �κ�
	    } catch (org.springframework.dao.DuplicateKeyException e) {
	        ra.addFlashAttribute("message", "�̹� ��� ���� �̸���/�г����Դϴ�.");
	    }
	    return "redirect:/mypage.do";
	}
	
	
	/*
	 @RequestMapping("/userpage.do")
	    public String userpage() {
	        return "userpage"; 
	    }
	*/
	
	//�α��� �� ������ �ƴ� ���� �������� ���ư� ��� ���ϴ� �ڸ�
	@RequestMapping(value = "/userpage.do", method = RequestMethod.GET)
	public String userpage(HttpSession session, Model model) {
	    String loginId = (String) session.getAttribute("loginId");
	    
	    if (loginId == null) {
	        // �α��� �� ���ƿ� �ּҸ� ���
	        session.setAttribute("redirectAfterLogin", "/userpage.do");
	        return "loginForm"; // �α��� ������ ����
	    }

	    // �α��ε� ���: ����� ���� ��ȸ
	    model.addAttribute("me", mypageDAO.findById(loginId));
	    return "userpage"; // /WEB-INF/views/userpage.jsp ����
	}

	
	
	
	
	
	
}
