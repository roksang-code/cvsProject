package com.cvs.mapper;

import java.util.List;

import com.cvs.model.BoardVO;
import com.cvs.model.Criteria;
import com.cvs.model.Md_infoVO;

public interface BoardMapper {
	

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	
	
	public BoardVO boardDetail(int no) throws Exception;
	
	public void boardWrite(BoardVO board) throws Exception;

	public void boardUpdate(BoardVO board) throws Exception;

	public void boardDelete(BoardVO board) throws Exception;
	
	public void boardCnt(int no) throws Exception;

	//게시판 글쓰기할때 파일 업로드
	public void addAttach(String fileName) throws Exception;

	//게시판 업데이트할때 파일 업로드
	public void updateAttach(String fileName, int no) throws Exception;

	//디테일 업로드
	public List<String> getAttach(Integer no) throws Exception;

	public List<Md_infoVO> approval_list(Md_infoVO mdvo) throws Exception;

	public List<Md_infoVO> approval_detail_list(int member_no) throws Exception;

	public void order_approval_check(String barcode_no, int member_no)throws Exception;

	public void addMD(Md_infoVO mivo) throws Exception;
	public void addMD_price(Md_infoVO mivo) throws Exception;

}
