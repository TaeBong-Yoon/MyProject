<%@page import="com.work.web.MemberDAO"%>
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

	String login = (String) session.getAttribute("login");
	
	if (MemberDAO.checkRequest(id, password) == 0) {
		session.setAttribute("id", id);
		session.setAttribute("login", "yes");
		out.println("<script>");
		out.println("alert('Sign In Successfully!')");
		out.println("location.href='main_OK.jsp'");
		out.println("</script>");	
	} else if (MemberDAO.checkRequest(id, password) == 1) {
		session.setAttribute("login", "no");
		session.removeAttribute("id");
		session.removeAttribute("login");
		out.println("<script>");
		out.println("alert('Try again!')");
		out.println("location.href='index.jsp'");
		out.println("</script>");
	} else if (MemberDAO.checkRequest(id, password) == 2) {
		session.removeAttribute("id");
		session.removeAttribute("login");
		out.println("<script>");
		out.println("alert('Check your ID again')");
		out.println("location.href='index.jsp'");
		out.println("</script>");
	}

	String logout = request.getParameter("logout");

	if (logout != null && logout.equals("yes")) {
		session.removeAttribute("id");
		session.removeAttribute("login");
	}
	%>
	<!-- 
현재 추가해야 할 부분
1. 아이디가 없을 경우 alert 창 띄우기 - 완료
1-1. 비밀번호가 틀릴경우 alert - 완료
2. 회원 탈퇴 기능 만들기! - 완료
 - DELETE FROM `mydb`.`member` WHERE (`idx` = '9') and (`id` = 'pqgyt');
 - 인덱스 말고 id만 찾아서 삭제..?
3. 회원 정보 수정 만들기! - 완료
4. 아이디 찾기
 - 테이블에 전화번호를 추가 - 완료
 - 이름과 전화번호로 비교
5. 비밀번호 찾기
 - 아이디와 전화번호(이름)으로 비교
 -->

</body>
</html>