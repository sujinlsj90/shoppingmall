package com.spring.pj_117_lsj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pj_117_lsj.dto.BalanceChartDTO;
import com.spring.pj_117_lsj.dto.BalanceDTO;
import com.spring.pj_117_lsj.dto.CustomerDTO;
import com.spring.pj_117_lsj.dto.MyAccountDTO;
import com.spring.pj_117_lsj.dto.RefundDTO;
import com.spring.pj_117_lsj.dto.SoldDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	@Autowired
	SqlSession sqlSession;
	
	
	// 주문신청 리스트
	@Override
	public List<MyAccountDTO> orderConfirmList() {
		System.out.println("DAO - orderConfirmList");
		List<MyAccountDTO> list = sqlSession.selectList("com.spring.pj_117_lsj.dao.AdminDAO.orderConfirmList");
		return list;
	}
	
	
	// 주문상태 변경	
	@Override
	public void updateOrderState(Map<String, Object> map) {
		System.out.println("DAO => updateOrderState");
		sqlSession.update("com.spring.pj_117_lsj.dao.AdminDAO.updateOrderState", map);
	}

	
	//판매완료 시 product_tbl에서 재고 감소
	@Override
	public void updatePDTQuantity(int orderNo) {
		System.out.println("DAO => updatePDTQuantity");
		sqlSession.update("com.spring.pj_117_lsj.dao.AdminDAO.updatePDTQuantity", orderNo);
	}


	// 주문목록 -> 주문승인 시 판매완료목록 Insert 
	@Override
	public int AddoutSoldList(int orderNo) {
		System.out.println("DAO - ystem.out.println(\"DAO - deleteOrderList\");");
		int insertCnt = sqlSession.delete("com.spring.pj_117_lsj.dao.AdminDAO.AddoutSoldList", orderNo);
		return insertCnt;
	}
	
	// 판매목록에서 삭제
	public void outSoldListDelete(int orderNo) {
		System.out.println("DAO - deleteOrderList");
		sqlSession.delete("com.spring.pj_117_lsj.dao.AdminDAO.outSoldListDelete", orderNo);
	}

	// 판매완료 목록 -- 관리자
	@Override
	public List<SoldDTO> outSoldListAd() {
		System.out.println("DAO - outSoldListAd");
		List<SoldDTO> list = sqlSession.selectList("com.spring.pj_117_lsj.dao.AdminDAO.outSoldListAd");
		return list;
	}
	
	// 환불신청 리스트
	@Override
	public List<RefundDTO> refundList() {
		System.out.println("DAO => refundList");	
		List<RefundDTO> list = sqlSession.selectList("com.spring.pj_117_lsj.dao.AdminDAO.refundList");
		return list;
	}
	
	// 환불상태 변경
	@Override
	public void updateRefundState(int refundNo) {
		System.out.println("DAO => updateRefundState");	
		sqlSession.update("com.spring.pj_117_lsj.dao.AdminDAO.updateRefundState", refundNo);
	}


	//환불 시 재고반영
	@Override
	public void minusPDTQuantity(int refundNo) {
		System.out.println("DAO => minusPDTQuantity");
		sqlSession.update("com.spring.pj_117_lsj.dao.AdminDAO.minusPDTQuantity", refundNo);
	}


	//환불완료목록
	@Override
	public List<RefundDTO> refundEndList() {
		System.out.println("DAO => refundEndList");	
		List<RefundDTO> list = sqlSession.selectList("com.spring.pj_117_lsj.dao.AdminDAO.refundEndList");
		return list;
	}


	//결산
	@Override
	public BalanceDTO balanceAction() {
		 System.out.println("dao - balanceAction");
		 BalanceDTO dto = sqlSession.selectOne("com.spring.pj_117_lsj.dao.AdminDAO.balanceAction");
	     return dto;
	   }


	//회원정보
	@Override
	public List<CustomerDTO> getMemberInfo() {
		 System.out.println("dao - balanceAction");
		 List<CustomerDTO> list = sqlSession.selectList("com.spring.pj_117_lsj.dao.AdminDAO.getMemberInfo");
	      return list;
	}

	//결산차트
	@Override
	public List<BalanceChartDTO> getbalanceChart() {
		List<BalanceChartDTO> list = sqlSession.selectList("com.spring.pj_117_lsj.dao.AdminDAO.getbalanceChart");
		return list;
	}
	
}


