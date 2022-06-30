<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 글등록페이지</title>
</head>
<body>

	<form action="<%=request.getContextPath() %>/qna/write" method="post"
	 enctype="multipart/form-data">
	 	<input type="text" name="refnum" value="${refnum }" readonly>
		<div>제목:<input type="text" name=board_title required></div>
		<div>내용:<input type="text" name="board_content" required></div>
		<div>파일:<input type="file" name="uploadfile"></div>
		<div><button type="submit">글등록</button></div>
	</form>
	
	    <div class="form-check">
        <input class="form-check-input" type="checkbox" name="secret" id="secret">
        <label class="form-check-label">비밀글 설정</label>
    </div>
</body>
</html>