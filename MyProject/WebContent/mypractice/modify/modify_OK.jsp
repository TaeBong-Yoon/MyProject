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
request.setCharacterEncoding("UTF-8");
String id =(String)session.getAttribute("signedUser");
String password = request.getParameter("password");
int age = Integer.parseInt(request.getParameter("age"));
String phone = request.getParameter("phone");

boolean result = MemberDAO.modifyUserInfo(id, password, age, phone);

if(result == true){
	System.out.println(id + "'s password and age change to " +password+","+age);
	out.println("<script>");
	out.println("alert('Modify Successfully!')");
	out.println("location.href='../sign/main.jsp'");
	out.println("</script>");
} else {
	System.out.println("Can not modify. Check the information");
	out.println("<script>");
	out.println("alert('Error! Try again')");
	out.println("location.href='modifyForm.jsp'");
	out.println("</script>");	
}
%>
</body>
</html>