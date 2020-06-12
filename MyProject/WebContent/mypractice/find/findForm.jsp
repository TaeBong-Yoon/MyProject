<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="findFormCheck.js"></script>
</head>
<body>
	<form action="findID.jsp" method="post"
		onsubmit="return idFormCheck(this)">
		<h2>Find ID</h2>
		<table>
			<tr>
				<th>Name :</th>
				<th><input type="text" name="nameInId"></th>
			</tr>
			<tr>
				<th>Phone :</th>
				<th><input type="text" name="phone"></th>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="Find ID"></th>
			</tr>
			<tr>
				<th colspan="2"><input type="button" value="Cancel" onclick="location.href='../index.jsp'"></th>
			</tr>
		</table>


	</form>

	<form action="findPW.jsp" method="post"
		onsubmit="return pwFormCheck(this)">
		<h2>Find PW</h2>
		<table>
			<tr>
				<th>ID :</th>
				<th><input type="text" name="id"></th>
			</tr>
			<tr>
				<th>Name :</th>
				<th><input type="text" name="nameInPw"></th>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="Find PW"></th>
			</tr>
			<tr>
				<th colspan="2"><input type="button" value="Cancel" onclick="location.href='../index.jsp'"></th>
			</tr>
		</table>
	</form>
</body>
</html>