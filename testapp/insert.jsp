<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%!
    Connection con;
    PreparedStatement pstmt;
    String url="jdbc:oracle:thin:@localhost:1521:XE";
    String user="javase";
    String pass="1234";

%>
<%
    //파라미터 받아 
    request.setCharacterEncoding("utf-8");

    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String content = request.getParameter("content");
    out.print(title);
    out.print(writer);
    out.print(content);

    //드라이버 로드
    Class.forName("oracle.jdbc.driver.OracleDriver");
    //접속
    con=DriverManager.getConnection(url, user, pass);

    //쿼리 
    String sql="insert into board(board_idx, title, writer, content)";
    sql+=" values(seq_board.nextval, ?,?,?)";
    pstmt=con.prepareStatement(sql);

    pstmt.setString(1, title);
    pstmt.setString(2, writer);
    pstmt.setString(3, content);

    int result=pstmt.executeUpdate();

    if(result >0){

        out.print("<script>");
        out.print("alert('성공');");
        out.print("</script>");
    }

    //닫기 
    pstmt.close();
    con.close();
%>