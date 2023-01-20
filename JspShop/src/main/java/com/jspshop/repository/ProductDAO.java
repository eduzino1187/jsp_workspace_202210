package com.jspshop.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jspshop.domain.Product;
import com.jspshop.exception.ProductException;

public class ProductDAO {
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//throws 는 예외를 처리한게 아니라, 회피하는 것이다. 즉 전가시키는 것이다
	public void insert(Product product) throws ProductException{
		int result=0;
		System.out.println("Mybatis 만나기 전의 product_idx="+product.getProduct_idx());
		result=sqlSession.insert("Product.insert", product);
		System.out.println("Mybatis 만난 후 product_idx="+product.getProduct_idx());
		if(result<1) {
			//에러를 일부러 일으키자!!
			throw new ProductException("상품이 등록되지 않았어요");
		}
	}
	
	public List selectAll() {
		return sqlSession.selectList("Product.selectAll");
	}
}




