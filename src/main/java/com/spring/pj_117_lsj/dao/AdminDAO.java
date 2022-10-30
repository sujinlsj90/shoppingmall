package com.spring.pj_117_lsj.dao;

import java.util.List;
import java.util.Map;

import com.spring.pj_117_lsj.dto.BalanceChartDTO;
import com.spring.pj_117_lsj.dto.BalanceDTO;
import com.spring.pj_117_lsj.dto.CustomerDTO;
import com.spring.pj_117_lsj.dto.MyAccountDTO;
import com.spring.pj_117_lsj.dto.RefundDTO;
import com.spring.pj_117_lsj.dto.SoldDTO;


public interface AdminDAO {

	
	// 주문신청 리스트
	public List<MyAccountDTO> orderConfirmList();
	
	// 주문상태 변경
	public void updateOrderState(Map<String, Object> map);
	
	// 판매완료 시 재고 감소
	public void updatePDTQuantity(int orderNo);
	
	// 주문목록에서 승인시 판매완료목록 Insert 
	public int AddoutSoldList(int orderNo);
	
	//및 삭제
	public void outSoldListDelete(int orderNo);
	
	// 판매완료 목록 -- 관리자
	public List<SoldDTO> outSoldListAd();
	
	// 환불신청 리스트
	public List<RefundDTO> refundList();
	
	// 환불상태 변경
	public void updateRefundState(int refundNo);
	
	// 환불 시 재고 증가
	public void minusPDTQuantity(int refundNo);
	
	//환불완료 리스트
	public List<RefundDTO> refundEndList();
	
	//회원정보
	public List<CustomerDTO> getMemberInfo();
	
	//결산
	public BalanceDTO balanceAction();
	
	//결산 차트
	public List<BalanceChartDTO> getbalanceChart();
	
	
}
