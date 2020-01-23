package com.cvs.mapper;

import java.util.List;

import com.cvs.model.Auto_incrementVO;
import com.cvs.model.Md_infoVO;
import com.cvs.model.Member_infoVO;
import com.cvs.model.Pos_boardVO;

public interface PosMapper {
	
	public Md_infoVO inputMdlist(int barcode_no) throws Exception;
	
	public void Payment(Pos_boardVO pvo) throws Exception;

	public void increment(Auto_incrementVO aivo) throws Exception;

	public List<Pos_boardVO> PaymentList(String sale_date) throws Exception;
	
	public List<Pos_boardVO> DetailPaymentList(int list_no) throws Exception;


}
