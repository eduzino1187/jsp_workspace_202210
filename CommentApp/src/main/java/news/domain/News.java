package news.domain;

import java.util.List;

import lombok.Data;

@Data
public class News {
	private int news_idx;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private int hit;
	//하나의 뉴스 기사는 여러명의 자식글을 보유할 수 있다..
	//mybatis의 컬렉션으로 처리 가능 
	private List<Comments> commentsList;
}










