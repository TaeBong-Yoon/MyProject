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
<!--
추가해야할 기능
1. 비밀번호 한번 더 입력 후 수정가능
2. id, 이름은 수정 불가.
3. 비밀번호 수정시 재입력 추가
 -->
 
 <%
String id =(String)session.getAttribute("id");
String name;
int point;
int age;

Connection conn = DBUtil.getMySQLConnection();
String sql = "SELECT * FROM member WHERE id = ?;";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,id);
ResultSet rs = pstmt.executeQuery();
rs.next();
name = rs.getString("name");
age = rs.getInt("age");
point = rs.getInt("point");

DBUtil.close(rs);
DBUtil.close(pstmt);
DBUtil.close(conn);

%>
<form action="modify_OK.jsp" method="post">
<h3>Modify user information</h3>
<table>
<tr>
<td align="center">ID</td>
<td align="center"><%=id %></td>
</tr>
<tr>
<td align="center">Password</td>
<td align="center"><input type="password" placeholder="Password" id="pw" onchange="passCheck()" name="password"></td>
</tr>
<tr>
<td align="center">P/W Check</td>
<td align="center"><input type="password" placeholder="Password Check" id="pwCheck" onchange="passCheck()"></td>
<td width="200"><span id="sametext"></span></td>
</tr>
<tr>
<td align="center">Name</td>
<td align="center"><%=name %></td>
</tr>
<tr>
<td align="center">Age</td>
<td align="center"><input type="text" placeholder="User Age" name="age"></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="Complete"></td>
</tr>

</table>
</form>
	<script>
		function passCheck(obj){
			var pw = document.getElementById('pw').value;
			var pwcheck = document.getElementById('pwCheck').value;
			if(pw==pwcheck){
				document.getElementById('sametext').innerHTML = "P/W same.";
			} else {
				document.getElementById('sametext').innerHTML = "P/W Not same.";
			}
		}

	</script>

</body>
</html>