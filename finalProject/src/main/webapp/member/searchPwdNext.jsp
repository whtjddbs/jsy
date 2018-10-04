<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<li><a href="/finalProject/member/searchId.do">아이디</a></li>
		<li><a href="/finalProject/member/searchPwd.do" class="active">비밀번호</a></li>
	</ul>

<form id="newpwdForm" method="post" action="/finalProject/member/newpwdOk.do">	
    <div class="tab_cnt">
		<div class="login_info">
			<p>
				회원님의 계정 비밀번호를 재설정 해주세요<br>
				신규비밀번호는 8자 이상 영문자(대소문자 구분), 숫자, 특수문자의 조합으로 <br>작성하셔야 합니다
			</p>
		</div>
		
		<ul class="field_section">
			<li>
				<div class="title2 pc_view">
					<label >신규 비밀번호 입력</label>
				</div>
				<div class="field">
					<div class="inpbx">
						<input id="newpwd" name="pwd" type="password">
						<input type="hidden" name="id" value="${memberDTO.id}">
					</div>
					<div id="newpwdDiv"></div>
				</div>
			</li>
			<li>
				<div class="title2 pc_view">
					<label >신규 비밀번호 확인</label>
				</div>
				<div class="field">
					<div class="inpbx">
						<input id="newrepwd" type="password">
					</div>
					<div id="newrepwdDiv"></div>
				</div>
			</li>
		</ul>

		<a class="btn btn_login" id="newPwdBtn">비밀번호 변경</a>
		<!-- 비밀번호 변경 버튼을 누르면 다이얼로그로 "변경되었습니다 로그인 페이지로 이동합니다" 라고 뜨고 로그인 페이지로 이동 -->
	</div>
</form>

</div>
</body>
</html>
