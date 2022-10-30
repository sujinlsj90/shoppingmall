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

import com.spring.pj_117_lsj.service.AdminServiceImpl;

@Controller
public class AdminController {
	@Autowired
	AdminServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(MyAccountController.class);
	
	//구매목록
	@RequestMapping("orderConfirmList.ad")
	public String orderConfirmList(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("[url ==> orderList.my]");
		service.orderConfirmListAction(req, model);
		return "admin/order/orderconfirm";
	}
	
	//관리자 주문승인
	@RequestMapping("updateOrderStateAction.ad")
	public void updateOrderStateAction(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("[url ==> updateOrderStateAction.ad]");
		service.updateOrderAction(req, model);
		String viewPage = req.getContextPath() + "/orderConfirmList.ad";
		res.sendRedirect(viewPage);
	}
	
	//관리자 판매완료 내역
	@RequestMapping("outSoldList.ad")
	public String outSoldList(HttpServletRequest req,Model model) 
			throws ServletException, IOException{
		logger.info("[url ==> outSoldList.ad]");
		service.adminOutSoldListAction(req, model);
		return "admin/order/outSoldList";
	}
	
	//관리자 환불 승인 리스트	
	@RequestMapping("refundlist.ad")
	public String refundlist(HttpServletRequest req,Model model) 
			throws ServletException, IOException{
		logger.info("[url ==> refundlist.ad]");
		service.refundListAction(req, model);
		return "admin/order/refundlist";
	}
	
	//환불 승인하기		
	@RequestMapping("updateRefundStateAction.ad")
	public void updateRefundStateAction(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("[url ==> updateRefundStateAction.ad]");
		service.updateRefundStateAction(req, model);
		String viewPage = req.getContextPath() + "/refundlist.ad";
		res.sendRedirect(viewPage);
	}
	
	//환불완료 리스트
	@RequestMapping("refundEnd.ad")
	public String refundEnd(HttpServletRequest req,Model model) 
			throws ServletException, IOException{
		logger.info("[url ==> refundEnd.ad]");
		service.refundEndListAction(req, model);
		return "admin/order/refundEnd";
	}
	
	//결산	
	@RequestMapping("balance.ad")
	public String balance(HttpServletRequest req,Model model) 
			throws ServletException, IOException{
		logger.info("[url ==> balance.ad]");
		service.balaceListAction(req, model);
		return "admin/member/balance";
	}
	
	//관리자 환불 승인 리스트	
	@RequestMapping("member.ad")
	public String member(HttpServletRequest req,Model model) 
			throws ServletException, IOException{
		logger.info("[url ==> member.ad]");
		service.memberListAction(req, model);
		return "admin/member/member";
	}
	
	//결산차트 컨트롤러	
	@RequestMapping("balanceChart.ad")
	public String balanceChart(HttpServletRequest req,Model model) 
			throws ServletException, IOException{
		logger.info("[url ==> member.ad]");
		service.balanceChart(req, model);
		return "admin/member/balancechart";
	}
	
	
//	//환불신청
//	@RequestMapping("refundAction.my")
//	public void refundAction(HttpServletRequest req, HttpServletResponse res, Model model) 
//			throws ServletException, IOException {
//		logger.info("[url ==> refundAction.my]");
//		service.refundAction(req, model);
//		String viewPage = req.getContextPath() + "/orderList.my";
//		res.sendRedirect(viewPage);
//	}
//	

}
