<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0044)https://www.29cm.co.kr/mypage/edit/reconfirm -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>finalProject</title>
<link rel="stylesheet" type="text/css" href="../css/chkPwd.css">
<link rel="stylesheet" href="../css/myDialog.css">
</head>
<body >

<div class="article_right">
	<section class="my_reconfirm">
	    <h3 class="my_tit">비밀번호 재확인 <span>회원님의 소중한 정보보호를 위해 비밀번호를 재확인하고 있습니다</span></h3>
	    <fieldset>
	        <div class="reconfirm">
	                <label class="type">비밀번호&nbsp;&nbsp;</label>
	                <div class="inpbx">
	                    <input id="chkPwd" type="password" name="pwd">
	                    <div id="chkPwdDiv"></div>
	                </div>    
	        </div>
	        <div class="btn_bx">
	            <button class="btn_black" type="button" id="checkBtn">확인</button>
	            <button class="btn_bor" type="reset">취소</button>
	        </div>
	    </fieldset>
	</section>
</div>


<div id="dialog_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn">clear</i>
			비밀번호가 틀렸거나, 접근 권한이 없습니다
	</div>		
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.my_shop > ul:eq(1) > li:eq(0) > a').css('font-weight', '800');
	
	$('#chkPwd').keyup(function(e){
		if(e.keyCode==13){
			$('#checkBtn').trigger('click');
		}
	});

	$('#checkBtn').click(function(){
		$('#chkPwdDiv').empty();
		
		if($('#chkPwd').val() == ""){
			$('#dialog_frame').show();
			$('#dialog_closeBtn').click(function(){
				$('#dialog_frame').hide();
			});
		}else {
			$.ajax({
				type : 'POST',
				url : '/finalProject/member/checkPwdCheck.do',
				data : {'pwd' : $('#chkPwd').val() },
					dataType : 'text',
					success : function(data){
						if(data=='exist')
							location.href='/finalProject/member/modifyForm.do';
						else if(data=='nonexist'){
							$('#dialog_frame').show();
							$('#dialog_closeBtn').click(function(){
								$('#dialog_frame').hide();
							});
						}
					}
			});
		} // else
	});
});
</script>
</body>
</html>