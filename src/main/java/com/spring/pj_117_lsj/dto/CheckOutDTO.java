package com.spring.pj_117_lsj.dto;

import java.util.Date;

public class CheckOutDTO extends ProductDTO{

		private String customerId;
		private int chkoutNo;
		private String chkoutOption;
		private int chkoutQuantity;
		private int chkoutTotal;
		private Date chkout;
		private String cusName;
		private String cusAddress;
		private String cusPhone;

		public CheckOutDTO() {}

		public String getCustomerId() {
			return customerId;
		}

		public void setCustomerId(String customerId) {
			this.customerId = customerId;
		}

		public int getChkoutNo() {
			return chkoutNo;
		}

		public void setChkoutNo(int chkoutNo) {
			this.chkoutNo = chkoutNo;
		}

		public String getChkoutOption() {
			return chkoutOption;
		}

		public void setChkoutOption(String chkoutOption) {
			this.chkoutOption = chkoutOption;
		}

		public int getChkoutQuantity() {
			return chkoutQuantity;
		}

		public void setChkoutQuantity(int chkoutQuantity) {
			this.chkoutQuantity = chkoutQuantity;
		}

		public int getChkoutTotal() {
			return chkoutTotal;
		}

		public void setChkoutTotal(int chkoutTotal) {
			this.chkoutTotal = chkoutTotal;
		}

		public Date getChkout() {
			return chkout;
		}

		public void setChkout(Date chkout) {
			this.chkout = chkout;
		}

		public String getCusName() {
			return cusName;
		}

		public void setCusName(String cusName) {
			this.cusName = cusName;
		}

		public String getCusAddress() {
			return cusAddress;
		}

		public void setCusAddress(String cusAddress) {
			this.cusAddress = cusAddress;
		}

		public String getCusPhone() {
			return cusPhone;
		}

		public void setCusPhone(String cusPhone) {
			this.cusPhone = cusPhone;
		}


		
		
}
