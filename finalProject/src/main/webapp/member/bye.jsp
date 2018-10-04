<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/myDialog.css">    
<style type="text/css">
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

fieldset {
    display: block;
    margin-inline-start: 2px;
    margin-inline-end: 2px;
    padding-block-start: 0.35em;
    padding-inline-start: 0.75em;
    padding-inline-end: 0.75em;
    padding-block-end: 0.625em;
    min-width: -webkit-min-content;
    border-width: 2px;
    border-style: groove;
    border-color: threedface;
    border-image: initial;
}

ul, menu, dir {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

legend {
    display: block;
    padding-inline-start: 2px;
    padding-inline-end: 2px;
    border-width: initial;
    border-style: none;
    border-color: initial;
    border-image: initial;
}

textarea {
    -webkit-appearance: textarea;
    background-color: white;
    -webkit-rtl-ordering: logical;
    flex-direction: column;
    resize: auto;
    cursor: text;
    white-space: pre-wrap;
    overflow-wrap: break-word;
    border-width: 1px;
    border-style: solid;
    border-color: initial;
    border-image: initial;
    padding: 2px;
}

input, textarea, select, button {
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    margin: 0em;
    font: 400 13.3333px Arial;
}

.my_tit.nobor {
    padding: 0;
    border: 0;
}

.my_tit {
    position: relative;
    padding-bottom: 10px;
    border-bottom: 4px solid #000;
    font-size: 22px;
    color: #000;
    line-height: 30px;
    font-weight: 500;
}

.my_leave .my_tit_dsc {
    font-size: 14px;
    color: #303033;
    line-height: 24px;
}

.my_guide_info {
    margin-top: 10px;
}

.my_guide_info li:after {
    position: absolute;
    top: 13px;
    left: 0;
    width: 4px;
    height: 4px;
    border-radius: 50%;
    background: #000;
    content: "";
}

.my_leave .my_dsc_bor {
    margin: 40px 0;
    padding: 41px 0 39px;
    border-top: 4px solid #000;
    border-bottom: 1px solid #303033;
    font-size: 28px;
    color: #000;
    line-height: 30px;
    text-align: center;
}

.m_view {
    display: none;
}

.point{
    font-weight: 600;
    color: #ff4800;
}

fieldset {
    padding: 0;
    border: 0;
}

.blind, legend {
    overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    width: 1px;
    height: 1px;
    font-size: 1px;
    line-height: 100px;
    white-space: nowrap;
}

.my_leave .field_section label {
    display: inline-block;
    margin-top: 10px;
    margin-bottom: 5px;
    font-size: 17px;
    font-weight: 600;
    color: #303033;
    line-height: 24px;
}

.my_leave .field_section textarea{
    resize: none;
}

.btn, .inptxtbx textarea {
    outline: none;
    vertical-align: top;
    box-sizing: border-box;
}

.inptxtbx textarea {
    display: block;
    width: 100%;
    font-size: 15px;
    line-height: 20px;
    color: #1a1a1a;
    overflow: auto;
    padding: 9px 14px;
    border: 1px solid #ccc;
    background: transparent;
}

.my_leave .field_section .inpbx {
    width: 20%;
}

.inpbx, .inpbx input {
    vertical-align: top;
    box-sizing: border-box;
}

.inpbx {
    position: relative;
    height: 40px;
    border: 1px solid #d4d4d4;
    background: #fff;
}

.inpbx input {
    display: block;
    width: 100%;
    height: 100%;
    padding: 0 14px;
    font-size: 15px;
    color: #1a1a1a;
    border: 0;
    background: transparent;
    outline: none;
}

.my_leave .btn_bx {
    margin-top: 30px;
    padding-top: 21px;
    border-top: 1px solid #d4d4d4;
    text-align: center;
}

.my_leave .btn_bx button {
    width: 82px;
    height: 40px;
}

.btn_black, .btn_bor {
    display: inline-block;
    box-sizing: border-box;
}

.btn_bor {
    border: 1px solid #d4d4d4;
    border-radius: 2px;
    font-size: 12px;
    color: #5d5d5d;
    line-height: 30px;
    text-align: center;
}

.btn_black {
    min-width: 82px;
    padding: 0 25px;
    border: 1px solid #303033;
    background: #303033;
    font-size: 13px;
    color: #fff;
    line-height: 40px;
}

#dialog_frame_bye {
	background-color: transparent;
    z-index: 1000;
    opacity: 1;
	display: none;
    position: fixed;
    overflow: hidden;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    text-align: center;
}
#dialog_bye {
	width: inherit;
    height: inherit;
    padding: 50px 40px 40px;
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.5) 20px 20px 80px 0px;
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
    position: absolute;
    top: 50%;
    left: 50%;
    box-sizing: border-box;
    min-width: 300px;
}
#dialog_closeBtn_bye {
	position: fixed;
	top: 5px;
	right: 5px;
	cursor: pointer;
}
</style>


