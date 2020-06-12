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
	<form action="sign/authorize.jsp" method="POST" onsubmit="return loginCheck(this)">
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
	<input type="button" value="Find ID" onclick="location.href='find/findForm.jsp'" />
	<input type="button" value="Find P/W" onclick="location.href='find/findForm.jsp'" />	
<!-- 
현재 추가해야 할 부분
1. 아이디가 없을 경우 alert 창 띄우기 - 완료
1-1. 비밀번호가 틀릴경우 alert - 완료
2. 회원 탈퇴 기능 만들기! - 완료
 - DELETE FROM `mydb`.`member` WHERE (`idx` = '9') and (`id` = 'pqgyt');
 - 인덱스 말고 id만 찾아서 삭제..?
3. 회원 정보 수정 만들기! - 완료
4. 아이디 찾기 - 완료
 - 테이블에 전화번호를 추가 - 완료
 - 이름과 전화번호로 비교 - 완료
5. 비밀번호 찾기 - 완료
 - 아이디와 전화번호(이름)으로 비교 - 완료
6. 파일별 정리..
 - 세션 정리
   - 로그 아웃, 회원 탈퇴 시에 세션 종료
   - 세션 지속시간 설정
 - location 경로 재지정
 7. MVC2 적용
 
 -->
</body>
</html>