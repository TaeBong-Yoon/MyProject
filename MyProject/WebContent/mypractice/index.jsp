<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="sign/formCheck.js"></script>
</head>
<body>
	<h1>WelCome! : )</h1>
	<form action="sign/main.jsp" method="POST" onsubmit="return loginCheck(this)">
		<table>
			<tr>
				<th colspan="2"><h3>Sign In</h3></th>
			</tr>
			<tr>
				<td>ID :</td>
				<td><input type="text" name="id" /></td>
			</tr>

			<tr>
				<td>PW :</td>
				<td><input type="password" name="password" /></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Sign In" /></td>
			</tr>
		</table>
	</form>
	<input type="button" value="Sign Up" onclick="location.href='sign/joinPage.jsp'" />
	<input type="button" value="Find ID" onclick="location.href='find/findID.jsp'" />
	<input type="button" value="Find P/W" onclick="location.href='find/findPW.jsp'" />	
</body>
</html>