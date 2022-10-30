package com.spring.pj_117_lsj.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.pj_117_lsj.service.MyAccountServiceImpl;

@Controller
public class MyAccountController {
	@Autowired
	MyAccountServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(MyAccountController.class);

	//구매목록
	@RequestMapping("orderList.my")
	public String orderList(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("[url ==> orderList.my]");
		service.accountListAction(req, model);
		return "customer/myaccount/order/orderList";
	}
	
	//환불신청
	@RequestMapping("refundAction.my")
	public void refundAction(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url ==> refundAction.my]");
		service.refundAction(req, model);
		String viewPage = req.getContextPath() + "/orderList.my";
		res.sendRedirect(viewPage);
	}
	
	//지난구매내역
	@RequestMapping("boughtList.my")
	public String boughtList(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("[url ==> boughtList.my]");
		service.outSoldListAction(req, model);
		return "customer/myaccount/order/boughtList";
	}
}
