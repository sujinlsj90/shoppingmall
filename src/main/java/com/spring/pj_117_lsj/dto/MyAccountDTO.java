package com.spring.pj_117_lsj.dto;

import java.util.Date;

public class MyAccountDTO extends ProductDTO{

		private int orderNo;
		private String customerId;
		private String orderOption;
		private String orderweight;
		private int orderQuantity;
		private String orderState;
		private String shipAddress;
		private int orderTotal;
		private Date orderDate;

		public MyAccountDTO() {}

		public String getCustomerId() {
			return customerId;
		}

		public void setCustomerId(String customerId) {
			this.customerId = customerId;
		}

		public int getOrderNo() {
			return orderNo;
		}

		public void setOrderNo(int orderNo) {
			this.orderNo = orderNo;
		}

		public String getOrderOption() {
			return orderOption;
		}

		public void setOrderOption(String orderOption) {
			this.orderOption = orderOption;
		}

		public String getOrderweight() {
			return orderweight;
		}

		public void setOrderweight(String orderweight) {
			this.orderweight = orderweight;
		}

		public int getOrderQuantity() {
			return orderQuantity;
		}

		public void setOrderQuantity(int orderQuantity) {
			this.orderQuantity = orderQuantity;
		}

		public String getOrderState() {
			return orderState;
		}

		public void setOrderState(String orderState) {
			this.orderState = orderState;
		}

		public String getShipAddress() {
			return shipAddress;
		}

		public void setShipAddress(String shipAddress) {
			this.shipAddress = shipAddress;
		}

		public int getOrderTotal() {
			return orderTotal;
		}

		public void setOrderTotal(int orderTotal) {
			this.orderTotal = orderTotal;
		}

		public Date getOrderDate() {
			return orderDate;
		}

		public void setOrderDate(Date orderDate) {
			this.orderDate = orderDate;
		}


		
}
