package com.spring.pj_117_lsj.dao;

import java.util.Map;

import com.spring.pj_117_lsj.dto.CustomerDTO;


public interface CustomerDAO {
// service와 db를 이어주는 중간다리 역할
	
	// ID중복확인처리
	public int idCheck(String strId);
	
	//회원가입처리
	public int insertCustomer(CustomerDTO dto);
	
	//시큐리티 - 가입성공 시 이메일 인증을 위한 이메일 전송
	public void sendEmail(String email, String key);
	
	//시큐리티 - 로그인 전 이메일 인증을 해야한다.
	public int selectKey(String key);
	
	//시큐리티 - 등급 변경
	public int updateGrade(String key);
	
	//로그인처리 / 회원정보인증(수정,탈퇴)
	public int idPasswordChk(Map<String, Object> map);
	
	//회원정보인증 및 탈퇴처리
	public int deleteCustomer(String strId);
	
	//회원정보인증 및 상세페이지
	public CustomerDTO getCustomerDetail(String strID);
	
	//회원정보 수정처리
	public int updateCustomer(CustomerDTO dto);
	
	
	
}
