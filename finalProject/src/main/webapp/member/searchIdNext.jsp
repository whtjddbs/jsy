<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/member.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/member.js">
</script>
</head>
<body>
<div class="login_wrap">
	<h2 class="member_title">ID/PW 찾기</h2>
	<ul class="tab_list">
		<li><a href="/finalProject/member/searchId.do" class="active">아이디</a></li>
		<li><a href="/finalProject/member/searchPwd.do">비밀번호</a></li>
	</ul>
	<div class="tab_cnt">
		<div class="login_info2">
			<p>
				입력하신 정보와 일치하는 아이디는 <br>
				아래와 같습니다
			</p>
			<ul>
				<li>
					<span>${memberDTO.id} </span>
					   ( <fmt:formatDate pattern="yyyy-MM-dd" value="${memberDTO.logtime}"/> 가입 )
				</li>
			</ul>
		</div>

		<a class="btn btn_login" href="/member/#">LOGIN</a>
	</div>
</div>
</body>
</html>