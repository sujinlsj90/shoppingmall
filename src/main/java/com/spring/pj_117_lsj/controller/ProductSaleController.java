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

import com.spring.pj_117_lsj.service.ProductSaleServiceImpl;

@Controller
public class ProductSaleController {
	private static final Logger logger = LoggerFactory.getLogger(ProductSaleController.class);
	
	@Autowired
	ProductSaleServiceImpl service;
	
	//쇼핑리스트-카테고리
	@RequestMapping("shop.sh")
	public String shop(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /shop.sh]");
		
		service.shopListAction(req, model);
		return "product/shop";
	}
	
	//상품 판매 페이지
	@RequestMapping("product_details.sh")
	public String product_details(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /product_details.sh]");
		
		service.shopDetailAction(req, model);
		return "product/product_details";
	}
	
	//상품 수량 변경(상품 판매 페이지 quantity 변경 시)
	@RequestMapping("shop_total.sh")
	public String shop_total(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /shop_total.sh]");
		
		service.shopTotalAction(req, model);
		return "product/shop_total";
	}
	
	//장바구니 담기
	@RequestMapping("cartInsertAction.sh")
	public void cartInsertAction(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /cartInsertAction.sh]");
		service.cartInsertAction(req, model);
		String viewPage = req.getContextPath() + "/cart.sh";
		res.sendRedirect(viewPage);
	}
	
	//장바구니 목록
	@RequestMapping("cart.sh")
	public String cartListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /cart.sh]");
		service.cartListAction(req, model);
		return "customer/myaccount/order/cart";
	}
	
	//장바구니 수정 전체
	@RequestMapping("cartUpdateAction.sh")
	public void cartUpdateAction(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /cartUpdateAction.sh]");
		service.cartUpdateAction(req, model);
		String viewPage = req.getContextPath() + "/cart.sh";
		res.sendRedirect(viewPage);
	}
	
	//장바구니 수정 개별
	@RequestMapping("updateCartOne.sh")
	public void updateCartOne(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /updateCartOne.sh]");
		service.cartUpdateOneAction(req, model);
		String viewPage = req.getContextPath() + "/cart.sh";
		res.sendRedirect(viewPage);
	}
	
	//장바구니 delete 체크박스
	@RequestMapping("cartDeleteAction.sh")
	public void cartDeleteAction(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /cartDeleteAction.sh]");
		service.cartDeleteAction(req, model);
		String viewPage = req.getContextPath() + "/cart.sh";
		res.sendRedirect(viewPage);
	}
	
	//장바구니 delete 개별
	@RequestMapping("cartDeleteOne.sh")
	public void cartDeleteOne(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /cartDeleteOne.sh]");
		service.cartDeleteOneAction(req, model);
		String viewPage = req.getContextPath() + "/cart.sh";
		res.sendRedirect(viewPage);
	}
	
	//장바구니 -> 구매목록에 저장
	@RequestMapping("buyInsertAction.sh")
	public String buyInsertAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /buyInsertAction.sh]");
		service.buyInsertAction(req, model);
		service.buyListAction(req, model);
		service.deleteCartAll(req, model);
		return "customer/myaccount/order/checkout";
	}
	
	//장바구니 -> 구매목록에 저장
	@RequestMapping("cartBuycheck.sh")
	public String cartBuycheck(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /cartBuycheck.sh]");
		service.checkedBuyAction(req, model);
		service.buyListAction(req, model);
		service.deleteCartAll(req, model);
		return "customer/myaccount/order/checkout";
	}
	
	//바로구매
	@RequestMapping("chkOutInsertAction.sh")
	public String chkOutInsertAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /chkOutInsertAction.sh]");
		service.buyNowAction(req, model);
		service.buyListAction(req, model);
		return "customer/myaccount/order/checkout";
	}
	
	//구매목록 리스트
	@RequestMapping("checkout.sh")
	public String checkout(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /checkout.sh]");
		service.buyListAction(req, model);
		return "customer/myaccount/order/checkout";
	}
	
	//구매목록 리스트
	@RequestMapping("chkOutDeleteAction.sh")
	public void chkOutDeleteAction(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /orderListInsertAction.sh]");
		service.chkOutDeleteAction(req, model);
		String viewPage = req.getContextPath() + "/checkout.sh";
		res.sendRedirect(viewPage);
	}
	
	//구매목록 리스트
	@RequestMapping("orderListInsertAction.sh")
	public String orderListInsertAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /orderListInsertAction.sh]");
		service.accountInsertAction(req, model);
		service.deletechkOutAll(req, model);
		return "customer/myaccount/order/orderSheet";
	}
	
}
