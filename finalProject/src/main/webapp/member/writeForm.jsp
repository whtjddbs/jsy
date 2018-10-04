<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/member.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="../js/member.js">
</script>
</head>
<body>

<div align="center">
<font class="title">SIGN UP</font>
<hr width="500" color="#000">
</div>


<form method="post" id="writeForm" action="/finalProject/member/write.do">
<div class="container" role="main">
	<div class="content">
		<div class="join_content">
			<div class="join_row">
				<div class="join_title">
	               <label>아 이 디</label>
	            </div>
	            <div class="addr_div">
		            <span class="ps_box id_box">
		            	<input type="text" id="wId" name="id" class="input id_inp" maxlength="20">
		            	<input type="hidden" name="idChk" id="idChk">
		            </span>
		            <input type="button" class="idChk_btn" id="checkId" value="중복체크">
		            <div id="wIdDiv"></div>
	            </div>
	         </div>
	         
	         <div class="join_row">   
	            <div class="join_title">
	               <label>비 밀 번 호</label>
	            </div>
	            <span class="ps_box">
	            	<input type="password" id="wPwd" name="pwd" class="input" maxlength="20">
	            </span>
	            <div id="wPwdDiv"></div>
	         </div>
	         
	         <div class="join_row">   
	            <div class="join_title">
	               <label>비 밀 번 호 확 인</label>
	            </div>
	            <span class="ps_box">
	            	<input type="password" id="wRepwd" name="repwd" class="input" maxlength="20">
	            </span>
	            <div id="wRepwdDiv"></div>
	         </div>
	         
	         <div class="join_row"> 
	            <div class="join_title">
	               <label>이 름</label>
	            </div>
	            <span class="ps_box">
	            	<input type="text" id="wName" name="name" class="input" maxlength="20">
	            </span>
	            <div id="wNameDiv"></div>
	         </div>
	         
	         <div class="join_row join_tel">   
	            <div class="join_title">
	               <label>휴 대 전 화</label>
	            </div>
	            <div class="tel_box">
	            	<div class="tel1">
	            		<span class="selbx">
				            <select name="tel1" class="sel">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="012">012</option>
								<option value="012">019</option>
							</select>
						</span>
	            	</div>
					<div class="tel2">
						<span class="ps_box">
		            		<input type="text" name="tel2" id="tel2" class="input" maxlength="4">
		           		</span>
					</div>
					<div class="tel3">
						<span class="ps_box">
		            		<input type="text" name="tel3" id="tel3" class="input" maxlength="4">
		            	</span>
					</div>
	            </div>
					<div id="telDiv"></div>
			</div>
			
			<div class="join_row"> 
	            <div class="join_title">
	               <label>이 메 일</label>
	            </div>
	             <div class="addr_div">
		            <span class="ps_box">
		            	<input type="text" name="email" id="email" class="input id_inp" maxlength="30">
		            </span>
		            <input type="button" class="idChk_btn" id="cerMailBtn" value="이메일 인증">
		            <input type="hidden" id="cerMailHidden" value="false">
		            <div id="wEmailDiv"></div>
	            </div>
	            <div class="edit_bx" id="cerMail_bx"></div>
	            <div id="cerMailDiv"></div>
	        </div>
	        
	        <div class="join_row"> 
	            <div class="join_title">
	               <label>주 소</label>
	            </div>
	            <div class="addr_div">
		            <span class="ps_box zip_box">
	  					<input type="text" class="input zip_inp" name="zipcode" id="zipcode" readonly>
		            </span>
	   					<input type="button" class="addr_btn" id="addrBtn" value="주소찾기">
				</div>
	            <span class="ps_box">
	            	<input type="text" name="addr1" id="addr1" class="input" readonly>
	            </span>
	            <span class="ps_box">
	            	<input type="text" name="addr2" id="addr2" class="input" maxlength="30">
	            </span>
	        </div>
	         
	        <div class="btn_area">
	        	<button type="button" id="writeBtn" class="btn_type btn_primary">가입하기</button>
	        </div>
		</div>
	</div>
	</div>
	
<div id="dialog_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn">clear</i>
		인증번호가 전송되었습니다
	</div>		
</div>	
</form>

<input type="hidden" id="is_modifyForm" value="false">
</body>
</html>