<section class="my_leave">
    <h3 class="my_tit nobor">회원탈퇴</h3>
    <p class="my_tit_dsc">고객님께서 회원 탈퇴를 원하신다니 저희 서비스가 많이 부족하고 미흡했나 봅니다.<br>불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br>아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.</p>
    <ul class="my_guide_info">
        <li>회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 29cm 고객정보 보호정책에따라 관리 됩니다.</li>
        <li>탈퇴 시 고객님께서 보유하셨던 마일리지는 모두 삭제되며, 한번 탈퇴한 아이디는 다시 사용 불가능합니다.</li>
    </ul>
    <p class="my_dsc_bor">현재 고객님의 사용 가능 마일리지는 <br class="m_view"><strong class="point">0</strong> 입니다</p>
    <form id="realBye" method="post" action="/finalProject/member/realBye.do">
    <fieldset>
        <legend>탈퇴사유 작성</legend>
        <ul class="field_section">
            <li>
                <div class="title">
                    <label for="textField_text1" >불편했던 점을 적어주세요 (선택)</label>
                </div>
                <div class="field">
                    <div class="inptxtbx">
                         <textarea cols="1" rows="5" id="textField_text1"></textarea>
                    </div>
                </div>
            </li>
            <li>
                <div class="title">
                    <label for="textField_text2">비밀번호</label>
                </div>
                <div class="field">
                    <div class="inpbx">
                        <input id="bye_pwd" type="password" >
                    	<div id="bye_pwdDiv"></div>
                    </div>
                </div>
                <div class="title">
                    <label for="textField_text2">비밀번호 확인</label>
                </div>
                <div class="field">
                    <div class="inpbx">
                        <input id="bye_pwdChk" type="password">
                        <div id="bye_pwdChkDiv"></div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="btn_bx">
            <button class="btn_bor" type="reset">취소</button>
            <button class="btn_black" type="button" id="realByeBtn">탈퇴</button>
        </div>
    </fieldset>
    </form>
</section>

<!-- 기본 다이얼로그 -->
<div id="dialog_frame_bye">
	<div id="dialog_bye">
		<i class="material-icons" id="dialog_closeBtn_bye">clear</i>
		<div></div>
	</div>		
</div>

<input type="hidden" id="chk">

<!-- confirm 다이얼로그 -->
<div id="myConfirmDialog_frame" style="display: none;">
	<div id="myConfirmDialog">
		<i class="material-icons" id="myConfirmDialog_closeBtn">clear</i>
			정말 탈퇴하시겠습니까?
		<button id="myConfirmDialog_okBtn">탈퇴하기</button>
		<button id="myConfirmDialog_cancelBtn">취소</button>
	</div>
</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#bye_pwdChk').keyup(function(){
		if($(this).val().length == 0)
			$('#bye_pwdChkDiv').text('비밀번호를 재입력하세요').css('color','red').css('font-size','9pt');
		else if($('#bye_pwd').val() != $('#bye_pwdChk').val())
			$('#bye_pwdChkDiv').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','9pt');
		else
			$('#bye_pwdChkDiv').text('');
	});
	
	$('#realByeBtn').click(function(){
		$('#bye_pwdDiv').empty();
		$('#bye_pwdChkDiv').empty();
		
		if($('#bye_pwd').val() == '')
			$('#bye_pwdDiv').text('비밀번호를 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#bye_pwdChk').val() == '')
			$('#bye_pwdChkDiv').text('비밀번호를 재입력하세요').css('color','red').css('font-size','9pt');
		else if($('#bye_pwd').val() != $('#bye_pwdChk').val())
			$('#bye_pwdChkDiv').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','9pt');
		else {
			$('#myConfirmDialog_frame').show();
		}
	});
	
	//다이얼로그 이벤트
	$('#myConfirmDialog_closeBtn, #myConfirmDialog_cancelBtn').click(function(){
		$('#myConfirmDialog_frame').hide();
	});
	
	$('#myConfirmDialog_okBtn').click(function() {
		$('#myConfirmDialog_frame').hide();
		$.ajax({
			type : "POST",
			url : "/finalProject/member/realBye.do",
			data : 'pwd='+$('#bye_pwd').val(), 
			dataType : "text", 
			success : function(data){
				if(data == 'noBye'){
					$('#dialog_bye > div').text('비밀번호가 일치하지 않습니다.');
					$('#dialog_frame_bye').show();
				}else if(data == 'bye'){
					$('#dialog_bye > div').text('정상처리되었습니다 감사합니다.');
					$('#dialog_frame_bye').show();
					$('#chk').val('true');
				}
			}
		});
	});
	
	//다이얼로그 - 닫기
	$('#dialog_closeBtn_bye').click(function(){
		$('#dialog_frame_bye').hide();
		if($('#chk').val() == 'true')
			location.href="/finalProject/main/index.do";
	});
});
</script>