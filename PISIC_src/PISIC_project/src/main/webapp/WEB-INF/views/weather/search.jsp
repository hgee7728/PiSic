<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Weather API</title>
</head>
<body>
<body style="text-align: center">
<div style="display:inline-block;width: 500px;text-align: center;margin-top:100px;margin-left: 0; margin-right: 0;">
	<h1>
		날씨 날씨??
	</h1>
	<h3>
		원하는 동네의 날씨 골라주세요 <br>
		ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ
	</h3>
	<select name="city">
		<option  value="서울시">서울시</option>
	</select>
	<select name="gu">
		<option  value="관악구">관악구</option>
		<option  value="동작구">동작구</option>
	</select>
	
	<button type="button" class="btn search">날씨 찾기 얍</button>
</div>

<script>
$(".btn.search").on("click", lookup);

function lookup(idx,item){
	console.log(idx);
	console.log(item);
	var a=$("select[name=city]").val();
	var b=$("select[name=gu]").val();

	a = a+"/"+b;
	console.log(a);
	$.ajax({
		url:"${path}/weather/"+a,
		type:"post",
		sucess: function(result){
			console.log(result);
		},
		error: function (errorcode){
			console.log(errorcode);
		}
	});
	
}

</script>
</body>
</html>