package com.cvs.service;

import java.util.List;

import com.cvs.model.BoardVO;
import com.cvs.model.Criteria;

public interface BoardService {


	//게시판 리스트
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	//count paging
	public int listCountCriteria(Criteria cri) throws Exception;

	
	

	//게시판 제목을 클릭했을 때
	public BoardVO boardDetail(int no) throws Exception;
	
	//게시판 글수정
	public void boardUpdate(BoardVO board) throws Exception;
	
	//게시판 글삭제
	public  void boardDelete(BoardVO board) throws Exception;
	
	//게시판 글작성
	public  void boardWrite(BoardVO board) throws Exception;

	//조회수
	public void boardCnt(int no) throws Exception;
		
	public List<String> getAttach(Integer no) throws Exception;

	
	
}
