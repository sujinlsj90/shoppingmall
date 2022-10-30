package com.spring.pj_117_lsj.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.pj_117_lsj.dao.ProductSaleDAOImpl;
import com.spring.pj_117_lsj.dto.CartDTO;
import com.spring.pj_117_lsj.dto.CheckOutDTO;
import com.spring.pj_117_lsj.dto.ProductDTO;

@Service
public class ProductSaleServiceImpl implements ProductSaleService{
	@Autowired
	ProductSaleDAOImpl dao;
	
	//판매 - 상품판매리스트: category
	@Override
	public void shopListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 => shopListAction");
		
		String category = req.getParameter("category");
		
		List<ProductDTO> list = dao.productSaleList(category);
		
		model.addAttribute("list", list);
	}



	//판매 - 상품세부
	@Override
	public void shopDetailAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("service => shopDetailAction");
		
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		System.out.println("상품번호: " + pdNo);
		
		ProductDTO dto = dao.getSaleDetail(pdNo);
		
		model.addAttribute("dto", dto);
		model.addAttribute("pdNo", pdNo);
		System.out.println(dto);
	}

	//장바구니 - 상품선택결과(total)
	@Override
	public void shopTotalAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>shopTotalAction");
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		int cartQuantity = Integer.parseInt(req.getParameter("cartQuantity"));
		System.out.println("pdNoParam => " + pdNo);
		System.out.println("quantityParam => " + cartQuantity);
		
		 
		
		// product_tbl에서 price 가져오기 : total값 구하기위함
		ProductDTO dto = dao.getSaleDetail(pdNo);
		int price = dto.getPrice();
		
		int total = price * cartQuantity;
		System.out.println("total: " + total);
				
		model.addAttribute("pdNo", pdNo);
		model.addAttribute("total", total);
	}
	
	//장바구니 담기
	@Override
	public void cartInsertAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>cartInsertAction");
		
		String customerId = (String)req.getSession().getAttribute("customerId");
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		int cartQuantity = Integer.parseInt(req.getParameter("cartQuantity"));
		String cartoption = req.getParameter("option");
		int insertCnt = 0;
		
		 
		ProductDTO dto1 = dao.getSaleDetail(pdNo);
		int price = dto1.getPrice();
		int cartTotal = price * cartQuantity;
		
		CartDTO dto = new CartDTO();
		dto.setCustomerId(customerId);
		dto.setPdNo(pdNo);
		dto.setCartQuantity(cartQuantity);
		dto.setCartOption(cartoption);
		dto.setCartTotal(cartTotal);
		
		System.out.println(dto);
		
		int result = dao.checkCart(dto);	//장바구니에 물건이 이미 있는지 select후 update
		
		if(result != 1) {
		insertCnt = dao.cartInsert(dto);	//없으면 insert
		}
		model.addAttribute("insertCnt", insertCnt);
	}
	
	//장바구니 리스트
	@Override
	public void cartListAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>cartListAction");
		String customerId = (String)req.getSession().getAttribute("customerId");
		 
		List<CartDTO> list = null;
		list = dao.cartList(customerId);
		
		model.addAttribute("list", list);
		
	}
	
	
	//장바구니 수정 (전체)
	@Override
	public void cartUpdateAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>cartUpdateAction");
		String[] cartNo = req.getParameterValues("cartNo");
		String[] cartQuantity = req.getParameterValues("cartQuantity");
		String[] pdNo = req.getParameterValues("pdNo");
		
		CartDTO dto = new CartDTO();
		 
		
		//cartNo(해당 체크박스)가 null이 아닌 경우, dto에 화면에서 받은 값을 넣은 뒤 dao에서 update문을 돌리는 것을 반복-
		if(cartNo != null) {	
		for(int i=0;i<cartNo.length;i++){
			ProductDTO dto1 = dao.getSaleDetail(Integer.parseInt(pdNo[i]));
			int price = dto1.getPrice();
			
			dto.setCartNo(Integer.parseInt(cartNo[i]));	
			dto.setCartQuantity(Integer.parseInt(cartQuantity[i]));
			dto.setCartTotal(price * Integer.parseInt(cartQuantity[i]));
			dao.cartUpdate(dto);
		}
		} else {
			System.out.println("수정불가");
		}
		
	}
	
	//장바구니 수정(개별)

	@Override
	public void cartUpdateOneAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		System.out.println("service =>cartUpdateOneAction");
		int cartNo = Integer.parseInt(req.getParameter("cartNo"));
		int cartQuantity = Integer.parseInt(req.getParameter("cartQuantity"));
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		System.out.println("cartQuantity: " + cartQuantity);
		
		
		CartDTO dto = new CartDTO();
		 
		
		ProductDTO dto1 = dao.getSaleDetail(pdNo);
		int price = dto1.getPrice();
		
		dto.setCartNo(cartNo);	
		dto.setCartQuantity(cartQuantity);
		dto.setCartTotal(price * cartQuantity);
		dao.cartUpdate(dto);
		
	}	




	//장바구니 삭제 (체크박스)
	@Override
	public void cartDeleteAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>cartDeleteAction");
		String[] cartNos = req.getParameterValues("cartChk");
		
		if(cartNos != null) {
		for(int i=0;i<cartNos.length;i++){
			dao.cartdelete(Integer.parseInt(cartNos[i]));
		}
		}else {
			System.out.println("수정불가");
		}
	}
	
	//장바구니 삭제 (개별)
	@Override
	public void cartDeleteOneAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("service =>cartDeleteOneAction");
		
		int cartNo = Integer.parseInt(req.getParameter("cartNo"));
		
		dao.cartdelete(cartNo);
				
	}
	
	//장바구니 checkbox-> 주문하기목록 추가
	@Override
	public void checkedBuyAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>checkedBuyAction");
		
		String customerId = (String)req.getSession().getAttribute("customerId");
		String[] cartNo = req.getParameterValues("cartChk");
		String[] pdNo = req.getParameterValues("pdNo");
		String[] cartQuantity = req.getParameterValues("cartQuantity");
		String[] cartOption = req.getParameterValues("cartOption");
		int result = 0;
		 	
		System.out.println("cartNo : " + cartNo);
		if (cartNo != null) {
		for(int i=0;i<pdNo.length;i++){
			ProductDTO dto1 = dao.getSaleDetail(Integer.parseInt(pdNo[i]));
			int price = dto1.getPrice();
			int cartTotal = price * Integer.parseInt(cartQuantity[i]);
			
			CheckOutDTO dto = new CheckOutDTO();
			dto.setCustomerId(customerId);
			dto.setPdNo(Integer.parseInt(pdNo[i]));
			dto.setChkoutQuantity(Integer.parseInt(cartQuantity[i]));
			dto.setChkoutOption(cartOption[i]);
			dto.setChkoutTotal(cartTotal);
			
			result = dao.checkChkOutlist(dto);
			System.out.println("result = " + result);
			}
		}
		
		if(result == 0) {
			if(cartNo != null) {
				for(int j=0;j<cartNo.length;j++){
					dao.chkoutInsert(Integer.parseInt(cartNo[j]));
					System.out.println(cartNo[j]);
				}
			} else {
				System.out.println("오류");
			}
		}
	}

	//장바구니 -> 주문하기목록 전체 추가
	@Override
	public void buyInsertAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		String customerId = (String)req.getSession().getAttribute("customerId");
		String[] cartNo = req.getParameterValues("cartNo");
		String[] pdNo = req.getParameterValues("pdNo");
		String[] cartQuantity = req.getParameterValues("cartQuantity");
		String[] cartOption = req.getParameterValues("cartOption");
		int result = 0;
		 	
		System.out.println("cartNo : " + cartNo);
		if (pdNo != null) {
		for(int i=0;i<pdNo.length;i++){
			ProductDTO dto1 = dao.getSaleDetail(Integer.parseInt(pdNo[i]));
			int price = dto1.getPrice();
			int cartTotal = price * Integer.parseInt(cartQuantity[i]);
			
			CheckOutDTO dto = new CheckOutDTO();
			dto.setCustomerId(customerId);
			dto.setPdNo(Integer.parseInt(pdNo[i]));
			dto.setChkoutQuantity(Integer.parseInt(cartQuantity[i]));
			dto.setChkoutOption(cartOption[i]);
			dto.setChkoutTotal(cartTotal);
			
			result = dao.checkChkOutlist(dto);
			}
		}
		
		if(result == 0) {
			if(cartNo != null) {
				for(int j=0;j<cartNo.length;j++){
					dao.chkoutInsert(Integer.parseInt(cartNo[j]));
					System.out.println(cartNo[j]);
				}
			} else {
				System.out.println("오류");
			}
		}
	}

	
	//장바구니 비우기
	@Override
	public void deleteCartAll(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>deleteCartAll");
		String customerId = (String)req.getSession().getAttribute("customerId");
		 
		dao.deleteCart(customerId);
		
	}
	
	//주문하기목록 불러오기
	@Override
	public void buyListAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>buyListAction");
		String customerId = (String)req.getSession().getAttribute("customerId");
		
		 
		List<CheckOutDTO> list = null;
		list = dao.checkOutList(customerId);
		
		model.addAttribute("list", list);
		
	}
	
	//바로구매하기
	@Override
	public void buyNowAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>buyNow");
		
		String customerId = (String)req.getSession().getAttribute("customerId");
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		int chkoutQuantity = Integer.parseInt(req.getParameter("cartQuantity"));
		String chkoutOption = req.getParameter("option");
		int insertCnt = 0;
		
		 
		ProductDTO dto1 = dao.getSaleDetail(pdNo);
		int price = dto1.getPrice();
		int cartTotal = price * chkoutQuantity;
		
		CheckOutDTO dto = new CheckOutDTO();
		dto.setCustomerId(customerId);
		dto.setPdNo(pdNo);
		dto.setChkoutQuantity(chkoutQuantity);
		dto.setChkoutOption(chkoutOption);
		dto.setChkoutTotal(cartTotal);
		
		
		int result = dao.checkChkOutlist(dto);
		
		if(result != 1) {
		insertCnt = dao.chkoutInsert2(dto);
		}
		model.addAttribute("insertCnt", insertCnt);
		
	}

	//주문하기목록 삭제 (체크박스)
	@Override
	public void chkOutDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("service =>chkOutDeleteAction");
		String[] chknos = req.getParameterValues("buyChk");
		
		if(chknos != null) {
		for(int i=0;i<chknos.length;i++){
			dao.chkOutDelete(Integer.parseInt(chknos[i]));
			System.out.println(chknos[i]);
		}
		} else {
			System.out.println("삭제불가");
		}
		
	}
	

	//주문하기 목록 -> 구매완료목록 추가
	@Override
	public void accountInsertAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("service =>accountInsertAction");
		
		String[] chkoutNo = req.getParameterValues("chkoutNo");
		int insertCnt = 0;
		
		 
			for(int j=0;j<chkoutNo.length;j++) {
				insertCnt = dao.OrderlistInsert(Integer.parseInt(chkoutNo[j]));
			}
		model.addAttribute("insertCnt", insertCnt);
	}
		
	
	//주문하기목록 비우기
	@Override
	public void deletechkOutAll(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>deletechkOutAll");
		String customerId = (String)req.getSession().getAttribute("customerId");
		 
		dao.deletechkOutAll(customerId);
	}
	

}
