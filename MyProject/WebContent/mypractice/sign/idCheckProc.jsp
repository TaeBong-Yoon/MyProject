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
String id = request.getParameter("id");
boolean check = MemberDAO.checkID(id);
out.println("Your ID : <strong>" + id + "</strong>");
if(check==false){
	out.println("<p> is Available ID</p>");
	out.println("<a href='javascript:apply(\"" + id + "\")'>[Apply]</a>");
%>

<script>
function apply(id){
	opener.document.getElementById('id').value=id;
	window.close();
}
</script>

<% 
}else{
	out.println("<p> is not available</p>");
}
%>
<hr> 
<a href="javascript:history.back()">[Try Again]</a>
&nbsp; &nbsp; 
<a href="javascript:window.close()">[Close]</a>
</body>
</html>