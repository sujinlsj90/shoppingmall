package com.spring.pj_117_lsj.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.pj_117_lsj.dao.CustomerDAOImpl;
import com.spring.pj_117_lsj.dto.CustomerDTO;

import util.EmailChkHandler;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDAOImpl dao;

	@Autowired
	BCryptPasswordEncoder passwordEncoder; // 비밀번호 암호화 클래스

//dto, dao 사이에서 중간처리 역할	

	// 중복확인 처리
	@Override
	public void confirmIDAction(HttpServletRequest req, Model model) {
		System.out.println("서비스 =>중복확인처리");

		// 3단계. 화면으로부터 입력받은 값을 받는다
		String strId = req.getParameter("id");

//		//4단계. 싱글톤방식으로 dao 객체생성
//		CustomerDAO dao = CustomerDAOImpl.getInstance();

		// 5단계. 중복확인처리
		int selectCnt = dao.idCheck(strId);

		// 6단계.jsp로 값 전달
		req.setAttribute("id", strId);
		req.setAttribute("selectCnt", selectCnt);

	}

	// 회원가입처리 - 시큐리티(암호화된 비밀번호 추가, 이메일 인증 키 추가, 가입성공 시 이메일 검증 )
	@Override
	public void signInAction(HttpServletRequest req, Model model) {
		System.out.println("서비스 => 회원가입처리");

		// 3단계. 화면으로부터 입력받은 값을 받는다.
		// dto 생성
		CustomerDTO dto = new CustomerDTO();
		dto.setId(req.getParameter("id"));

		// 비밀번호 암호화 - 시큐리티
		String Password = req.getParameter("password");
		System.out.println("암호화 전의 비밀번호" + Password);

		// BCryptPasswordEncoder.encode(): 비밀번호 암호화 메서드
		String encryptPassword = passwordEncoder.encode(Password);
		System.out.println("암호화 후의 비밀번호 : " + encryptPassword);

		dto.setPassword(Password);
		dto.setPassword(encryptPassword); // 암호화 된 비밀번호를 넣어라

		dto.setName(req.getParameter("name"));
		// 년-월-일 형식(input type="date")
		// String strDate = req.getParameter("birthday");
		// Date date = Date.valueOf(strDate);
		// dto.setBirthday(date);
		dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
		dto.setAddress(req.getParameter("address"));

		// hp은 필수가 아니므로 null 값이 들어올수 있으므로 값이 존재할때만 처리
		String hp = "";
		String strHp1 = req.getParameter("hp1");
		String strHp2 = req.getParameter("hp2");
		String strHp3 = req.getParameter("hp3");

		if (!strHp1.equals("") && !strHp2.equals("") && !strHp3.equals("")) {
			hp = strHp1 + "-" + strHp2 + "-" + strHp3;
		}
		dto.setHp(hp);

		String email = "";
		String strEmail1 = req.getParameter("email1");
		String strEmail2 = req.getParameter("email2");
		email = strEmail1 + "@" + strEmail2;
		dto.setEmail(email);

		// 시큐리티
		String key = EmailChkHandler.getKey();
		dto.setKey(key);

		// regDate는 입력값이 없으면 default를 sysdate로 설정했음, 아래문장은 직접 값을 설정
		dto.setRegDate(new Timestamp(System.currentTimeMillis()));

		// 5단계. 회원가입 처리
		int insertCnt = dao.insertCustomer(dto);
		System.out.println("서비스 insert: " + insertCnt);

		// 시큐리티 - 가입성공시 이메일 검증
		if (insertCnt == 1) {
			// 이메일은 반드시 가입된 이메일(네이버로 설정하였음)
			dao.sendEmail(email, key);
		}
		// 6단계. jsp로 처리 결과 전달
		// req.setAttribute("insertCnt", insertCnt);
		model.addAttribute("insertCnt", insertCnt);

	}

	// 로그인처리
	@Override
	public void loginAction(HttpServletRequest req, Model model) {
		// 화면에서 입력받은 값 받기
		String strId = req.getParameter("id");
		String strPassword = req.getParameter("password");

		// 싱글톤으로 DAO 객체생성
//		CustomerDAO dao = CustomerDAOImpl.getInstance();

		// 로그인처리
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strId", strId);
		map.put("strPassword", strPassword);
		int selectCnt = dao.idPasswordChk(map);

		// 로그인성공
		if (selectCnt == 1) {
			// 로그인 성공시에는 세션 ID를 설정
			/* HttpSession session = req.getSession(); */
			req.getSession().setAttribute("customerId", strId);
		}

		// jsp로 결과전달
		req.setAttribute("selectCnt", selectCnt);
	}

	// 회원정보 인증 및 탈퇴처리
	   @Override
	   public void deleteCustomerAction(HttpServletRequest req, Model model) {
	      // 3단계. 화면으로부터 입력받은 값을 받는다.
	      String strId = (String)req.getSession().getAttribute("customerId");   // 세션ID
	      
	      int deleteCnt = dao.deleteCustomer(strId);
	      System.out.println("deleteCnt : " + deleteCnt);
	      req.setAttribute("deleteCnt", deleteCnt);
	}

	// 회원정보 인증 및 상세페이지
	@Override
	public void modifyDetailAction(HttpServletRequest req, Model model) {
		System.out.println("서비스 => 회원정보 인증 및 상세페이지");
	    // 3단계. 화면으로부터 입력받은 값을 받는다.
	      String strId = (String)req.getSession().getAttribute("customerId");   // 세션ID
	      
	      CustomerDTO dto = dao.getCustomerDetail(strId);
	      System.out.println("서비스 dto :" + dto);
	      
	      // 6단계. jsp로 처리 결과 전달(request나 session으로 처리 결과를 저장 후 전달)
	      model.addAttribute("dto", dto);
	      

//		// 3단계 화면으로부터 값 입력받기
//		String strId = (String) req.getSession().getAttribute("customerId");
//		String strPassword = (String) req.getParameter("password");
//
//		// 4단계 싱글톤 방식으로 dao 객체생성, 다형성 적용
////		CustomerDAO dao = CustomerDAOImpl.getInstance();
//
//		// 5-1단계 회원인증
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("strId", strId);
//		map.put("strPassword", strPassword);
//		int selectCnt = dao.idPasswordChk(map);
//
//		// 5-2단계 회원정보 인증 및 상세페이지
//		CustomerDTO dto = null;
//		if (selectCnt == 1) {
//			dto = dao.getCustomerDetail(strId);
//			System.out.println("selectCnt : " + selectCnt);
//		}
//
//		// 6단계 JSP로 처리 결과 전달
//		req.setAttribute("selectCnt", selectCnt);
//		req.setAttribute("dto", dto);
	}

	// 회원정보 수정 처리
	@Override
	public void modifyCustomerAction(HttpServletRequest req, Model model) {
		System.out.println("서비스 => 회원정보 수정");

		// 3-1단계 dto 생성
		CustomerDTO dto = new CustomerDTO();

		// 3단계 화면으로부터 입력받은 값을 dto에 담는다
		dto.setId((String) req.getSession().getAttribute("customerId"));
		
		 // 비밀번호 암호화 
	      String password = req.getParameter("password");
	      System.out.println("암호화 전의 비밀번호 : " + password);
	      
	      String encryptPassword = passwordEncoder.encode(password);
	      System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
	      
	      // 암호화된 비밀번호를 setter로 담는다.
	      dto.setPassword(encryptPassword);
		
		
		
		dto.setName(req.getParameter("name"));
		dto.setBirthday(Date.valueOf(req.getParameter("birthday")));
		dto.setAddress(req.getParameter("address"));

		String hp = "";
		String strHp1 = req.getParameter("hp1");
		String strHp2 = req.getParameter("hp2");
		String strHp3 = req.getParameter("hp3");
		if (!strHp1.equals("") && !strHp2.equals("") && !strHp3.equals("")) {
			hp = strHp1 + "-" + strHp2 + "-" + strHp3;
		}
		dto.setHp(hp);

		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		email = email1 + "@" + email2;
		dto.setEmail(email);

		dto.setRegDate(new Timestamp(System.currentTimeMillis()));

		// 4단계 싱글톤 방식으로 dao 객체생성, 다형성 적용
//		CustomerDAO dao = CustomerDAOImpl.getInstance();

		// 5단계 회원정보 수정처리
		int updateCnt = dao.updateCustomer(dto);

		// 6단계 JSP로 처리 결과 전달
		model.addAttribute("updateCnt", updateCnt);

	}

	// 이메일 인증 -시큐리티 메일 인증 후 권한 (enabled) update
	@Override
	public void emailChkAction(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		int selectCnt = dao.selectKey(key);
		System.out.println("<<<<<<<be. select:" + selectCnt);
		if (selectCnt == 1) {
			System.out.println("<<<<<<<af. select:" + selectCnt);
			int insertCnt = dao.updateGrade(key);
			System.out.println("<<<<<<<<insertCnt: " + insertCnt);
			model.addAttribute("insertCnt", insertCnt);

		}
	}

}
