package com.spring.pj_117_lsj.dao;

import java.util.List;

import com.spring.pj_117_lsj.dto.MyAccountDTO;
import com.spring.pj_117_lsj.dto.RefundDTO;
import com.spring.pj_117_lsj.dto.SoldDTO;



public interface MyAccountDAO {

	// 구매목록List
	public List<MyAccountDTO> Orderlist(String customerId);
	
	// 구매리스트 select
	public String checkOrderList(int orderNo);
	
	// 환불신청
	public void refundRequest(int soldNo);
	
	// 환불리스트에 저장
	public void refundInsert(int soldNo);
	
	// 환불리스트 select
	public RefundDTO checkRefundList(String customerId);
	
	// 판매완료 목록 -- 고객
	public List<SoldDTO> outSoldList(String customerId);
		
}
