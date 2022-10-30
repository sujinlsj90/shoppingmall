package com.spring.pj_117_lsj.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.pj_117_lsj.dao.AdminDAOImpl;
import com.spring.pj_117_lsj.dto.BalanceChartDTO;
import com.spring.pj_117_lsj.dto.BalanceDTO;
import com.spring.pj_117_lsj.dto.CustomerDTO;
import com.spring.pj_117_lsj.dto.MyAccountDTO;
import com.spring.pj_117_lsj.dto.RefundDTO;
import com.spring.pj_117_lsj.dto.SoldDTO;

import page.Paging;


@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAOImpl dao; 
	
	// 주문신청 리스트
	@Override
	public void orderConfirmListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("service => orderConfirmListAction");

		List<MyAccountDTO> list = dao.orderConfirmList();

		req.setAttribute("list", list);
	}

	// 주문 승인
	@Override
	public void updateOrderAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("service => updateOrderAction");
		int orderNo = Integer.parseInt(req.getParameter("orderNo"));
		String orderState = req.getParameter("orderState");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNo", orderNo);
		map.put("orderState", orderState);
		dao.updateOrderState(map); // 주문승인 쿼리

		dao.updatePDTQuantity(orderNo); // 주문 승인 시 재고 quantity 반영

		int insertCnt = dao.AddoutSoldList(orderNo); 
		if (insertCnt != 0) {
			dao.outSoldListDelete(orderNo);// 주문 승인 시 목록에서 삭제 후 판매완료 페이지에 INSERT(최종적으로는 판매완료 리스트, 환불완료 리스트에서만 고객 생성 데이터 남김)
		}

	}



	// 판매완료 리스트
	@Override
	public void adminOutSoldListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		 
		List<SoldDTO> list = dao.outSoldListAd();

		req.setAttribute("list", list);

	}

	// 환불리스트
	@Override
	public void refundListAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		 
		List<RefundDTO> list = dao.refundList();

		req.setAttribute("list", list);

	}

	// 환불승인
	@Override
	public void updateRefundStateAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		int refundNo = Integer.parseInt(req.getParameter("refundNo"));

		dao.updateRefundState(refundNo); // 환불승인 쿼리 -- 환불내역은 리스트로 남김
		dao.minusPDTQuantity(refundNo);

	}
	
	// 환불완료목록
	@Override
	public void refundEndListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		 
		List<RefundDTO> list = dao.refundEndList();

		req.setAttribute("list", list);
		
	}
	
	//결산목록
	@Override
	public void balaceListAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service : balaceListAction");
		BalanceDTO dto = dao.balanceAction();
		req.setAttribute("dto", dto);
		
		
		
	}
	
	//결산차트
	@Override
	public void balanceChart(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service : balanceChart");
		String pdName = null;
		int soldTotal = 0;
		String result = "";
		
		List<BalanceChartDTO> list = dao.getbalanceChart();	//결산 데이터(뷰)를 리스트로 받음
		
		//for문을 돌면서 각각 pdName과 soldTotal값을 result변수에 담음(json데이터의 형태를 임의로 만들어냄)
		for(int i = 0; i < list.size(); i++) {	
			pdName = list.get(i).pdName;
			soldTotal = list.get(i).soldTotal;
			if(result != "") {
				result += ",";
			}
			result += "['" + pdName + "', " + soldTotal + ", '#b87333']"; 
			//가장 뒤에 '#b87333'는 옵션값(데이터와 상관x),
			//다른 색 필요하거나 옵션 따로주고 싶은 경우 google developer 참고
		}
		//화면에 result 보내기
		model.addAttribute("result", result);
		System.out.println("result : " + result);
		//result 출력 시 형태
		//['AA', 14000, '#b87333'],['라쿠풀라', 28000, '#b87333'],['만델링', 12000, '#b87333']
	}


	//회원리스트
	@Override
	public void memberListAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		 
		List<CustomerDTO> list = dao.getMemberInfo();
		req.setAttribute("list", list);
		
	}
	


}
