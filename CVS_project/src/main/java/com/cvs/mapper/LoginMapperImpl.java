package com.cvs.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cvs.model.LoginVO;
import com.cvs.model.Member_infoVO;
import com.cvs.model.Tel_membership_infoVO;

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

	@Override
	public List<Member_infoVO> searchID(String email) throws Exception {
		
		
		List<Member_infoVO> searchID = session.selectList(namespace + ".searchID", email);
	
		return searchID;
	}

	@Override
	public List<Member_infoVO> searchPW(String id, String email) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("email", email);
		
		
		List<Member_infoVO> searchPW = session.selectList(namespace + ".searchPW", paramMap);
	
		return searchPW;
	}

	@Override
	public List<Member_infoVO> checkEmail(String email) throws Exception {
		List<Member_infoVO> checkEmail = session.selectList(namespace + ".checkEmail", email);
		
		return checkEmail;
	}

	@Override
	public List<Member_infoVO> checkID(String id) throws Exception {
		List<Member_infoVO> checkID = session.selectList(namespace + ".checkID", id);
		
		return checkID;
	}


}
