package news.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.domain.News;
import news.repository.NewsDAO;

public class RegistServlet extends HttpServlet{
	NewsDAO newsDAO;
	
	public RegistServlet() {
		newsDAO =new NewsDAO();
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf-8");
		
		String title=request.getParameter("title");
		String writer=request.getParameter("writer");
		String content=request.getParameter("content");
		
		News news = new News();
		news.setTitle(title);
		news.setWriter(writer);
		news.setContent(content);
		
		int result = newsDAO.insert(news);
		if(result>0) {
			out.print("등록 처리 서블릿 호출 성공");
		}else {
			out.print("등록 처리 서블릿 실패");
		}
	}
}







