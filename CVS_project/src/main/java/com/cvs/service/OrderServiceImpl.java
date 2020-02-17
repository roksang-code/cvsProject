package com.cvs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cvs.mapper.OrderMapper;
import com.cvs.model.Md_infoVO;


@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper om;
	
	@Override
	public List<Md_infoVO> orderList(String type, String detail_type, String md_name) throws Exception {

		return om.orderList(type, detail_type, md_name);
	}

	@Override
	public List<Md_infoVO> typePage(String type) throws Exception {

 		return om.typePage(type);

	}


	
	
}
