package com.spring.pj_117_lsj.dao;

import java.util.List;
import java.util.Map;

import com.spring.pj_117_lsj.dto.ProductDTO;



public interface ProductDAO {
	//상품추가처리
	public int productInsert(ProductDTO dto);
	
	//상품갯수
	public int productCnt();
	
	//상품목록
	public List<ProductDTO> productList(Map<String, Object> map);
	
	//상품 상세페이지
	public ProductDTO productDetail(int pdNo);
	
	//상품수정처리
	public int productUpdate(ProductDTO dto);
	
	//상품삭제처리
	public int productDelete(int pdNo);
	
}
