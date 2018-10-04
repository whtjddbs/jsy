<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet" href="../css/member.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/member.js">
</script>
</head>
<body>
<form id="searchForm" method="post" action="/finalProject/member/searchIdNext.do">
	<div class="login_wrap">
		<h2 class="member_title">ID/PW 찾기</h2>
		<ul class="tab_list">
			<li><a href="/finalProject/member/searchId.do" class="active">아이디</a></li>
			<li><a href="/finalProject/member/searchPwd.do">비밀번호</a></li>
		</ul>
		<div class="tab_cnt">
			<div class="login_info">
				<h1>등록된 이메일로 찾기</h1>
				<p>가입 당시 입력한 이메일을 통해 아이디를 찾을 수 있습니다.</p>
			</div>
	
			<ul class="field_section">
	            <li>
					<div class="title pc_view">
						<label>이름</label>
					</div>
					<div class="field">
						<div class="inpbx">
							<input id="name" placeholder="이름" type="text">
						</div>
					</div>
				</li>
				<li>
					<div class="title pc_view">
						<label>이메일</label>
					</div>
					<div class="field">
						<div class="tellfield">
							<div class="inpbx">
							    <input name="email" id="email" type="text">
							</div>
							<a class="btn btn_bg" id="certNum">인증번호</a>
						</div>
						<div id="cerEmailDiv"></div>
					</div>
				</li>
				<li >
					<div class="title pc_view">
						<label>인증번호</label>
					</div>
					<div class="field">
						<div class="inpbx">
							<input id="verify_number" placeholder="인증번호 4자리 숫자 입력" type="text">
						</div>
						<div class="field_vali2" id="verifyDiv">인증번호를 입력해주세요.</div>
					</div>
				</li>
			</ul>
	
			<a class="btn btn_login" id="searchBtn">다음</a>
		</div>
	</div>
</form>

<div id="dialog_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn"><img src="../image/close.png" width="50" height="50"></i>
		인증번호가 전송되었습니다
	</div>		
</div>	

</body>
</html>