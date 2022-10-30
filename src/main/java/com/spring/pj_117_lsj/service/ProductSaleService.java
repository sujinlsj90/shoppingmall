package com.spring.pj_117_lsj.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import java.io.IOException;

import javax.servlet.ServletException;

public interface ProductSaleService {
	
	//판매 - 상품판매리스트: category
	public void shopListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//판매 - 상품세부
	public void shopDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//장바구니 - 상품선택결과(total)
	public void shopTotalAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	//장바구니  담기
	public void cartInsertAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	//장바구니 목록
	public void cartListAction (HttpServletRequest req, Model model)
			throws ServletException, IOException;
	

	//장바구니 수정 (전체)
	public void cartUpdateAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	
	//장바구니 수정 (개별)
	public void cartUpdateOneAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//장바구니 삭제 (체크박스)
	public void cartDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	
	//장바구니 삭제 (개별)
	public void cartDeleteOneAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//장바구니 -> 주문하기목록 추가(전체)
	public void buyInsertAction (HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	
	//장바구니 -> 주문하기목록 추가(checked)
	public void checkedBuyAction (HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	
	//장바구니 비우기
	public void deleteCartAll(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//바로구매하기
	public void buyNowAction (HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//주문하기목록
	public void buyListAction (HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//주문하기목록 삭제(체크박스)
	public void chkOutDeleteAction (HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	//주문하기 목록 -> 구매완료목록 추가
	public void accountInsertAction (HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 주문하기목록 비우기
	public void deletechkOutAll (HttpServletRequest req, Model model)
			throws ServletException, IOException;
	

	
}