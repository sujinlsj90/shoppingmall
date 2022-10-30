package com.spring.pj_117_lsj.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import java.io.IOException;

import javax.servlet.ServletException;

public interface AdminService {

	// 주문목록
	public void orderConfirmListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;

	// 주문상태변경 시 상품판매완료 페이지로 이동 및 재고 반영
	public void updateOrderAction(HttpServletRequest req, Model model) throws ServletException, IOException;


	// 판매완료목록 -- 관리자
	public void adminOutSoldListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 환불신청목록
	public void refundListAction(HttpServletRequest req, Model model) throws ServletException, IOException;
	
	// 환불승인
	public void updateRefundStateAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;

	//환불완료목록
	public void refundEndListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//결산목록
	public void balaceListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//결산목록
	public void balanceChart(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//회원리스트
	public void memberListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	
	


}
