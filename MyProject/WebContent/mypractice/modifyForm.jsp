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
<h3>Modify user information</h3>
<table>
<tr>
<td align="center">ID</td>
<td align="center">"User id 들어가야함"</td>
</tr>
<tr>
<td align="center">Password</td>
<td align="center"><input type="password" placeholder="사용자 비밀번호"></td>
</tr>
<tr>
<td align="center">P/W Check</td>
<td align="center"><input type="password" placeholder="비밀번호 확인"></td>
</tr>
<tr>
<td align="center">Name</td>
<td align="center"><input type="text" placeholder="사용자 이름"></td>
</tr>
<tr>
<td align="center">Age</td>
<td align="center"><input type="text" placeholder="사용자 나이"></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" value="Complete"></td>
</tr>

</table>

</body>
</html>