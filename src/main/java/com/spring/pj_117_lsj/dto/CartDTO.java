package com.spring.pj_117_lsj.dto;

import java.util.Date;

public class CartDTO extends ProductDTO{

		private String customerId;
		private int cartNo;
		private String cartOption;
		private int cartQuantity;
		private int cartTotal;
		private Date cartDate;

		public CartDTO() {}

		public String getCustomerId() {
			return customerId;
		}

		public void setCustomerId(String customerId) {
			this.customerId = customerId;
		}

		public int getCartNo() {
			return cartNo;
		}

		public void setCartNo(int cartNo) {
			this.cartNo = cartNo;
		}

		public String getCartOption() {
			return cartOption;
		}

		public void setCartOption(String cartOption) {
			this.cartOption = cartOption;
		}

		public int getCartQuantity() {
			return cartQuantity;
		}

		public void setCartQuantity(int cartQuantity) {
			this.cartQuantity = cartQuantity;
		}

		public int getCartTotal() {
			return cartTotal;
		}

		public void setCartTotal(int cartTotal) {
			this.cartTotal = cartTotal;
		}

		public Date getCartDate() {
			return cartDate;
		}

		public void setCartDate(Date cartDate) {
			this.cartDate = cartDate;
		}

		@Override
		public String toString() {
			return "CartDTO [customerId=" + customerId + ", cartNo=" + cartNo + ", cartOption=" + cartOption
					+ ", cartQuantity=" + cartQuantity + ", cartTotal=" + cartTotal + ", cartDate=" + cartDate + "]";
		}
		
		
		
		
		
}
