<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.work.web.DBUtil"%>
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
Connection conn = DBUtil.getMySQLConnection();
String id =(String)session.getAttribute("id");
String password = (request.getParameter("password"));
int age = Integer.parseInt(request.getParameter("age"));

String sql = "UPDATE `mydb`.`member` SET `password` = ?, `age` = ? WHERE `id` = ?";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,password);
pstmt.setInt(2,age);
pstmt.setString(3,id);
pstmt.executeUpdate();

DBUtil.close(pstmt);
DBUtil.close(conn);

System.out.println(id + "'s password and age change to " +password+","+age);

out.println("<script>");
out.println("alert('Modify Successfully!')");
out.println("location.href='main_OK.jsp'");
out.println("</script>");

%>
</body>
</html>