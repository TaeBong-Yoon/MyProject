<%@page import="com.work.web.loginCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
</head>
<body>

ID : <input type="text" name="id">
<input type="button" value="ID Check" name="confirm" onClick="idCheckForm.jsp">

<%

String id = request.getParameter("id");

if(loginCheck.check(id)){
	out.println("<script>");
	out.println("alert('There is same ID already exists. Choose another ID')");
	out.println("location.href='joinPage.jsp'");
	out.println("</script>");
}

%>
</body>
</html>