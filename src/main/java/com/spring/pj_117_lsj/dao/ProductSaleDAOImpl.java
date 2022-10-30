package com.spring.pj_117_lsj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pj_117_lsj.dto.CartDTO;
import com.spring.pj_117_lsj.dto.CheckOutDTO;
import com.spring.pj_117_lsj.dto.ProductDTO;

@Repository
public class ProductSaleDAOImpl implements ProductSaleDAO{
	@Autowired
	SqlSession sqlSession;
	
	// 상품목록: category
	@Override
	public List<ProductDTO> productSaleList(String category) {
		System.out.println("DAO - productSaleList");
		ProductSaleDAO dao = sqlSession.getMapper(ProductSaleDAO.class);
		List<ProductDTO> list = dao.productSaleList(category);
		return list;
		
	}
	

	// 상품 상세페이지
	@Override
	public ProductDTO getSaleDetail(int num) {
		System.out.println("DAO - getSaleDetail");
		ProductSaleDAO dao = sqlSession.getMapper(ProductSaleDAO.class);
		ProductDTO dto = dao.getSaleDetail(num);
		return dto;
	}
	

	//장바구니 체크 (제품이 장바구니에 있는 경우 update)
	@Override
	public int checkCart(CartDTO dto) {
		System.out.println("DAO - checkCart");
		int updateCnt = 0;
		int selectCnt  = sqlSession.selectOne("com.spring.pj_117_lsj.dao.ProductSaleDAO.checkCart", dto);
			if (selectCnt != 0) {
				updateCnt = sqlSession.update("com.spring.pj_117_lsj.dao.ProductSaleDAO.checkCart_update", dto);
			}
		return updateCnt;
		
	}

	//장바구니 담기
	@Override
	public int cartInsert(CartDTO dto) {
		System.out.println("dao - cartInsert");
		int insertCnt  = sqlSession.insert("com.spring.pj_117_lsj.dao.ProductSaleDAO.cartInsert", dto);
		return insertCnt;
	}


	
	//장바구니 목록
	@Override
	public List<CartDTO> cartList(String customerId) {
		System.out.println("DAO - cartList");
		List<CartDTO> list = sqlSession.selectList("com.spring.pj_117_lsj.dao.ProductSaleDAO.cartList", customerId);
		return list;
	}

	//장바구니 수정
	@Override
	public void cartUpdate(CartDTO dto) {
		System.out.println("DAO => cartUpdate");
		sqlSession.update("com.spring.pj_117_lsj.dao.ProductSaleDAO.cartUpdate", dto);
	}
	
	
	//장바구니 삭제(chkbox)
	@Override
	public void cartdelete(int cartNo) {
		System.out.println("DAO => cartdelete");
		sqlSession.delete("com.spring.pj_117_lsj.dao.ProductSaleDAO.cartdelete", cartNo);

	}


	
	//장바구니 전체 목록 삭제
	@Override
	public void deleteCart(String customerId) {
		System.out.println("DAO => cartdelete");
		sqlSession.delete("com.spring.pj_117_lsj.dao.ProductSaleDAO.deleteCart", customerId);	
	}


	//장바구니 -> 구매목록으로 이동
	@Override
	public int chkoutInsert(int cartNo) {
		System.out.println("dao - chkoutInsert");
		int insertCnt = sqlSession.insert("com.spring.pj_117_lsj.dao.ProductSaleDAO.chkoutInsert", cartNo);
		return insertCnt;
	}

	
	//구매하기 목록 이동(있는경우 update)
	@Override
	public int checkChkOutlist(CheckOutDTO dto) {
		System.out.println("DAO - checkChkOutlist");
		int updateCnt = 0;
		int selectCnt  = sqlSession.selectOne("com.spring.pj_117_lsj.dao.ProductSaleDAO.checkChkOutlist", dto);
		System.out.println("selectCnt = " + selectCnt);
			if (selectCnt != 0) {
				updateCnt = sqlSession.update("com.spring.pj_117_lsj.dao.ProductSaleDAO.checkChkOutlist_update", dto);
			}
		return updateCnt;
	}


	//상품판매페이지 -> 구매목록 담기
	@Override
	public int chkoutInsert2(CheckOutDTO dto) {
		System.out.println("dao - chkoutInsert");
		int insertCnt = sqlSession.insert("com.spring.pj_117_lsj.dao.ProductSaleDAO.chkoutInsert2", dto);
		return insertCnt;
	}
	
	
	//구매하기 목록
	@Override
	public List<CheckOutDTO> checkOutList(String customerId) {
		System.out.println("DAO - checkOutList");
		List<CheckOutDTO> list = sqlSession.selectList("com.spring.pj_117_lsj.dao.ProductSaleDAO.checkOutList", customerId);
			return list;
	}

	//구매하기 목록 체크박스 삭제
	@Override
	public void chkOutDelete(int chkoutNo) {
		System.out.println("DAO => chkOutDelete");
		sqlSession.delete("com.spring.pj_117_lsj.dao.ProductSaleDAO.chkOutDelete", chkoutNo);
	}



	//구매하기=>구매목록
	@Override
	public int OrderlistInsert(int chkoutNo) {
		System.out.println("dao - OrderlistInsert");
		int insertCnt = sqlSession.insert("com.spring.pj_117_lsj.dao.ProductSaleDAO.OrderlistInsert", chkoutNo);
		return insertCnt;
	}


	//주문목록 비우기
	@Override
	public void deletechkOutAll(String customerId) {
		System.out.println("DAO => deletechkOutAll");
		sqlSession.delete("com.spring.pj_117_lsj.dao.ProductSaleDAO.deletechkOutAll", customerId);
	}
}
