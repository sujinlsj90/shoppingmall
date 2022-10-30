package com.spring.pj_117_lsj.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pj_117_lsj.dto.BoardCommentDTO;
import com.spring.pj_117_lsj.dto.BoardDTO;


@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	SqlSession sqlsession;
	
	   // 게시글 목록
	   @Override
	   public List<BoardDTO> boardList(Map<String, Object> map) {
	      System.out.println("DAO - boardList");
	      //방법1.
	      List<BoardDTO> list = sqlsession.selectList("com.spring.pj_117_lsj.dao.BoardDAO.boardList", map);
  
// 1. list 생성
   // 2. dto 생성
   // 3. dto에 rs  게시글정보를 담는다.
   // 4. list에 dto를 추가한다.
   // 5. return list
	      return list;
	   }

	// 게시글 갯수 구하기
	@Override
	public int boardCnt(String Keyword) {
		System.out.println("DAO - boardCnt");
		int selectCnt  = sqlsession.selectOne("com.spring.pj_117_lsj.dao.BoardDAO.boardCnt", Keyword);
		return selectCnt;
	}



	// 조회수 증가
	@Override
	public void plusReadCnt(int num) {
		System.out.println("DAO - plusReadCnt");
		
		//new BoardDAO와 같음
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.plusReadCnt(num);
			
	}

	// 게시글 상세페이지
	@Override
	public BoardDTO getBoardDetail(int num) {
		System.out.println("DAO - getBoardDetail");
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		BoardDTO dto = dao.getBoardDetail(num);
		return dto;
	}

	// 비밀번호 인증
	@Override
	public String passwordChk(Map<String, Object> map) {
		System.out.println("DAO => passwordChk");
//		String result = sqlsession.selectOne("com.spring.pj_117_lsj.dao.BoardDAO.passwordChk", map);
		//방법2
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		String result = dao.passwordChk(map);
		return result;
			
	}

	// 게시글 수정처리
	@Override
	public void updateBoard(BoardDTO dto) {
		System.out.println("DAO => updateBoard");
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.updateBoard(dto);
	}

	// 게시글 삭제처리
	@Override
	public void deleteBoard(int num) {
		System.out.println("DAO => deleteBoard");
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.deleteBoard(num);
	}

	
	// 게시글 작성처리
	@Override
	public void boardInsert(BoardDTO dto) {
		System.out.println("dao - boardInsert");
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.boardInsert(dto);
			
	}
	//댓글추가처리
	@Override
	public void commentInsert(BoardCommentDTO dto) {
		System.out.println("dao - commentInsert");
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.commentInsert(dto);
			
	}
		
	
	//댓글목록처리
	@Override
	public List<BoardCommentDTO> commentList(int num) {
		System.out.println("DAO => commentList");
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		List<BoardCommentDTO> list  = dao.commentList(num);
		return list;
	}

	//게시글 검색
	@Override
	public List<BoardDTO> searchList(Map<String, Object> map) {
		System.out.println("DAO => commentList");
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		List<BoardDTO> list  = dao.searchList(map);
		return list;
	}
	
	
}
