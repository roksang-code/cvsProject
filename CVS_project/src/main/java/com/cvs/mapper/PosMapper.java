package com.cvs.mapper;

import java.util.List;

import com.cvs.model.Auto_incrementVO;
import com.cvs.model.Buttonpage;
import com.cvs.model.Functionkey_infoVO;
import com.cvs.model.Md_infoVO;
import com.cvs.model.Pos_boardVO;
import com.cvs.model.Tel_membership_infoVO;

public interface PosMapper {
	
	public Md_infoVO inputMdlist(int barcode_no) throws Exception;
	
	public void Payment(Pos_boardVO pvo) throws Exception;

	public void increment(Auto_incrementVO aivo) throws Exception;

	public List<Pos_boardVO> PaymentList(String sale_date, int member_no) throws Exception;
	
	public List<Pos_boardVO> DetailPaymentList(int list_no, int member_no) throws Exception;

	public void refund(int list_no) throws Exception;

	public List<Md_infoVO> searchMD(String md_name) throws Exception;

	public void SelectsearchMD(Functionkey_infoVO fivo) throws Exception;

	public List<Functionkey_infoVO> functionButton(Buttonpage bp) throws Exception;

	public void dummy_table(String now_time) throws Exception;

	public List<Tel_membership_infoVO> searchTEL(String phone_no, String tel_company)throws Exception;

	public void updateTelPoint(Tel_membership_infoVO tmvo)throws Exception;

}
