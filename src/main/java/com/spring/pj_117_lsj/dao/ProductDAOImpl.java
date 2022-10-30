package com.spring.pj_117_lsj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pj_117_lsj.dto.ProductDTO;



@Repository
public class ProductDAOImpl implements ProductDAO{
	@Autowired
	SqlSession sqlsession;
// 	상품추가
	@Override
	public int productInsert(ProductDTO dto) {
		System.out.println("DAO - productInsert()");
		ProductDAO dao = sqlsession.getMapper(ProductDAO.class);
		int insertCnt = dao.productInsert(dto);
		return insertCnt;
	}

	//상품갯수
	@Override
	public int productCnt() {
		System.out.println("DAO => productCnt");
		ProductDAO dao = sqlsession.getMapper(ProductDAO.class);
		int selectCnt = dao.productCnt();
		return selectCnt;
	}

	//상품리스트
	@Override
	public List<ProductDTO> productList(Map<String, Object> map) {
		System.out.println("DAO => productList");
		ProductDAO dao = sqlsession.getMapper(ProductDAO.class);
		List<ProductDTO> list = dao.productList(map);
	    
		return list;
	}
	
	//상품상세페이지
	@Override
	public ProductDTO productDetail(int pdNo) {
		ProductDAO dao = sqlsession.getMapper(ProductDAO.class);
		ProductDTO dto = dao.productDetail(pdNo);
		return dto;
	}

	//상품수정처리
	@Override
	public int productUpdate(ProductDTO dto) {
		System.out.println("DAO => productUpdate");
		int updateCnt = 0;
		ProductDAO dao = sqlsession.getMapper(ProductDAO.class);
		updateCnt = dao.productUpdate(dto);	
		return updateCnt;
	}

	//상품삭제처리
	@Override
	public int productDelete(int pdNo) {
		System.out.println("DAO => productDelete");
		ProductDAO dao = sqlsession.getMapper(ProductDAO.class);
		int deleteCnt = dao.productDelete(pdNo);	
		return deleteCnt;
	}

}
