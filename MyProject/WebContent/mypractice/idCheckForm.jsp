<%@page import="com.work.web.loginCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center">
	
	<h3>ID Check</h3>
		<form method="post" action="idCheckProc.jsp" onsubmit="return blankCheck(this)">
			ID : <input type="text" name="id" autofocus>
			<input type="submit" value="Confirm">
		</form>
	</div>
	
	<script type="text/javascript">
	function blankCheck(f){
		var id=f.id.value;
		id=id.trim();
		if(id.length<5){
			alert("Input at least 5 letters required")
			return false;
		}
		return true;
	}
	</script>

</body>
</html>