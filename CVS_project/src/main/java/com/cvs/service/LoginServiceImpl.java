package com.cvs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cvs.mapper.LoginMapper;
import com.cvs.model.LoginVO;
import com.cvs.model.Member_infoVO;


@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper lm;
	
	@Override
	public Member_infoVO Loginpage(LoginVO lvo) throws Exception {
		
		System.out.println("ser = "+lvo);

		return lm.Loginpage(lvo);
	}

	@Override
	public void Memberjoin(Member_infoVO mivo)throws Exception  {
		System.out.println("service");
	 	lm.Memberjoin(mivo);
		
	}
	
}
