package com.cvs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cvs.mapper.OrderMapper;
import com.cvs.model.Md_infoVO;
import com.cvs.model.Order_boardVO;


@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper om;
	
	@Override
	public List<Md_infoVO> orderList(String member_no, String type, String detail_type, String md_name) throws Exception {

		return om.orderList(member_no, type, detail_type, md_name);
	}

	@Override
	public List<Md_infoVO> typePage(String type) throws Exception {

 		return om.typePage(type);

	}

	@Override
	public void MDorder(Order_boardVO obvo) throws Exception {

 		om.MDorder(obvo);
		
	}

	@Override
	public void check_md(String barcode_no, int member_no) throws Exception {

 		om.check_md(barcode_no, member_no);		
	}


	
	
}
