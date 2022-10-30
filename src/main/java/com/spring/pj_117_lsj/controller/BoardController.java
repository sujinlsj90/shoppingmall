package com.spring.pj_117_lsj.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.pj_117_lsj.dao.BoardDAOImpl;
import com.spring.pj_117_lsj.dto.BoardDTO;
import com.spring.pj_117_lsj.service.BoardServiceImpl;


@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardServiceImpl service;
	
	@Autowired
	BoardDAOImpl dao;
	
	//게시글목록
	@RequestMapping("boardList.bo")
	public String boardList(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /boardList.bo]");
		
		service.boardListAction(req, model);
		return "customer/board/boardList";
	}
	
	//게시글
	@RequestMapping("board_detailAction.bo")
	public String board_detailAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /board_detailAction.bo]");
		service.boardDetailAction(req, model);
		return "customer/board/board_detailAction";
	}
	//수정 삭제시 비밀번호 인증
	@RequestMapping("password_chk.bo")
	public String password_chk(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /password_chk.bo]");
		String result = service.password_ChkAction(req, model);
         
         // 3단계. 화면으로부터 입력받은 값을 받는다.
         int num = Integer.parseInt(req.getParameter("num"));
         // 비밀번호가 일치하면 수정화면으로 이동
         if(result != null) {
            // 4단계. 상세페이지
            BoardDTO dto = dao.getBoardDetail(num);
            // 5단계. jsp로 처리 결과 전달
            model.addAttribute("dto", dto);
         
		return "customer/board/board_edit";
		
	 } else {
         System.out.println("----- 비밀번호 불일치 -----");
         String viewPage = req.getContextPath() + "/board_detailAction.bo?num=" + num + "&message=error";
         res.sendRedirect(viewPage);
         return null;
      }
	}
	@RequestMapping("board_updateAction.bo")
	public void updateBoard(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /board_updateAction.bo]");
		service.boardUpdateAction(req, model);
		String viewPage = req.getContextPath() + "/boardList.bo";
        res.sendRedirect(viewPage);
	}
	
	//게시판 삭제처리
	@RequestMapping("board_deleteAction.bo")
	public void board_deleteAction(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /board_deleteAction.bo]");
		service.boardDeleteAction(req, model);
		String viewPage = req.getContextPath() + "/boardList.bo";
        res.sendRedirect(viewPage);
	}
	
	//글쓰기 화면
	@RequestMapping("board_insert.bo")
	public String board_insert(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /board_insert.bo]");
		
		return "customer/board/board_insert";
		
	}
	
	//글쓰기 처리
	@RequestMapping("board_insertAction.bo")
	public void board_insertAction (HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /board_insertAction.bo]");

		service.boardInsertAction(req, model);
		String viewPage = req.getContextPath() + "/boardList.bo";
  	  	res.sendRedirect(viewPage);
	}
	
	//댓글목록
	@RequestMapping("commentList.bo")
	public String commentList(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /commentList.bo]");
		service.commentListAction(req, model);
		return "customer/board/comment_list";
		
	}
	
	//댓글작성
	@RequestMapping("commentAdd.bo")
	public String commentAdd(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /commentList.bo]");
		service.commentAddAction(req, model);
		//$.ajax의 콜백함수(success)로 이동
		
		return "customer/board/comment_list";
	}
	
	//게시글 검색
	@RequestMapping("search.bo")
	public String search(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		logger.info("[url => /search.bo]");
		service.searchList(req, model);
		//$.ajax의 콜백함수(success)로 이동
		
		return "customer/board/search_next";
	}
	
	
	
	
	
}
