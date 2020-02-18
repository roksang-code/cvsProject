package com.cvs.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cvs.model.Criteria;
import com.cvs.model.Md_infoVO;
import com.cvs.model.Order_boardVO;
import com.cvs.model.PageMaker;
import com.cvs.service.BoardService;
import com.cvs.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService oservice;
	@Autowired
	private BoardService bservice;

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);


	
	@RequestMapping(value = "/OrderMain", method = RequestMethod.GET)//order main화면
	public void mdOrderGet() throws Exception {

		logger.info("mdOrder get...");

	}

	@ResponseBody
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)//전체 매출 리스트 화면
	public ResponseEntity<List<Md_infoVO>> orderListGet(@RequestParam String type, String detail_type,String md_name, Md_infoVO mvo) throws Exception {
		
		
		ResponseEntity<List<Md_infoVO>> entity = null;

		logger.info("orderList get...");
		List<Md_infoVO> orderList = oservice.orderList(type, detail_type, md_name);

		logger.info("type = "+type);
		logger.info("detail_type = "+detail_type);
		logger.info("md_name = "+md_name);

		entity = new ResponseEntity<List<Md_infoVO>>(orderList, HttpStatus.OK);
		logger.info("entity = "+entity.toString());

		return entity; 

	}
	 @ResponseBody
	 @RequestMapping(value = "/typePage", method = RequestMethod.GET) 
	 public ResponseEntity<List<Md_infoVO>> typePageGet(@RequestParam String type, Md_infoVO mvo, Model model) throws Exception{
	  
	  
		 logger.info("typePage get...");

		ResponseEntity<List<Md_infoVO>> entity = null;

	  
		 List<Md_infoVO> typePage = oservice.typePage(type);

		 entity = new ResponseEntity<List<Md_infoVO>>(typePage, HttpStatus.OK);

		 logger.info("model = "+model);

		 return entity;
	 
	  
	}
	@ResponseBody
	@RequestMapping(value = "/MDorder", method = RequestMethod.POST)//상품발주
	public void MDorder(@RequestBody Order_boardVO obvo) throws Exception {

			logger.info("MDorder post...");

			oservice.MDorder(obvo);
			logger.info("mivo = " + obvo);
			
	}
	@RequestMapping(value = "/notice", method = RequestMethod.GET)//공지사항 화면
	public void noticeGet(Criteria cri, Model model) throws Exception {
		 
		
		 PageMaker pageMaker = new PageMaker(cri, bservice.listCountCriteria(cri)); 

 		 model.addAttribute("list", bservice.listCriteria(cri)); 
		  
		 model.addAttribute("pageMaker", pageMaker);
		  
		
		logger.info("mdOrder get...");

	}
	
	@RequestMapping(value = "/notice_detail", method = RequestMethod.GET) //상세 화면
	public void notice_detailGet(@RequestParam("no") int no, Criteria cri, Model model) throws Exception {
		logger.info("notice_detail get...");
		bservice.boardCnt(no);
		
		System.out.println(cri.getKeyword());
		System.out.println(cri.getPageNum());
		
		model.addAttribute(bservice.boardDetail(no));
		model.addAttribute("cri", cri);
		
		
	}

	
	
}