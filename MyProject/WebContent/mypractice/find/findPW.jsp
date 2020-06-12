<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.work.web.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String name = request.getParameter("nameInPw");

String password = MemberDAO.findPW(id, name);

if(password!=null){
	out.println("<script>");
	out.println("alert('Your Password : " + password + "')");
	out.println("location.href='../index.jsp'");
	out.println("</script>");
} else {
	out.println("<script>");
	out.println("alert('Can not find Info')");
	out.println("location.href='../index.jsp'");
	out.println("</script>");	
}

%>

</body>
</html>