package com.jspshop.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jspshop.domain.Member;
import com.jspshop.exception.MemberException;

public class MemberDAO {
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List selectAll() {
		return sqlSession.selectList("Member.selectAll");
	}
	
	public Member select(Member member) {
		return sqlSession.selectOne("Member.select", member);
	}
	
	public void insert(Member member) throws MemberException{
		int result = sqlSession.insert("Member.insert", member);
		if(result<1) {
			throw new MemberException("등록실패");
		}
	}
	public void update(Member member) throws MemberException {
		int result = sqlSession.update("Member.update", member);
		if(result<1) {
			throw new MemberException("수정실패");
		}

	}
	public void delete(Member member) throws MemberException{
		int result = sqlSession.delete("Member.delete", member);
		if(result<1) {
			throw new MemberException("삭제실패");
		}

	}
	
	
	
	
}
