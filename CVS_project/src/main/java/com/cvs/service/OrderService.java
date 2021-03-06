package com.cvs.service;

import java.util.List;

import com.cvs.model.Md_infoVO;
import com.cvs.model.Order_boardVO;

public interface OrderService {

	public List<Md_infoVO> orderList(String member_no, String type, String detail_type, String md_name) throws Exception;

	public List<Md_infoVO> typePage(String type) throws Exception;

	public void MDorder(Order_boardVO obvo) throws Exception;

	public void check_md(String barcode_no, int member_no) throws Exception;


}
