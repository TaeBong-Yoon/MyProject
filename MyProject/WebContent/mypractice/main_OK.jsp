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
String id =(String)session.getAttribute("id");
String name;
int point;
int age;

String password;

Connection conn = DBUtil.getMySQLConnection();
String sql = "SELECT * FROM member WHERE id = ?";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,id);
ResultSet rs = pstmt.executeQuery();
rs.next();
name = rs.getString("name");
age = rs.getInt("age");
point = rs.getInt("point");

password=rs.getString("password");

DBUtil.close(rs);
DBUtil.close(pstmt);
DBUtil.close(conn);

System.out.println(id);
System.out.println(password);
System.out.println(age);

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
		<td align="center"><input type="button" value="Modify user info" onclick="location.href='modifyForm.jsp'"/></td>
		<td align="center"><input type="button" value="Sign out" onclick="location.href='main.jsp?logout=yes'"/></td>
	</tr>


</table>

</body>
</html>