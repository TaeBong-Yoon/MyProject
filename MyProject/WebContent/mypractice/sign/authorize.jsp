<%@page import="com.work.web.MemberDAO"%>
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
	<%
	//https://m.blog.naver.com/PostView.nhn?blogId=njin0528&logNo=220239735350&proxyReferer=https:%2F%2Fwww.google.com%2F
	//response.sendRedirect(); 사용시 alert가 실행되지 않는 이유!
	request.setCharacterEncoding("UTF-8");
	 
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	if(MemberDAO.checkRequest(id, password)==0){
		session.setAttribute("signedUser", id);
		out.println("<script>");
		out.println("alert('Sign In Successfully!')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	} else if(MemberDAO.checkRequest(id, password)==1){
		out.println("<script>");
		out.println("alert('Try again!')");
		out.println("location.href='../index.jsp'");
		out.println("</script>");
	} else if(MemberDAO.checkRequest(id, password)==2){
		out.println("<script>");
		out.println("alert('Check your ID again')");
		out.println("location.href='../index.jsp'");
		out.println("</script>");
	}
	
	%>

</body>
</html>