<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="withDrawl_OK.jsp" method="post" onSubmit="return passCheck()">

<h2>WithDrawl Page</h2>

<table>
  <tr>
    <th colspan="2">Input your Password</th>
  </tr>
    <tr>
    <td colspan="2"><input type="password" name="password" id="password"></td>
  </tr>
  <tr>
    <td><input type="submit" value="Done"></td>
    <td><input type="button" value="Go to Main Page" onclick="location.href='../sign/main.jsp'"></td>
  </tr>
</table>
</form>
	<script>
		function passCheck(){
			if(password.value == ""){
				alert("You have to insert Password!")
				return false;
			}
		}
	</script>
</body>
</html>