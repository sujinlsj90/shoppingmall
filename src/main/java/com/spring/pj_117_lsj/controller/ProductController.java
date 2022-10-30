package com.spring.pj_117_lsj.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.pj_117_lsj.service.ProductServiceImpl;


@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	ProductServiceImpl service;
	
	//-------------상품관리
	
	//상품목록
	@RequestMapping("productList.st")
	public String productList (HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /productList.st]");
		service.productList(req, model);
		return "admin/stock/productlist";
	}
	
	//상품등록 화면
	@RequestMapping("productAdd.st")
	public String productAdd (HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("[url => /productAdd.st]");
		
		return "admin/stock/productAdd";
	}
	
	//상품등록 처리
	@RequestMapping("productAddAction.st")
	public String productAddAction (MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException {
		//매개변수 MultipartHttpServletRequest request, throws추가 
		logger.info("[url => /productAddAction.st]");
		service.productAddAction(req, model);
		return "admin/stock/productAddAction";
	}
	
	//상품수정버튼 => 상세페이지
	@RequestMapping("productDetailAction.st")
	public String productDetailAction (HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("[url => /productDetailAction.st]");
		service.productDetailAction(req, model);
		return "admin/stock/productDetailAction";
	}
	
	//상품수정처리
	@RequestMapping("productUpdateAction.st")
	public String productUpdateAction (MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("[url => /productUpdateAction.st]");
		
		service.productUpdateAction(req, model);
		
		return "admin/stock/productUpdateAction";
		
	}
	
	//상품삭제처리
	@RequestMapping("productDeleteAction.st")
	public String productDeleteAction (HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("[url => /productDeleteAction.st]");
		
		service.productDeleteAction(req, model);
		
		return "admin/stock/productDeleteAction";
		
	}
	
}
