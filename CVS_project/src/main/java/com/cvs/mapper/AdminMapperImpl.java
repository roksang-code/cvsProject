package com.cvs.mapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMapperImpl implements AdminMapper{

	@Autowired
	private SqlSession session;
	private static final String namespace = "com.cvs.mapper.AdminMapper";
	
	


}
