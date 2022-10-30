package com.spring.pj_117_lsj.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.pj_117_lsj.service.CustomerServiceImpl;

@Controller
public class CustomerController {
	@Autowired
	CustomerServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@RequestMapping("index.do")
	public String main() {
		logger.info("[url ==> index.do]");
		
		return "common/index";
	}
	//----------[회원가입]-----------
	   @RequestMapping("join.do")
	   public String join() {
	      logger.info("[url ==> join.do]");
	      
	      return "customer/join/join";
	   }
	   
		
	//   회원가입처리 - 시큐리티(비밀번호 암호화)
	   @RequestMapping("joinAction.do")
	   public String joinAction(HttpServletRequest req, Model model) {
		   logger.info("[url ==> join.do]");
		   service.signInAction(req, model);
		   
		   return "customer/join/joinAction";
	   }
	   
	   
	// 시큐리티 - 가입성공시 이메일인증을 위한 이메일 전송
	//  CustomerDAOImpl의 sendEmail(String email, String Key)를 호출
	   @RequestMapping("emailChkAction.do")
	   public String emailChk(HttpServletRequest req,  Model model) {
	      logger.info("[url ==> emailChkAction.do]");
	      
	      service.emailChkAction(req, model);
	      return "customer/join/emailChkAction";
	   }     
	   
	   
	//   중복확인처리
	   @RequestMapping("confirmIdAction.do")
	   public String confirmIdAction(HttpServletRequest req, Model model) {
		   logger.info("[url => /confirmIdAction.do]");
		   service.confirmIDAction(req, model);
		   return "customer/join/confirmIdAction";
	   }
	   
    //   로그인
	   @RequestMapping("login.do")
	   public String login (HttpServletRequest req, Model model) {
		   logger.info("[url => /login.do]");
		   return "customer/login/login";
	   }
	   
	//로그아웃   
	   @RequestMapping("logout.do")
	   public String logout (HttpServletRequest req, Model model) {
		   logger.info("[url => /logout.do]");
		   req.getSession().invalidate();
		   return "common/index";
	   }
	//회원탈퇴처리
	   @RequestMapping("deleteCustomerAction.do")
	   public String deleteCustomerAction (HttpServletRequest req, Model model) {
		   logger.info("[url => /deleteCustomerAction.do]");
		   service.deleteCustomerAction(req, model);
		   return "customer/mypage/deleteCustomerAction";
	   }
	//회원수정 - 상세페이지
	   @RequestMapping("modifyDetailAction.do")
	   public String modifyDetailAction (HttpServletRequest req, Model model) {
		   logger.info("[url => /modifyDetailAction.do]");
		   service.modifyDetailAction(req, model);
		   return "customer/mypage/modifyDetailAction";
	   }
	//회원수정 - 시큐리티(비밀번호 암호화)
	   @RequestMapping("modifyCustomerAction.do")
	   public String modifyCustomerAction (HttpServletRequest req, Model model) {
		   logger.info("[url => /modifyCustomerAction.do]");
		   service.modifyCustomerAction(req, model);
		   return "customer/mypage/modifyCustomerAction";
	   }
	
	
}
