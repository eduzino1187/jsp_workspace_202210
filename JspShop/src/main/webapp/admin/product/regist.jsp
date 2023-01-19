<%@page import="com.jspshop.exception.PsizeException"%>
<%@page import="com.jspshop.exception.ColorException"%>
<%@page import="com.jspshop.exception.ProductException"%>
<%@page import="com.jspshop.repository.PsizeDAO"%>
<%@page import="com.jspshop.repository.ColorDAO"%>
<%@page import="com.jspshop.repository.ProductDAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.jspshop.mybatis.MybatisConfig"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%!
	MybatisConfig mybatisConfig=MybatisConfig.getInstance();

	ProductDAO productDAO=new ProductDAO();
	ColorDAO colorDAO = new ColorDAO();
	PsizeDAO psizeDAO = new PsizeDAO();
%>
<%
	//상품 등록이란, 여러 테이블을 대상으로  DML이 수행되어야 하므로
	//대표적인 트랜잭션 상황의 업무이다. 따라서  DML을 수행하는 객체인
	//DAO들은 각자 커넥션을 취득하여 업무를 하는것이 아니라, 같은 커넥션
	//내에서 DML수행할 수 있도록 , SqlSession 을 공유하자!!
	//따라서  SqlSession에 대한 취득은 여기(서블릿)에서 처리하겟다!!
	SqlSession sqlSession=mybatisConfig.getSqlSession();
	
	//setter 를 이용한 객체 주입 
	productDAO.setSqlSession(sqlSession);
	colorDAO.setSqlSession(sqlSession);
	psizeDAO.setSqlSession(sqlSession);

	//DAO 에게 일시키기
	try{
		productDAO.insert(null);
		colorDAO.insert(null);
		psizeDAO.insert(null);
		sqlSession.commit();
	}catch(ProductException e){
		sqlSession.rollback();
	}catch(ColorException e){
		sqlSession.rollback();
	}catch(PsizeException e){
		sqlSession.rollback();
	}finally{
		mybatisConfig.release(sqlSession);	
	}
%>


