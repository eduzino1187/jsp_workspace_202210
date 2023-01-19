package com.jspshop.repository;

import org.apache.ibatis.session.SqlSession;

import com.jspshop.domain.Color;
import com.jspshop.exception.ColorException;
import com.jspshop.mybatis.MybatisConfig;

public class ColorDAO {

	
	private SqlSession sqlSession;
	
	public ColorDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(Color color) throws ColorException{
		int result=0;
		SqlSession sqlSession=config.getSqlSession();
		result=sqlSession.insert("Color.insert", color);
		config.release(sqlSession);
		if(result<1) {
			throw new ColorException("색상 등록 실패");
		}
		return result;
	}
}




