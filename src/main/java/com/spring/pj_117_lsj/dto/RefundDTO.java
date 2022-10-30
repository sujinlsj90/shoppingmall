package com.spring.pj_117_lsj.dto;

import java.sql.Date;


public class RefundDTO extends ProductDTO {

	private int refundNo;
	private int soldNo;
	private String customerId;
	private String refundState;
	private int refundTotal;
	private int refundQuantity;
	private Date refundDate;
	
	public RefundDTO() {}

	
	
	public int getRefundQuantity() {
		return refundQuantity;
	}

	public void setRefundQuantity(int refundQuantity) {
		this.refundQuantity = refundQuantity;
	}

	public int getSoldNo() {
		return soldNo;
	}

	public void setSoldNo(int soldNo) {
		this.soldNo = soldNo;
	}

	public int getRefundNo() {
		return refundNo;
	}

	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getRefundState() {
		return refundState;
	}

	public void setRefundState(String refundState) {
		this.refundState = refundState;
	}

	public int getRefundTotal() {
		return refundTotal;
	}

	public void setRefundTotal(int refundTotal) {
		this.refundTotal = refundTotal;
	}

	public Date getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}
	
	
	
}
