package com.spring.pj_117_lsj.dto;

import java.util.Date;

public class SoldDTO extends ProductDTO{

		private String customerId;
		private int soldNo;
		private String soldOption;
		private int soldQuantity;
		private int soldTotal;
		private Date soldDate;
		private String soldState;
		private String cusName;
		private String cusAddress;
		private String cusPhone;
		

		public SoldDTO() {}


		
		
		public String getSoldState() {
			return soldState;
		}




		public void setSoldState(String soldState) {
			this.soldState = soldState;
		}




		public String getCustomerId() {
			return customerId;
		}


		public void setCustomerId(String customerId) {
			this.customerId = customerId;
		}


		public int getSoldNo() {
			return soldNo;
		}


		public void setSoldNo(int soldNo) {
			this.soldNo = soldNo;
		}


		public String getSoldOption() {
			return soldOption;
		}


		public void setSoldOption(String soldOption) {
			this.soldOption = soldOption;
		}


		public int getSoldQuantity() {
			return soldQuantity;
		}


		public void setSoldQuantity(int soldQuantity) {
			this.soldQuantity = soldQuantity;
		}


		public int getSoldTotal() {
			return soldTotal;
		}


		public void setSoldTotal(int soldTotal) {
			this.soldTotal = soldTotal;
		}


		public Date getSoldDate() {
			return soldDate;
		}


		public void setSoldDate(Date soldDate) {
			this.soldDate = soldDate;
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
