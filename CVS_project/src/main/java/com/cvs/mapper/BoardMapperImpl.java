package com.cvs.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cvs.model.BoardVO;
import com.cvs.model.Criteria;

@Repository
public class BoardMapperImpl implements BoardMapper {
	
	@Inject
	private SqlSession session;
	private static String namespace = "com.cvs.mapper.BoardMapper";
	
	
	@Override
	public BoardVO boardDetail(int num) throws Exception  {
	 return	session.selectOne(namespace+".boardDetail",num);
		
	}
	@Override
	public void boardWrite(BoardVO board) throws Exception {
		
		session.insert(namespace+".boardWrite",board);
		
	}
	@Override
	public void boardUpdate(BoardVO board) throws Exception {
		session.update(namespace+".boardUpdate",board);
		
	}
	
	
	@Override
	public void boardCnt(int no) throws Exception {
		session.update(namespace+".boardCnt",no);
		
	}
	
	@Override
	public void boardDelete(BoardVO board) throws Exception {
		session.delete(namespace+".boardDelete",board);
		
	}
	
	

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {

		return session.selectList(namespace+".listCriteria",cri);

	}
	@Override
	public int countPaging(Criteria cri) throws Exception  {
	 return	session.selectOne(namespace+".countPaging",cri);
		
	}
	//게시판 글쓰기 할때 파일 업로드
	@Override
	public void addAttach(String fileName) throws Exception {
		session.insert(namespace+".addAttach",fileName);
		
	}
	//디테일 업로드
	@Override
	public List<String> getAttach(Integer no) throws Exception {
		return session.selectList(namespace+".getAttach",no);
		
	}
	
}
