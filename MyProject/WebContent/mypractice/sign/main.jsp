<%@page import="java.sql.ResultSet"%>
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
<h1>HELLO!!</h1>
<%
if(session.getAttribute("signedUser") == null){
	System.out.println("access deny.");
	response.sendRedirect("../index.jsp");
} else {

String id =(String)session.getAttribute("signedUser");
String name;
int point;
int age;
String phone;

Connection conn = DBUtil.getMySQLConnection();
String sql = "SELECT * FROM member WHERE id = ?";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,id);
ResultSet rs = pstmt.executeQuery();
rs.next();
name = rs.getString("name");
age = rs.getInt("age");
point = rs.getInt("point");
phone = rs.getString("phone");

DBUtil.close(rs);
DBUtil.close(pstmt);
DBUtil.close(conn);

%>
<h3>Welcome! ID : <%=id%></h3>
<table width="300">
	<tr><th colspan="2">User Information</th></tr>
	<tr>
		<td align="center">Name</td>
		<td align="center"><%=name%></td>
	</tr>
	<tr>
		<td align="center">Age</td>
		<td align="center"><%=age%></td>
	</tr>
	<tr>
		<td align="center">Point</td>
		<td align="center"><%=point%></td>
	</tr>
	<tr>
		<td align="center">Phone</td>
		<td align="center"><%=phone%></td>
	</tr>
	<tr>
		<td align="center"><input type="button" value="Modify user info" onclick="location.href='../modify/modifyForm.jsp'"/></td>

		<td align="center"><input type="button" value="Sign out" onclick="location.href='signOut.jsp'"/></td>
	</tr>
</table>
<%
}
%>
</body>
</html>