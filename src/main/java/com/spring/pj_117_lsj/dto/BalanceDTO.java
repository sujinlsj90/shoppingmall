package com.spring.pj_117_lsj.dto;

import java.sql.Date;

public class BalanceDTO {
	
	private Date today;
	private int sold1mth;
	private int sold2mth;
	private int refund1mth;
	private int refund2mth;
	private int balance1mth;
	private int balance2mth;
	
	public BalanceDTO() {}

	
	public Date getToday() {
		return today;
	}
	public void setToday(Date today) {
		this.today = today;
	}

	public int getSold1mth() {
		return sold1mth;
	}

	public void setSold1mth(int sold1mth) {
		this.sold1mth = sold1mth;
	}

	public int getSold2mth() {
		return sold2mth;
	}

	public void setSold2mth(int sold2mth) {
		this.sold2mth = sold2mth;
	}

	public int getRefund1mth() {
		return refund1mth;
	}

	public void setRefund1mth(int refund1mth) {
		this.refund1mth = refund1mth;
	}

	public int getRefund2mth() {
		return refund2mth;
	}

	public void setRefund2mth(int refund2mth) {
		this.refund2mth = refund2mth;
	}

	public int getBalance1mth() {
		return balance1mth;
	}

	public void setBalance1mth(int balance1mth) {
		this.balance1mth = balance1mth;
	}

	public int getBalance2mth() {
		return balance2mth;
	}

	public void setBalance2mth(int balance2mth) {
		this.balance2mth = balance2mth;
	}
	
	
}
