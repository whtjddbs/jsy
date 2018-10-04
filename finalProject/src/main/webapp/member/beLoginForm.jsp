<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>finalProject</title>
<link rel="stylesheet" type="text/css" href="../css/beloginForm.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/member.js">
</script>
</head>
<body class="has_banner">
    <div  class="main_container">
    </div>
    <section class="member">
        <div class="login_wrap">
    	<h2 class="member_title">비회원 주문</h2>
    
    <ul class="tab_list">

        <li ><a href="" class="active">비회원</a></li>
    </ul>
    
    <div class="tab_cnt" style="margin-top:15px;">
        <form  method="post" id="" action="/finalProject/myPage/tracking.do">
            <div  class="inpbx">
                <input  placeholder="이메일" type="text" id="nonmember_email">
                <div id="emailDiv"></div>
			</div>
			<div class="inpbx">
                <input  placeholder="비밀번호" type="text" id="nonmember_pwd">
                <div id="pwdDiv"></div>
            </div>
  
 				<button class="btn btn_login" type="button" id="nonmemberBtn">주문배송조회</button>
        </form>
    </div>

    <ul style="padding-left:130px;"  class="linkarea">
        <li><a href="/finalProject/member/writeForm.do">회원가입</a></li>
        <li><a href="/finalProject/member/loginForm.do">회원</a></li>
    </ul>


</div>
</section>
  
</body>
</html>