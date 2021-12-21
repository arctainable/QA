<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    if(id!=null && !id.equals("")) {
        session.setAttribute("id", id);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 로그인 결과 </title>
</head>
<body>
<p>
<a href="streamClient.jsp">채팅 페이지로 이동</a>
</body>
</html>