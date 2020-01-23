package com.cvs.mapper;

import com.cvs.model.LoginVO;
import com.cvs.model.Member_infoVO;

public interface LoginMapper {

	public Member_infoVO Loginpage(LoginVO lvo)throws Exception;

	public void Memberjoin(Member_infoVO mivo)throws Exception ;
	
	
}
