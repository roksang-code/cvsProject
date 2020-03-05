package com.cvs.service;

import java.util.List;

import com.cvs.model.LoginVO;
import com.cvs.model.Member_infoVO;

public interface LoginService {

	public Member_infoVO Loginpage(LoginVO lvo)throws Exception;

	public void Memberjoin(Member_infoVO mivo)throws Exception ;

	public List<Member_infoVO> searchID(String email)throws Exception ;

	public List<Member_infoVO> searchPW(String id, String email)throws Exception ;

	
}
