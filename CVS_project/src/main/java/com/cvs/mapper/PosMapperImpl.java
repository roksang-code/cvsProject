package com.cvs.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cvs.model.Auto_incrementVO;
import com.cvs.model.Functionkey_infoVO;
import com.cvs.model.Md_infoVO;
import com.cvs.model.Pos_boardVO;

@Repository
public class PosMapperImpl implements PosMapper {

	@Autowired
	private SqlSession session;
	private static String namespace = "com.cvs.mapper.PosMapper";

	@Override
	public Md_infoVO inputMdlist(int barcode_no) throws Exception {

		Md_infoVO mdlist = session.selectOne(namespace + ".inputMdlist", barcode_no);

		return mdlist;
	}

	@Override
	public void Payment(Pos_boardVO pvo) throws Exception {

		session.insert(namespace + ".Payment", pvo);

	}

	@Override
	public void increment(Auto_incrementVO aivo) throws Exception {
		session.insert(namespace + ".increment", aivo);

	}

	@Override
	public List<Pos_boardVO> PaymentList(String sale_date) throws Exception {

		List<Pos_boardVO> PaymentList = session.selectList(namespace + ".PaymentList", sale_date);

		return PaymentList;
	}

	@Override
	public List<Pos_boardVO> DetailPaymentList(int list_no) throws Exception {

		List<Pos_boardVO> DetailPaymentList = session.selectList(namespace + ".DetailPaymentList",list_no);

		return DetailPaymentList;
	}

	@Override
	public void refund(int list_no) throws Exception {
		
		int refund = session.delete(namespace + ".refund", list_no);
		
	}

	@Override
	public List<Md_infoVO> searchMD(String md_name) throws Exception {

		List<Md_infoVO> searchMD = session.selectList(namespace + ".searchMD", md_name);

		return searchMD;
	}

	@Override
	public void SelectsearchMD(Functionkey_infoVO fivo) throws Exception {

		session.update(namespace + ".SelectsearchMD", fivo);
		
	}

	
	
	
}