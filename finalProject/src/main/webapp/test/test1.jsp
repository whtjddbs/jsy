<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>1</td><td><button type="button" class="btn">완료</button></td>
	</tr>
	<tr>
		<td>2</td><td><button type="button" class="btn">완료</button></td>
	</tr>
	<tr>
		<td>3</td><td><button type="button" class="btn">완료</button></td>
	</tr>
	<tr>
		<td>4</td><td><button type="button" class="btn">완료</button></td>
	</tr>
</table>
<button type="button" class="dialogBtn">다이얼로그 버튼</button>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var na;
	$('.btn').click(function(){
		na = $(this);
	});
	
	$('.dialogBtn').click(function(){
		alert(na.parent().prev().text());
	})
</script>
</html>