package com.cvs.mapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cvs.model.LoginVO;
import com.cvs.model.Member_infoVO;

@Repository
public class LoginMapperImpl implements LoginMapper{

	@Autowired
	private SqlSession session;
	private static final String namespace = "com.cvs.mapper.LoginMapper";
	
	@Override
	public Member_infoVO Loginpage(LoginVO lvo) throws Exception {
		
		Member_infoVO mivo = session.selectOne(namespace+".Loginpage",lvo);
		
		System.out.println("mapper = "+mivo);
		
		return mivo;
	}
	
	@Override
	public void Memberjoin(Member_infoVO mivo) throws Exception {
		 System.out.println("mapper");
		 session.insert(namespace + ".Memberjoin", mivo);
		
	}


}
