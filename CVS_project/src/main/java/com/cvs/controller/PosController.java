package com.cvs.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cvs.model.Auto_incrementVO;
import com.cvs.model.Buttonpage;
import com.cvs.model.Functionkey_infoVO;
import com.cvs.model.Md_infoVO;
import com.cvs.model.Pos_boardVO;
import com.cvs.model.Tel_membership_infoVO;
import com.cvs.service.PosService;

@Controller
@RequestMapping("/pos")
public class PosController {
	
	@Autowired
	private PosService pservice;


	private static final Logger logger = LoggerFactory.getLogger(PosController.class);

	
	
	
	
	@RequestMapping(value = "/posPayment", method = RequestMethod.GET)//pos화면
	public void posGet(Functionkey_infoVO fivo,Buttonpage bp, Model model) throws Exception {

		logger.info("pos get...");
				model.addAttribute("functionkeyList", pservice.functionButton(bp));  

	}

	
	@RequestMapping(value = "/posPaymentList", method = RequestMethod.GET)//전체 매출 리스트 화면
	public void posPaymentListGet(@RequestParam String sale_date, int member_no, Pos_boardVO pvo, Model model) throws Exception {
		
		logger.info("posPaymentList get...");
		logger.info("sale_date = "+sale_date);

		model.addAttribute("PaymentList", pservice.PaymentList(sale_date, member_no)); 
		model.addAttribute("selectdate", pservice.PaymentList(sale_date, member_no)); 
		
		
	}@RequestMapping(value = "/posPaymentList", method = RequestMethod.POST)//전체 매출 리스트 화면
	public void posPaymentListPost(@RequestParam String sale_date, int member_no, Pos_boardVO pvo, Model model) throws Exception {
		
		logger.info("posPaymentList Post...");
		logger.info("sale_date = "+sale_date);
		
		model.addAttribute("PaymentList", pservice.PaymentList(sale_date, member_no)); 
		model.addAttribute("selectdate", pservice.PaymentList(sale_date, member_no)); 
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectPaymentList", method = RequestMethod.GET)//날짜 선택 매출 리스트
	public ResponseEntity<List<Pos_boardVO>> selectPaymentListGet(@RequestParam String sale_date, int member_no) throws Exception {
		
		ResponseEntity<List<Pos_boardVO>> entity = null;
		logger.info("DetailPaymentList GET...");
		List<Pos_boardVO> selectPaymentListGet = pservice.PaymentList(sale_date, member_no);

		
		
		entity = new ResponseEntity<List<Pos_boardVO>>(selectPaymentListGet, HttpStatus.OK);

		logger.info("sale_date = "+sale_date);
		logger.info("sale_date entity = "+entity.toString());
		
		return entity;
	}
	


	@ResponseBody
	@RequestMapping(value = "/DetailPaymentList", method = RequestMethod.GET)//세부 매출 리스트 화면
	public ResponseEntity<List<Pos_boardVO>> DetailPaymentListGET(@RequestParam int list_no, int member_no) throws Exception {
		
		ResponseEntity<List<Pos_boardVO>> entity = null;
		logger.info("DetailPaymentList GET...");
		List<Pos_boardVO> DetailPaymentListGET = pservice.DetailPaymentList(list_no, member_no);

		
		
		entity = new ResponseEntity<List<Pos_boardVO>>(DetailPaymentListGET, HttpStatus.OK);

		logger.info("list_no = "+list_no);
		logger.info("entity = "+entity.toString());
		
		return entity;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/posList", method = RequestMethod.GET)//상품리스트
	public Md_infoVO posList(@RequestParam int barcode_no,Md_infoVO mdvo) throws Exception{
		
		mdvo = pservice.inputMdlist(barcode_no);
		logger.info("mdvo="+mdvo);
		logger.info("barcode_no = "+barcode_no);
		
		return mdvo;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/Payment", method = RequestMethod.POST)//결제
	public void Payment(@RequestBody Pos_boardVO pvo) throws Exception {

		pservice.Payment(pvo);
		logger.info("Payment post...");
		logger.info("getBarcode_no"+pvo.getBarcode_no());
		logger.info("getMd_ea"+	pvo.getMd_ea());

		
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/Auto_increment", method = RequestMethod.POST)//ai_no 자동증가
	public String Auto_increment(@RequestBody Auto_incrementVO aivo) throws Exception {
	
		if(aivo.getEmp_no()!=1) {
			aivo.setEmp_no(0);		
		}else if(aivo.getList_no()!=1) {
			aivo.setList_no(0);		
		}else if(aivo.getMember_no()!=1) {
			aivo.setMember_no(0);		
		}else if(aivo.getStore_no()!=1) {
			aivo.setStore_no(0);		
		}else if(aivo.getTrade_no()!=1) {
			aivo.setTrade_no(0);		
		}
		
		
		pservice.increment(aivo);
		logger.info("increment post...");
		logger.info("getList_no = "+aivo.getList_no());
		logger.info("aivo = "+aivo);

		return "pos/posPayment";

	}

	
	@ResponseBody
	@RequestMapping(value = "/refund/{list_no}", method = RequestMethod.DELETE)//환불
	public void refund(@PathVariable("list_no") int list_no, Pos_boardVO pvo) throws Exception{
		
		logger.info("refund ....");

		pservice.refund(list_no);
		logger.info("pvo="+pvo);
		logger.info("list_no = "+list_no);
	
	}
	

	@ResponseBody
	@RequestMapping(value = "/searchMD", method = RequestMethod.GET)//단축키 상품검색
	public ResponseEntity<List<Md_infoVO>>  searchMD(@RequestParam String md_name, Md_infoVO mdvo) throws Exception{
		

		ResponseEntity<List<Md_infoVO>> entity = null;
		logger.info("searchMD GET...");
		List<Md_infoVO> searchMD = pservice.searchMD(md_name);

		
		
		entity = new ResponseEntity<List<Md_infoVO>>(searchMD, HttpStatus.OK);

		logger.info("md_name = "+md_name);
		logger.info("md_name entity = "+entity.toString());
		
		return entity;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/SelectsearchMD", method = RequestMethod.POST)//단축키 상품 등록
	public void SelectsearchMD(@RequestBody Functionkey_infoVO fivo) throws Exception {

		pservice.SelectsearchMD(fivo);
		logger.info("SelectsearchMD post...");
		logger.info("fivo"+fivo);
		
		
		
	}
	@ResponseBody
	@RequestMapping(value = "/functionButton", method = RequestMethod.GET)//단축키 출력
	public List<Functionkey_infoVO> functionButton(Functionkey_infoVO fivo,Buttonpage bp, Model model) throws Exception {

		logger.info("str = "+pservice.functionButton(bp));

		return pservice.functionButton(bp);
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchTEL", method = RequestMethod.GET)//통신사 할인 검색
	public ResponseEntity<List<Tel_membership_infoVO>> searchTEL(@RequestParam String phone_no, String tel_company, Tel_membership_infoVO tmvo) throws Exception{
		

		ResponseEntity<List<Tel_membership_infoVO>> entity = null;
		logger.info("searchTEL GET...");
		List<Tel_membership_infoVO> searchTEL = pservice.searchTEL(phone_no, tel_company);

		
		
		entity = new ResponseEntity<List<Tel_membership_infoVO>>(searchTEL, HttpStatus.OK);

		logger.info("phone_no = "+phone_no);
		logger.info("tel_company = "+tel_company);
		logger.info("phone_no entity = "+entity.toString());
		
		return entity;
	}
	
	
	
	
}