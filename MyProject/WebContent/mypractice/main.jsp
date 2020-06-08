<%@page import="com.work.web.loginCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="formCheck.js"></script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String password = request.getParameter("password");

if(loginCheck.pass(id,password)==1){
	session.setAttribute("id",id);
	session.setAttribute("login","yes");
} else if (loginCheck.pass(id,password)==0){
	session.setAttribute("login","no");
}
String logout = request.getParameter("logout");

if(logout != null && logout.equals("yes")){
	session.removeAttribute("id");
	session.removeAttribute("login");
}

String login = (String)session.getAttribute("login");

if(login != null && login.equals("yes")){
	out.println("<script>");
	out.println("alert('Sign In Successfully!')");
	out.println("location.href='main_OK.jsp'");
	out.println("</script>");
} else if (login != null && login.equals("no")){
	session.removeAttribute("id");
	session.removeAttribute("login");
	out.println("<script>");
	out.println("alert('Try again!')");
	out.println("location.href='main.jsp'");
	out.println("</script>");
}

%>
<!-- 
현재 추가해야 할 부분
2. 회원 탈퇴 기능 만들기!
 - DELETE FROM `mydb`.`member` WHERE (`idx` = '9') and (`id` = 'pqgyt');
 - 인덱스 말고 id만 찾아서 삭제..?
3. 회원 정보 수정 만들기!

 -->

<h1>WelCome! : )</h1>
	<form action="?" method="POST" onsubmit="return loginCheck(this)">
		
		<table>
			<tr><th colspan="2"><h3>Sign In</h3></th></tr>
			<tr>
				<td>ID : </td>
				<td><input type="text" name="id"/></td>
			</tr>
			
			<tr>
				<td>PW : </td>
				<td><input type="password" name="password"/></td>
			</tr>
			
			<tr>
			<td colspan="2" align="center"><input type="submit" value="Sign In"/></td>
			<td colspan="2" align="center"><input type="button" value="Sign Up" onclick="location.href='joinPage.jsp'"/></td>
			</tr>
			
		</table>
	</form>
</body>
</html>