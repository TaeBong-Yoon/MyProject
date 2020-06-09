<%@page import="com.work.web.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.work.web.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 회원가입 - MemberDAO로 옮겨보도록 노력! -->
<% 
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
int age =Integer.parseInt(request.getParameter("age"));
String ip = request.getParameter("ip");
String phone = request.getParameter("phone");

%>

<%

Connection conn = DBUtil.getMySQLConnection();//db

String sql = "INSERT INTO member(id,password,name,age,point,ip,phone) VALUES(?,?,?,?,?,?,?)";
PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, id);
pstmt.setString(2, password);
pstmt.setString(3, name);
pstmt.setInt(4, age);
pstmt.setInt(5, 0);
pstmt.setString(6, ip);
pstmt.setString(7, phone);
pstmt.executeUpdate();

DBUtil.close(pstmt);
DBUtil.close(conn);

out.println("<script>");
out.println("alert('Sign Up Success!')");
out.println("location.href='../index.jsp'");
out.println("</script>");

%>

</body>
</html>