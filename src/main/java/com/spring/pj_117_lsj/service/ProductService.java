	package com.spring.pj_117_lsj.service;

	import java.io.IOException;

	import javax.servlet.ServletException;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

	public interface ProductService {
		
		//상품등록
		public void productAddAction(MultipartHttpServletRequest req, Model model)
				throws ServletException, IOException;
		//상품목록
		public void productList(HttpServletRequest req, Model model)
			throws ServletException, IOException;
		
		//상세페이지
		public void productDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
		
		//상품수정
		public void productUpdateAction(MultipartHttpServletRequest req, Model model)
				throws ServletException, IOException;
		
		//상품삭제
		public void productDeleteAction(HttpServletRequest req, Model model)
				throws ServletException, IOException;
	}
