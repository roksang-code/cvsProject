package com.cvs.service;

import java.util.List;

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
		

		return lm.Loginpage(lvo);
	}

	@Override
	public void Memberjoin(Member_infoVO mivo)throws Exception  {

	 	lm.Memberjoin(mivo);
		
	}

	@Override
	public List<Member_infoVO> searchID(String email) throws Exception {

		return lm.searchID(email);

	}

	@Override
	public List<Member_infoVO> searchPW(String id, String email) throws Exception {

		return lm.searchPW(id, email);

	}
	
}
