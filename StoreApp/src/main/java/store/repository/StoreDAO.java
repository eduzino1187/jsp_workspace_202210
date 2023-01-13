package store.repository;

import org.apache.ibatis.session.SqlSession;

import store.domain.Store;
import store.mybatis.MybatisConfig;

public class StoreDAO {
	MybatisConfig config=MybatisConfig.getInstance();
	
	//등록하기
	public int insert(Store store) {
		int result=0;
		SqlSession sqlSession = config.getSqlSession();
		result=sqlSession.insert("Store.insert", store);
		sqlSession.commit();
		config.release(sqlSession);
		return result;
	}
	
	//전체 목록가져오기 
	
}
