package com.cvs.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cvs.model.Md_infoVO;
import com.cvs.model.Pos_boardVO;
import com.cvs.model.Tel_membership_infoVO;
import com.cvs.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService oservice;


	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);


	
	@RequestMapping(value = "/OrderMain", method = RequestMethod.GET)//order main화면
	public void mdOrderGet() throws Exception {

		logger.info("mdOrder get...");

	}

	@ResponseBody
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)//전체 매출 리스트 화면
	public ResponseEntity<List<Md_infoVO>> orderListGet(@RequestParam String type, String detail_type,String md_name, Md_infoVO mvo) throws Exception {
		if(md_name == null) {
			md_name="";
		}
		ResponseEntity<List<Md_infoVO>> entity = null;

		logger.info("orderList get...");
		List<Md_infoVO> orderList = oservice.orderList(type, detail_type, md_name);

		logger.info("detail_type = "+detail_type);
		logger.info("md_name = "+md_name);

		entity = new ResponseEntity<List<Md_infoVO>>(orderList, HttpStatus.OK);
		logger.info("entity = "+entity.toString());

		return entity; 

	}
	
	
	
	
	
	
}