/*
�ڹٴ� Ŭ���� ����� ����̹Ƿ�, javaEE�� �����Ҷ��� 
�и� jsp �ƴϴ���, Ŭ������ �̿��Ͽ� ��û, ������ ó���� �� �ִ�
�̷��� ���� ���������� ����Ǹ�, ������ ��û�� ������ ó���Ҽ�
�ִ� Ŭ������ ������ Servlet �̶� �Ѵ�
*/
package myservlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;

public class TestServlet extends HttpServlet{
	//�� Ŭ������ ������� �� http����� ��û�� ������ ó���ϱ�
	//���� Ŭ�����̹Ƿ�, Ŭ���̾�Ʈ�� get������� ��û�� �ϸ�
	//doGet() ���� ó���ϰ�, post������� ��û�� �ϸ� 
	//doPost() �� ó���ϸ� �ȴ�. 
	//�ۼ���, ������ Ŭ������ ������������ �� ��Ī�� ���� �����Ҽ�
	//����...�ذ�å? ������ ���ؼ� sun���� ���� ��Ģ�� ������..
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//Ŭ���̾�Ʈ�� �̸��� ���������� ��������!!
		PrintWriter out=response.getWriter(); //���ڱ�� ��½�Ʈ�� 
		out.print("zino");
	}

}


