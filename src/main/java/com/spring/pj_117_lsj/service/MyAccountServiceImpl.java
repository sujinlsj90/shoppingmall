package com.spring.pj_117_lsj.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.pj_117_lsj.dao.MyAccountDAOImpl;
import com.spring.pj_117_lsj.dto.MyAccountDTO;
import com.spring.pj_117_lsj.dto.SoldDTO;



@Service
public class MyAccountServiceImpl implements MyAccountService{
	@Autowired
	MyAccountDAOImpl dao;

	
	//구매완료 목록
	@Override
	public void accountListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("service =>accountListAction");
		String customerId = (String)req.getSession().getAttribute("customerId");
		 
		List<MyAccountDTO> list = null;
		list = dao.Orderlist(customerId);
		
		req.setAttribute("list", list);
	}

	//구매완료된 상품에 대한 환불신청
	@Override
	public void refundAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>refundAction");
		int soldNo = Integer.parseInt(req.getParameter("soldNo"));
		
		String soldState = dao.checkOrderList(soldNo); //status확인
		System.out.println("service.soldState: " + soldState);
		if (soldState.equals("환불신청") || soldState.equals("환불완료")) { //환불진행중, 환불 승인된 상태에서는 환불 불가
			System.out.println("환불신청불가");
		} else {
			dao.refundRequest(soldNo);	// state를 환불신청으로 변경 후 환불신청으로 바뀐 해당 데이터를 환불목록에 추가
			dao.refundInsert(soldNo);	
		}
	}
	
	// 구매완료 리스트 : customer
	@Override
	public void outSoldListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		String customerId = (String) req.getSession().getAttribute("customerId");

		List<SoldDTO> list = dao.outSoldList(customerId);

		req.setAttribute("list", list);

	}




}
