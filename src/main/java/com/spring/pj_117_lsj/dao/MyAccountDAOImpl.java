package com.spring.pj_117_lsj.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pj_117_lsj.dto.MyAccountDTO;
import com.spring.pj_117_lsj.dto.RefundDTO;
import com.spring.pj_117_lsj.dto.SoldDTO;


@Repository
public class MyAccountDAOImpl implements MyAccountDAO{
	@Autowired
	SqlSession sqlSession;
	
	//구매목록
	@Override
	public List<MyAccountDTO> Orderlist(String customerId) {
		System.out.println("DAO - Orderlist");
		List<MyAccountDTO> list = sqlSession.selectList("com.spring.pj_117_lsj.dao.MyAccountDAO.Orderlist", customerId);
		return list;
	}

	//환불신청
	@Override
	public void refundRequest(int soldNo) {
		sqlSession.update("com.spring.pj_117_lsj.dao.MyAccountDAO.refundRequest", soldNo);
	}

	//환불목록에 status '환불신청'으로 저장
	@Override
	public void refundInsert(int soldNo) {
		System.out.println("DAO => refundInsert");
		sqlSession.insert("com.spring.pj_117_lsj.dao.MyAccountDAO.refundInsert", soldNo);
	}

	//환불목록 check 
	@Override
	public RefundDTO checkRefundList(String customerId) {
		System.out.println("DAO => checkRefundList");
		RefundDTO dto = sqlSession.selectOne("com.spring.pj_117_lsj.dao.MyAccountDAO.checkRefundList", customerId);
		return dto;
	}

	//구매리스트 select
	@Override
	public String checkOrderList(int soldNo) {
		System.out.println("DAO => checkOrderList");
		String soldState = sqlSession.selectOne("com.spring.pj_117_lsj.dao.MyAccountDAO.checkOrderList", soldNo);
		return soldState;
	}
	
	// 판매완료 목록 --고객
	@Override
	public List<SoldDTO> outSoldList(String customerId) {
		System.out.println("DAO - outSoldList");
		List<SoldDTO> list = sqlSession.selectList("com.spring.pj_117_lsj.dao.MyAccountDAO.outSoldList", customerId);
		return list;
	}

}


