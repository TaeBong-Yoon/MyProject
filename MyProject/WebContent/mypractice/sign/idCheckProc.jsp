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
<!-- 하이퍼링크로 사용할때 -->
<!-- out.println("<a href='javascript:apply(\"" + id + "\")'>[Apply]</a>"); -->
<%
String id = request.getParameter("id");
boolean check = MemberDAO.checkID(id);
out.println("Your ID : <strong>" + id + "</strong>");
if(check==false){
	out.println("<p> is Available ID</p>");
	out.println("<input type='button' value='Apply' onclick='javascript:apply(\"" + id + "\")'>");
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
<input type="button" value="Try Again" onclick="javascript:history.back()">
<input type="button" value="Cancel" onclick="javascript:window.close()">
</body>
</html>