package com.spring.pj_117_lsj.dao;

import java.util.List;

import com.spring.pj_117_lsj.dto.CartDTO;
import com.spring.pj_117_lsj.dto.CheckOutDTO;
import com.spring.pj_117_lsj.dto.ProductDTO;



public interface ProductSaleDAO {

	// 상품목록: category
	public List<ProductDTO> productSaleList(String category);
	
	// 상품 상세페이지
	public ProductDTO getSaleDetail(int num);
	
	// 장바구니 체크 후 업데이트
	public int checkCart(CartDTO dto);
	
	// 장바구니 담기
	public int cartInsert(CartDTO dto);
	
	// 장바구니 목록
	public List<CartDTO> cartList(String customerId);
	
	// 장바구니 수정(전체)
	public void cartUpdate(CartDTO dto);
	
	// 장바구니 삭제(checkBox, 개별)
	public void cartdelete(int cartNo);

	//장바구니 비우기
	public void deleteCart(String customerId);
	
	// 장바구니->구매목록 담기
	public int chkoutInsert(int cartNo);
	
	//구매목록 확인(중복제품 있을 시 수량변경)
	public int checkChkOutlist(CheckOutDTO dto);
	
	// 상품판매페이지->구매목록 담기
	public int chkoutInsert2(CheckOutDTO dto);
	
	// 구매 목록
	public List<CheckOutDTO> checkOutList(String customerId);
	
	// 구매 목록 삭제
	public void chkOutDelete(int chkoutNo);
	
	// 구매하기 => 구매목록
	public int OrderlistInsert(int chkoutNo);
	
	//주문목록 비우기
	public void deletechkOutAll(String customerId);
	
	
}
