<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/member/insert" method="post">
	아이디 :<input type="text" name="m_id" required><br>
	비밀번호 :<input type="password" name="m_password" required><br>
	이름 :<input type="text" name="m_name" required><br>
	<button type="submit">회원가입</button>
</form>
</body>
</html>