package com.cvs.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cvs.model.BoardVO;
import com.cvs.model.Criteria;
import com.cvs.model.Md_infoVO;
import com.cvs.model.Tel_membership_infoVO;

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
	@Override
	public List<Md_infoVO> approval_list(Md_infoVO mdvo) throws Exception {

		List<Md_infoVO> approval_list = session.selectList(namespace + ".approval_list", mdvo);
		return approval_list;
	}
	@Override
	public List<Md_infoVO> approval_detail_list(int member_no) throws Exception {
		
		List<Md_infoVO> approval_detail_list = session.selectList(namespace + ".approval_detail_list", member_no);
		return approval_detail_list;
	}
	@Override
	public void order_approval_check(String barcode_no, int member_no) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("barcode_no", barcode_no);
		paramMap.put("member_no", member_no);
	
		
		session.delete(namespace+".order_approval_check", paramMap);

	}
	
	
}
