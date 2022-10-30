package com.spring.pj_117_lsj.dao;

import java.util.Map;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Message;
import javax.mail.Transport;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pj_117_lsj.dto.CustomerDTO;

import util.SettingValues;


@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	SqlSession sqlSession;

	// 회원가입처리
	@Override
	public int insertCustomer(CustomerDTO dto) {
		int insertCnt = sqlSession.insert("com.spring.pj_117_lsj.dao.CustomerDAO.insertCustomer", dto);
		System.out.println("DAO - insert : " + insertCnt);
		return insertCnt;
	}

	// ID중복확인처리

	@Override
	public int idCheck(String strId) {
		System.out.println("dao - ID중복확인처리");
		// 1건: selectOne, 다건: selectList ex)게시판 list
		int selectCnt = sqlSession.selectOne("com.spring.pj_117_lsj.dao.CustomerDAO.idCheck", strId);
		return selectCnt;
	}

	// 시큐리티 - 가입성공 시 이메일 인증을 위한 이메일전송
	@Override
	public void sendEmail(String email, String key) {

		final String username = SettingValues.ADMIN; // 네이버 이메일 ID : @nave.com은 입력하지 않는다.
		final String password = SettingValues.PW; // 네이버 비밀번호 :
		final String host = "smtp.naver.com"; // Google일 경우 smtp.gmail.com
		int port = 465; // 포트번호

		// 메일 내용
		String recipient = "sujinlsj@naver.com"; // 받는 사람의 메일주소를 입력해주세요.
		String subject = "회원가입 인증 메일"; // 메일 제목 입력해주세요.

		String content = "회원가입을 축하드립니다. 링크를 눌러 회원가입을 완료하세요."
		+ "<a href='http://localhost/pj_117_lsj/emailChkAction.do?key="
				+ key + "'>링크</a>";

		Properties props = System.getProperties();

		// 정보를 담기 위한 객체 생성
		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		// Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); // for debug

		try {
			Message mimeMessage = new MimeMessage(session); // MimeMessage 생성
			mimeMessage.setFrom(new InternetAddress("sujinlsj@naver.com")); // 발신자 셋팅
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자셋팅
			mimeMessage.setSubject(subject); // 제목셋팅
			// mimeMessage.setText(body); //내용셋팅
			mimeMessage.setContent(content, "text/html; charset=utf-8");
			Transport.send(mimeMessage); // javax.mail.Transport.send() 이용
			System.out.println("<<<< Email SEND >>>>");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 시큐리티 - 로그인 전 이메일 인증을 해야한다
	@Override
	public int selectKey(String key) {
		System.out.println("dao - selectKey");
		int selectCnt = sqlSession.selectOne("com.spring.pj_117_lsj.dao.CustomerDAO.selectKey", key);
		return selectCnt;
	}
	
	// 시큐리티 - 등급변경
	@Override
	public int updateGrade(String key) {
		System.out.println("dao - updateGrade");
		int updateCnt = sqlSession.update("com.spring.pj_117_lsj.dao.CustomerDAO.updateGrade", key);
		return updateCnt;
	}

	// 로그인처리 / 회원정보인증(수정,탈퇴)
	@Override
	public int idPasswordChk(Map<String, Object> map) {
		System.out.println("DAO - 로그인처리");

		int selectCnt = sqlSession.selectOne("com.spring.pj_117_lsj.dao.CustomerDAO.idCheck", map);
		return selectCnt;
	}

	// 회원정보인증 및 탈퇴처리
	@Override
	public int deleteCustomer(String strId) {
		System.out.println("DAO - 회원탈퇴처리");
		int deleteCnt = sqlSession.delete("com.spring.pj_117_lsj.dao.CustomerDAO.deleteCustomer", strId);
		return deleteCnt;
	}

	// 회원정보 인증 및 상세페이지
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		System.out.println("dao - getCustomerDetail");

		CustomerDTO dto = sqlSession.selectOne("com.spring.pj_117_lsj.dao.CustomerDAO.getCustomerDetail", strId);
		System.out.println(dto);
		return dto;
	}

	// 회원정보 수정처리
	@Override
	public int updateCustomer(CustomerDTO dto) {
		System.out.println("DAO - updateCustomer");
		int updateCnt = sqlSession.update("com.spring.pj_117_lsj.dao.CustomerDAO.updateCustomer", dto);
		return updateCnt;
	}

}
