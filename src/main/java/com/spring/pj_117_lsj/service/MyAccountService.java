	package com.spring.pj_117_lsj.service;

	import java.io.IOException;

	import javax.servlet.ServletException;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

	public interface MyAccountService {
		
		
		// 구매완료 목록
		public void accountListAction (HttpServletRequest req, Model model)
				throws ServletException, IOException;

		// 환불신청
		public void refundAction(HttpServletRequest req, Model model)
				throws ServletException, IOException;
		
		// 구매완료목록 -- 고객
		public void outSoldListAction(HttpServletRequest req, Model model) throws ServletException, IOException;
		
		
	}
