package com.cvs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	
	
	
	
	
}