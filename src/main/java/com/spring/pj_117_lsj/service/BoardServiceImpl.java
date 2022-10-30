package com.spring.pj_117_lsj.service;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.pj_117_lsj.dao.BoardDAOImpl;
import com.spring.pj_117_lsj.dto.BoardCommentDTO;
import com.spring.pj_117_lsj.dto.BoardDTO;

import page.Paging;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardDAOImpl dao;
	
	// 게시글 목록
		@Override
		public void boardListAction(HttpServletRequest req, Model model) 
				throws ServletException, IOException {
		System.out.println("서비스 =>");
		
		String keyword = "";
		String pageNum = req.getParameter("pageNum");
		
		int total = dao.boardCnt(keyword);
		System.out.println("total => " + total);
		
		Paging paging = new Paging(pageNum);
		
		paging.setTotalCount(total);
		
		//5-2단계 게시글목록
		List<BoardDTO> list = null;
		if(total > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			int start = paging.getStartRow();  //페이지별 시작번호
			int end = paging.getEndRow(); //페이지별 끝번호
			map.put("start", start);
			map.put("end", end);
			map.put("keyword", keyword);
			
			list = dao.boardList(map);
		} 
		
		//6단계 jsp로 처리결과 전달
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	

	//게시글 상세페이지
	@Override
	public void boardDetailAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service => boardDetailAction");
		
		//3단계. 화면으로부터 입력받은 값을 받는다
		int num = Integer.parseInt(req.getParameter("num"));
		System.out.println("게시글번호: " + num);
		
		dao.plusReadCnt(num);
		
		BoardDTO dto = dao.getBoardDetail(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("num", num);
	}
	
	//비밀번호 인증
	@Override
	public String password_ChkAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service => password_ChkAction");
		//3단계. 화면으로부터 입력받은 값을 받는다
		int num = Integer.parseInt(req.getParameter("num"));
		String password = req.getParameter("password");
		System.out.println("글번호: " + num + ", 비밀번호: " + password);
		
		Map <String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("password", password);
		
		String result = dao.passwordChk(map);
		
		return result;
	}
	
	//게시글 수정처리
	@Override
	public void boardUpdateAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service => boardUpdateAction");
		//화면으로부터 입력받은 값 dto에 담기
		BoardDTO dto = new BoardDTO();
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setTitle(req.getParameter("title"));
		dto.setPassword(req.getParameter("password"));
		dto.setContent(req.getParameter("content"));
		
		
        //update 후 list로 이동
		dao.updateBoard(dto);
        
	}
	
	//게시글 삭제처리
	@Override
	public void boardDeleteAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service => boardDeleteAction");
		int num = (Integer.parseInt(req.getParameter("num")));
		
		dao.deleteBoard(num);
	}
	
	//게시글 작성처리
	@Override
	public void boardInsertAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service => boardInsertAction");
		//화면으로부터 값 입력받기
		BoardDTO dto = new BoardDTO();
		dto.setWriter(req.getParameter("writer"));
		dto.setPassword(req.getParameter("password"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		
		
		//글쓰기 처리
		dao.boardInsert(dto);
		
	}
	
	// 댓글 추가처리
	@Override
	public void commentAddAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service => commentAddAction");
		//화면으로 부터 입력받은 값 hidden(num) 입력받기
		System.out.println("board_num" + Integer.parseInt(req.getParameter("board_num")));
		System.out.println("writer" + (req.getParameter("writer")));
		System.out.println("content" + (req.getParameter("content")));
		
		//dto에 담기
		BoardCommentDTO dto = new BoardCommentDTO();
		dto.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		dto.setWriter(req.getParameter("writer"));
		dto.setContent (req.getParameter("content"));
		
		//dao 호출 및 insert 메서드에 dto 넘기기
		dao.commentInsert(dto);
		
		
	}
	
	// 댓글 목록처리
	@Override
	public void commentListAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service => + commentListAction");
		//화면으로부터 입력받은 값 받기
		int board_num = Integer.parseInt(req.getParameter("board_num"));
		System.out.println("board_num: " + board_num);
		//댓글목록 조회
		List<BoardCommentDTO> list = dao.commentList(board_num);
		//jsp로 처리 결과 전달
		model.addAttribute("board_num", board_num);
		model.addAttribute("list", list);
		//comment_list()의 콜백함수 result로 결과 전달
	}


	@Override
	public void searchList(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service =>searchList");
		
		String pageNum = req.getParameter("pageNum");
		String keyword = req.getParameter("keyword");
		System.out.println("keyword: " +  keyword);
		Paging paging = new Paging(pageNum);
		int total = dao.boardCnt(keyword);
		
		paging.setTotalCount(total);
		
		List<BoardDTO> list2 = null;
		if(total > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			int start = paging.getStartRow();  //페이지별 시작번호
			int end = paging.getEndRow(); //페이지별 끝번호
			map.put("start", start);
			map.put("end", end);
			map.put("keyword", keyword);
			System.out.println("keyword2: " +  keyword);
			list2 = dao.searchList(map);
		} 
		
		model.addAttribute("list2", list2);
		model.addAttribute("paging", paging);
	}

}
