<%@page import="com.work.web.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id =(String)session.getAttribute("signedUser");
String password = request.getParameter("password");

boolean result = MemberDAO.deleteUserInfo(id, password);

if(result==true){
	session.invalidate();

	System.out.println(id + "'s userinfo delete.");
	
	out.println("<script>");
	out.println("alert('Withdrawl Successfully!')");
	out.println("alert('Thank you for using website.')");
	out.println("location.href='../index.jsp'");
	out.println("</script>");
} else {
	out.println("<script>");
	out.println("alert('Please check your password')");
	out.println("location.href='withDrawl.jsp'");
	out.println("</script>");	
}
%>
</body>
</html>