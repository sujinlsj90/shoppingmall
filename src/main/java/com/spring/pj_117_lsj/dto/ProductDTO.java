package com.spring.pj_117_lsj.dto;

import java.sql.Date;

public class ProductDTO {

	private int pdNo;
	private String pdName;
	private String pdImg;
	private String weight; 
	private String category;
	private String brand;
	private String content;
	private int price;
	private int quantity;
	private String status;
	private Date indate;
	
	
	
	
	public ProductDTO() {}
	
	
	
	
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public int getPdNo() {
		return pdNo;
	}
	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getPdImg() {
		return pdImg;
	}
	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}

	
	@Override
	public String toString() {
		return "ProductDTO [pdNo=" + pdNo + ", pdName=" + pdName + ", pdImg=" + pdImg + ", category=" + category
				+ ", brand=" + brand + ", content=" + content + ", price=" + price + ", quantity=" + quantity
				+ ", status=" + status + ", indate=" + indate + "]";
	}
     
}
