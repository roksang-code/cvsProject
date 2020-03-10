package com.cvs.service;

import java.util.List;

import com.cvs.model.BoardVO;
import com.cvs.model.Criteria;
import com.cvs.model.Md_infoVO;

public interface AdminService {


	//게시판 리스트
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	//count paging
	public int listCountCriteria(Criteria cri) throws Exception;

	
	

	public BoardVO boardDetail(int no) throws Exception;	//게시판 제목을 클릭했을 때
	
	public void boardUpdate(BoardVO board) throws Exception;	//게시판 글수정
	
	public  void boardDelete(int no) throws Exception;	//게시판 글삭제

	public  void boardWrite(BoardVO board) throws Exception;	//게시판 글작성

	public void boardCnt(int no) throws Exception;	//조회수
		
	public List<String> getAttach(Integer no) throws Exception;

	public List<Md_infoVO> approval_list(Md_infoVO mdvo) throws Exception; //발주 승인리스트

	public List<Md_infoVO> approval_detail_list(int member_no)throws Exception; //상세 발주승인 리스트

	public void order_approval_check(int barcode_no, int member_no, int order_ea)throws Exception; //발주승인

	public void addMD(Md_infoVO mivo)throws Exception;//상품등록

	
	
}
