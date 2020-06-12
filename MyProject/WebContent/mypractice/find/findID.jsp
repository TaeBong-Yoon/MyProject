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
String name = request.getParameter("nameInId");
String phone = request.getParameter("phone");

String id = MemberDAO.findID(name, phone);

if(id!=null){
	out.println("<script>");
	out.println("alert('Your ID : " + id + "')");
	out.println("location.href='../index.jsp'");
	out.println("</script>");
} else {
	out.println("<script>");
	out.println("alert('Can not find ID')");
	out.println("location.href='../index.jsp'");
	out.println("</script>");	
}

%>

</body>
</html>