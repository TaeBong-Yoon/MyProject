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
String name = MemberDAO.nameViewForModify(id);
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
<td align="center">Phone</td>
<td align="center"><input type="text" placeholder="Phone" name="phone"></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="Complete"></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" value="WithDrawl" onclick="location.href='withDrawl.jsp'"/></td>
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