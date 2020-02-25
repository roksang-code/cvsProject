package com.cvs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cvs.model.Member_infoVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception{
		System.out.println("new login");
		
		HttpSession session = request.getSession();
		
		Member_infoVO mivo = (Member_infoVO)modelAndView.getModel().get("Member_infoVO");

		if(mivo != null ) {						//사용자가 회원가입을 했으면,
			if(mivo.getId().equals("admin")) {
				logger.info("new admin success");		
				session.setAttribute(LOGIN, mivo);	//로그인처리 (session 회원정보 저장)
				response.sendRedirect("../admin/adminMain");	//로그인 성공한 후 메인페이지로 이동
				
			}else {
				logger.info("new login success");		
				System.out.println("new login success");
				session.setAttribute(LOGIN, mivo);	//로그인처리 (session 회원정보 저장)
				response.sendRedirect("../login/mainPage");	//로그인 성공한 후 메인페이지로 이동
			}
		}else {
			response.sendRedirect("../login/LoginpageGet");	//로그인 실패 로그인 페이지로 이동

		}
	}//로그인 하기 전
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception{
		

		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN)!=null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
	
	
	
}
