package com.cvs.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cvs.model.Md_infoVO;
import com.cvs.model.Order_boardVO;



@Repository
public class OrderMapperImpl implements OrderMapper{

	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.cvs.mapper.OrderMapper";

	
	@Override
	public List<Md_infoVO> orderList(String member_no, String type, String detail_type, String md_name) throws Exception {


		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("member_no", member_no);
		paramMap.put("type", type);
		paramMap.put("detail_type", detail_type);
		paramMap.put("md_name", md_name);
		
		List<Md_infoVO> orderList = session.selectList(namespace + ".orderList", paramMap);

		return orderList;
	}


	@Override
	public List<Md_infoVO> typePage(String type) throws Exception {

		List<Md_infoVO> typePage = session.selectList(namespace + ".typePage", type);

		return typePage;
	}


	@Override
	public void MDorder(Order_boardVO obvo) throws Exception {

		
		session.insert(namespace + ".MDorder", obvo);
	}


	@Override
	public void check_md(String barcode_no, int member_no) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("barcode_no", barcode_no);
		paramMap.put("member_no", member_no);
		
	
		session.update(namespace+".check_md", paramMap);

		
	}

	

}
