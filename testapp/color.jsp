<%@ page contentType="text/html;charset=utf-8"%>
<%
    //클라이언트가 전송한 변수값을 이용하여
    //문서배경 바꾸기 
    String bg=request.getParameter("bg");
    out.print("넘어온 bg "+bg);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        function requestBg(){
            //폼을 이용하여 서버에 전송하기
            let form1=document.getElementById("form1");
            let t=document.getElementById("t");

            location.href="/color.jsp?bg="+t.value;
            //form1.method="get";
            ///form1.submit();
        }
    </script>
</head>
<body bgcolor="<%=bg%>">
    <form id="form1">
        <input type="text" id="t">
    </form>
    <button type="button" onClick="requestBg()">색상요청</button>
</body>
</html>