package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.blood.BloodAdvisor;

//이 클래스는 MVC에서 컨트롤러로써 역할을 수행한다. 
//컨트롤러란? Model과 View를 분리시키기 위한 중간자 역할 
/*
 * JavaEE 분야에서 MVC개발 방법이론을 적용하려면 다음과 같다 
 * 1) Model - 재사용 가능한 중립적 코드이어야 하므로 .순수 java이용 
 *                 Plain Old Java Object (POJO)
 * 2) View  - 웹서버에서 실행될 수 있으며, 디자인도 표현가능한 객체 
 *                 JSP가  그 역할을 수행한다..
 * 3) Controller - 웹서버에서 실행될수 있으며, 클라이언트의 요청과 
 *                      응답을 처리할 수 있는 객체  Servlet이 그 역할을 수행
 *  모델2 - javaEE로 구현한 MVC 패턴
 *  모델1 - 우리가 지금까지 써왔던 방식(jsp가 디자인 및 컨트롤러까지 모두 감당)                      
 * */
public class BloodController extends HttpServlet{
	BloodAdvisor advisor=new BloodAdvisor();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String blood = request.getParameter("blood");
		
		//현재 코드에서 , 중립적인 자바 코드는 굳이  jsp안에
		//둘 필요없다, 이유? 미래의 재사용성을 위해서 별도로 
		//분리시켜 놓아야 한다...
		String msg=advisor.getAdvice(blood);

		//출력은 가능하지만 , 출력하면 안된다1!!
		//그 이유?? M,V, C 로 개발하기 위해 철저히 분리시키고 잇는 상황에
		//out.print()  하는 순간 뷰역할을 수행하게 됨..
		//결과를 보여주는 View 역할을 하는 페이지가 result.jsp
		//이므로,  result.jsp 가 결과를 참조할수 있도록 어딘가에 
		//저장해놓자... session에 담아보자
		HttpSession session=request.getSession();
		session.setAttribute("msg", msg);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		out.print("<script>");
		out.print("location.href='/blood/result.jsp';");
		out.print("</script>");
		
	}
	
}







