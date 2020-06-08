<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="formCheck.js"></script>
</head>
<body>
	<form action="joinOK.jsp" method="post" onsubmit="return joinCheck(this)">
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>"/>
		
		<table width="550" align="center">
			<tr><th colspan="2"><h2>Sign Up</h2></th></tr>
			
			<tr>
				<td width="200" align="center">ID</td>
				<td width="200" align="center"><input type="text" name="id" id="id" readonly></td>
				<td><input type="button" value="ID Check" onclick="idCheck()"></td>
				 
			</tr>
			
			<tr>
				<td width="200" align="center">Password</td>
				<td width="200" align="center"><input type="password" name="password" id="pw" onchange="passCheck()"></td>
			</tr>
			
			<tr>
				<td width="200" align="center">P/W Check</td>
				<td width="200" align="center"><input type="password" name="check" id="pwCheck" onchange="passCheck()"></td>
				<td width="200"><span id="sametext"></span></td>
			</tr>
			
			<tr>
				<td width="200" align="center">Name</td>
				<td width="200" align="center"><input type="text" name="name"></td>
			</tr>
			
			<tr>
				<td width="200" align="center">Age</td>
				<td width="200" align="center"><input type="text" name="age"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Sign Up"></td>
			</tr>
			
		</table>
	
	</form>
	 <script>
		function idCheck() {
			window.open("idCheckForm.jsp","ID Check","width=600, height=350");
		}

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