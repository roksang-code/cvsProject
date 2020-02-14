package com.cvs.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cvs.model.LoginVO;
import com.cvs.model.Member_infoVO;
import com.cvs.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
		@Autowired
	private LoginService lservice;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	
	
	
	@RequestMapping(value = "/LoginpageGet", method = RequestMethod.GET)//로그인 화면
	public void LoginpageGet() throws Exception {

		logger.info("login get...");

	}
	@RequestMapping(value = "/LoginpagePost", method = RequestMethod.POST)//로그인 화면
	public void LoginpagePost(LoginVO lvo, Model model) throws Exception {

		
		logger.info("LoginpagePost");
		logger.info("aaaaaaa="+lvo);		

		Member_infoVO mivo = lservice.Loginpage(lvo);
		logger.info(" "+mivo);

		if(mivo == null) {return;}
		
		model.addAttribute("Member_infoVO", mivo);

	}
	
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)//로그인 화면
	public void mainPageGet() throws Exception {

		logger.info("mainPage...");

	}

	@RequestMapping(value = "/Logout", method = RequestMethod.GET)//로그아웃
	public String LogoutGet(HttpSession session) throws Exception {
		
		logger.info("Logout get...");

		
		session.removeAttribute("login");
		session.invalidate();
		
		return "login/LoginpageGet";
	}
	
	
	@RequestMapping(value = "/Memberjoin", method = RequestMethod.GET)//회원가입 화면
	public void MemberjoinGet() throws Exception {

		logger.info("mj get...");

	}
	@RequestMapping(value = "/Memberjoin", method = RequestMethod.POST)//회원가입 화면
	public String MemberjoinPost(Member_infoVO mivo) throws Exception {

		logger.info("mj post...");
		logger.info("mivo = " + mivo);

		lservice.Memberjoin(mivo);
		
		return "login/LoginpageGet";
	}
	
	

	
}