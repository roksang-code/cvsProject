package com.cvs.mapper;

import java.util.List;

import com.cvs.model.Md_infoVO;

public interface OrderMapper {

	public List<Md_infoVO> orderList(String type, String detail_type, String md_name) throws Exception;

	public List<Md_infoVO> typePage(String type)throws Exception;

	
	
}
