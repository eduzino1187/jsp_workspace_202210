package news.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import news.domain.News;
import news.mybatis.MybatisConfig;

public class NewsDAO {
	//SqlSessionFactory가 이 객체에 존재하므로..
	MybatisConfig config=MybatisConfig.getInstance();
	
	public int insert(News news) {
		int result=0;
		SqlSession sqlSession=config.getSqlSession();
		result = sqlSession.insert("News.insert", news);
		sqlSession.commit();
		config.release(sqlSession);
		return result;
	}
	
	public List selectAll() {
		return null;
	}
	
	public News select(int news_idx) {
		return null;
	}
	
	public int update(News news) {
		return 0;
	}
	
	public int delete(int news_idx) {
		
		return 0;
	}
}










