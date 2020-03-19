package com.cvs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.cvs.model.LoginVO;
import com.cvs.model.Member_infoVO;
import com.cvs.model.Tel_membership_infoVO;
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
	
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)//메인 화면
	public void mainPageGet() throws Exception {

		logger.info("mainPage...");

	}

	@RequestMapping(value = "/Logout", method = RequestMethod.GET)//로그아웃
	public String LogoutGet(HttpSession session) throws Exception {
		
		logger.info("Logout get...");

		
		session.removeAttribute("login");
		session.invalidate();
		
		return "login/mainPage";
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
	@ResponseBody
	@RequestMapping(value = "/checkID", method = RequestMethod.GET)//ID 중복확인
	public ResponseEntity<List<Member_infoVO>> checkID(@RequestParam String id, Member_infoVO mivo) throws Exception{
		

		ResponseEntity<List<Member_infoVO>> entity = null;
		logger.info("checkID GET...");
		List<Member_infoVO> checkID = lservice.checkID(id);

		
		
		entity = new ResponseEntity<List<Member_infoVO>>(checkID, HttpStatus.OK);

		logger.info("id = "+id);
		
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = "/checkEmail", method = RequestMethod.GET)//email 중복확인
	public ResponseEntity<List<Member_infoVO>> checkEmail(@RequestParam String email, Member_infoVO mivo) throws Exception{
		

		ResponseEntity<List<Member_infoVO>> entity = null;
		logger.info("checkID GET...");
		List<Member_infoVO> checkEmail = lservice.checkEmail(email);

		
		
		entity = new ResponseEntity<List<Member_infoVO>>(checkEmail, HttpStatus.OK);

		logger.info("email = "+email);
		
		return entity;
	}
	@ResponseBody
	@RequestMapping(value = "/searchID", method = RequestMethod.GET)//ID 검색
	public ResponseEntity<List<Member_infoVO>> searchID(@RequestParam String email, Member_infoVO mivo) throws Exception{
		

		ResponseEntity<List<Member_infoVO>> entity = null;
		logger.info("searchID GET...");
		List<Member_infoVO> searchID = lservice.searchID(email);

		
		
		entity = new ResponseEntity<List<Member_infoVO>>(searchID, HttpStatus.OK);

		logger.info("email = "+email);
		
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/searchPW", method = RequestMethod.GET)//PW 검색
	public ResponseEntity<List<Member_infoVO>> searchPW(@RequestParam String id, String email, Member_infoVO mivo) throws Exception{
		

		ResponseEntity<List<Member_infoVO>> entity = null;
		logger.info("searchPW GET...");
		List<Member_infoVO> searchPW = lservice.searchPW(id, email);

		
		
		entity = new ResponseEntity<List<Member_infoVO>>(searchPW, HttpStatus.OK);

		logger.info("ID = "+id);
		logger.info("email = "+email);
		logger.info("mivo = "+mivo);
		return entity;
	}	
}