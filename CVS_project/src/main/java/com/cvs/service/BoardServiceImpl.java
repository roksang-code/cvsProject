package com.cvs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cvs.mapper.BoardMapper;
import com.cvs.model.BoardVO;
import com.cvs.model.Criteria;
import com.cvs.model.Md_infoVO;

@Repository
@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper bm;
	
	

	@Override
	public BoardVO boardDetail(int no) throws Exception {
		
		return bm.boardDetail(no);

	}

	
	@Override
	public void boardUpdate(BoardVO board) throws Exception {
	
		bm.boardUpdate(board);
	}

	@Override
	public void boardDelete(BoardVO board) throws Exception {
		
		bm.boardDelete(board);
	}

	@Transactional
	@Override
	public void boardWrite(BoardVO board) throws Exception {
	
		
		bm.boardWrite(board);

		  String[] files = board.getFiles(); 
		  System.out.println("files = "+board.getFiles());
		  if(files == null) { return; }
		  
		  for(String fileName : files) {
			  System.out.println("filename = "+fileName); 
			  bm.addAttach(fileName); }
		 
	}

	@Override
	public void boardCnt(int no) throws Exception {
		bm.boardCnt(no);
		
	}

	
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return bm.listCriteria(cri);

	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {

		return bm.countPaging(cri);
	}

	@Override
	public List<String> getAttach(Integer no) throws Exception {

		return bm.getAttach(no);
	}


	@Override
	public List<Md_infoVO> approval_list(Md_infoVO mdvo) throws Exception {

		return bm.approval_list(mdvo);
	}

	
	

}
