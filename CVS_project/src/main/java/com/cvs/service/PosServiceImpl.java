package com.cvs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cvs.mapper.PosMapper;
import com.cvs.model.Auto_incrementVO;
import com.cvs.model.Buttonpage;
import com.cvs.model.Functionkey_infoVO;
import com.cvs.model.Md_infoVO;
import com.cvs.model.Pos_boardVO;


@Service
public class PosServiceImpl implements PosService{

	@Autowired
	PosMapper pm;
	
	@Override
	public Md_infoVO inputMdlist(int barcode_no) throws Exception {
		Md_infoVO mdlist = pm.inputMdlist(barcode_no);
 
		return mdlist;
		}

	@Override
	public void Payment(Pos_boardVO pvo) throws Exception {
		
		pm.Payment(pvo);

		 		
	}


	@Override
	public void increment(Auto_incrementVO aivo) throws Exception {
		pm.increment(aivo);
		
	}

	@Override
	public List<Pos_boardVO> PaymentList(String sale_date) throws Exception {

		return pm.PaymentList(sale_date);
	}

	
	@Override
	public List<Pos_boardVO> DetailPaymentList(int list_no) throws Exception {
		
		List<Pos_boardVO> DetailPaymentList = pm.DetailPaymentList(list_no);
		
		return DetailPaymentList;
		

	}

	@Override
	public void refund(int list_no) throws Exception {

		 pm.refund(list_no);
	
		
	}

	@Override
	public List<Md_infoVO> searchMD(String md_name) throws Exception {
		List<Md_infoVO> searchMD = pm.searchMD(md_name);

		return searchMD;
	}

	@Override
	public void SelectsearchMD(Functionkey_infoVO fivo) throws Exception {
		
		pm.SelectsearchMD(fivo);
	}

	@Override
	public List<Functionkey_infoVO> functionButton(Buttonpage bp) throws Exception {

		return pm.functionButton(bp);

	}
	
	
	
}