package com.cvs.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cvs.model.Auto_incrementVO;
import com.cvs.model.Buttonpage;
import com.cvs.model.Functionkey_infoVO;
import com.cvs.model.Md_infoVO;
import com.cvs.model.Pos_boardVO;
import com.cvs.model.Tel_membership_infoVO;

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
	public List<Pos_boardVO> PaymentList(String sale_date, int member_no) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("sale_date", sale_date);
		paramMap.put("member_no", member_no);
		
		List<Pos_boardVO> PaymentList = session.selectList(namespace + ".PaymentList", paramMap);

		return PaymentList;
	}

	@Override
	public List<Pos_boardVO> DetailPaymentList(int list_no, int member_no) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list_no", list_no);
		paramMap.put("member_no", member_no);
		
		List<Pos_boardVO> DetailPaymentList = session.selectList(namespace + ".DetailPaymentList",paramMap);

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

	@Override
	public List<Functionkey_infoVO> functionButton(Buttonpage bp) throws Exception {
		
		List<Functionkey_infoVO> functionButton = session.selectList(namespace + ".functionButton", bp);

		return functionButton;
	}

	
	@Override
	public void dummy_table(String now_time) throws Exception {

		session.insert(namespace + ".dummy_table", now_time);
		
		
	}

	@Override
	public List<Tel_membership_infoVO> searchTEL(String phone_no, String tel_company) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("phone_no", phone_no);
		paramMap.put("tel_company", tel_company);
		
		
		List<Tel_membership_infoVO> searchTEL = session.selectList(namespace + ".searchTEL", paramMap);
	
		return searchTEL;
	}

	
}