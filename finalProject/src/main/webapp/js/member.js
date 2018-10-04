$(document).ready(function(){
	$('#logId, #logPwd').keyup(function(e){
		if(e.keyCode==13){
			$('#loginBtn').trigger('click');
		}
	});
	
	$('#nonmember_serial, #nonmember_pwd').keyup(function(e){
		if(e.keyCode==13){
			$('#nonmemberBtn').trigger('click');
		}
	});
	
	//로그인
	$('#loginBtn').click(function(){
		$('#logIdDiv').empty();
		$('#logPwdDiv').empty();
		
		if($('#logId').val() == "")
			$('#logIdDiv').text('아이디를 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#logPwd').val() == "")
			$('#logPwdDiv').text('비밀번호를 입력하세요').css('color','red').css('font-size','9pt');
		else {
			var isChk = "false";
			if($("#loginChk").is(":checked")) {
				isChk = "true";
			}
			$.ajax({
				type : 'POST',
				url : '/finalProject/member/login.do',
				data : {'id' : $('#logId').val()
					,'pwd' : $('#logPwd').val()
					,'useCookie' : isChk},
					dataType : 'text',
					success : function(data){
						if(data=='exist')
							location.href='/finalProject/main/index.do';
						else if(data=='nonexist'){
							$('#logPwdDiv').text('로그인 실패').css('color','red').css('font-size','9pt');
						}else {
							location.href='/finalProject'+data;
						}
					}
			});
		} // else
	});
	
	// 아이디 중복 체크
	$('#checkId').click(function(){
		$.ajax({
			type : 'POST',
			url : '/finalProject/member/checkId.do',
			data : {'id':$('#wId').val()}, 
			dataType : 'text',
			success : function(data){
				if(data == 'exist'){
					$('#wIdDiv').text('사용 중입니다').css('color','blue').css('font-size','9pt');
				}else if(data == 'nonexist'){
					$('#idChk').val($('#wId').val());
					$('#wIdDiv').text('사용 가능합니다').css('color','blue').css('font-size','9pt');
				}else if(data == 'empty'){
					$('#wIdDiv').text('먼저 아이디를 입력하세요').css('color','blue').css('font-size','9pt');
				}
			}
		});
	});
	
	
	//비회원 주문
	$('#nonmemberBtn').click(function(){
		$('#serialDiv').empty();
		$('#pwdDiv').empty();
		
		if($('#nonmember_serial').val() == "")
			$('#serialDiv').text('주문번호를 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#nonmember_pwd').val() == "")
			$('#pwdDiv').text('비밀번호를 입력하세요').css('color','red').css('font-size','9pt');
		else {
			$.ajax({
				type : 'POST',
				url : '/finalProject/member/checkGuest.do',
				data : {'serial':$('#nonmember_serial').val()
						,'pwd':$('#nonmember_pwd').val()},
				dataType : 'text',
				success : function(data) {
					if(data=="not") {
						$('#pwdDiv').text('일치하는 정보가 없습니다').css('color','red').css('font-size','9pt');
					}else {
						$('#guestTrackingForm').submit();
					}
				}			
			});
		}
	});
	
	
	//회원가입
	$('#wName').keyup(function(){
		if($(this).val().length == 0)
			$('#wNameDiv').text('이름을 입력하세요').css('color','red').css('font-size','9pt');
		else
			$('#wNameDiv').text('');
	});
	$('#wId').keyup(function(){
		if($(this).val().length == 0)
			$('#wIdDiv').text('아이디를 입력하세요').css('color','red').css('font-size','9pt');
		else
			$('#wIdDiv').text('');
	});
	$('#wPwd').keyup(function(){
		if($(this).val().length == 0)
			$('#wPwdDiv').text('비밀번호를 입력하세요').css('color','red').css('font-size','9pt');
		else
			$('#wPwdDiv').text('');
	});
	
	$('#wRepwd').keyup(function(){
		if($(this).val().length == 0)
			$('#wRepwdDiv').text('비밀번호를 재입력하세요').css('color','red').css('font-size','9pt');
		else if($('#wPwd').val() != $('#wRepwd').val())
			$('#wRepwdDiv').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','9pt');
		else
			$('#wRepwdDiv').text('');
	});
	
	$('#tel2').keyup(function(){
		if($(this).val().length == 0)
			$('#telDiv').text('핸드폰 번호를 입력하세요').css('color','red').css('font-size','9pt');
		else
			$('#telDiv').text('');
	});
	
	$('#tel3').keyup(function(){
		if($(this).val().length == 0)
			$('#telDiv').text('핸드폰 번호를 입력하세요').css('color','red').css('font-size','9pt');
		else
			$('#telDiv').text('');
	});
	
	
	// 등록버튼
	$('#writeBtn').click(function(){	
		$('#wNameDiv').empty();
		$('#wIdDiv').empty();
		$('#wPwdDiv').empty();
		$('#wRepwdDiv').empty();
		$('#telDiv').empty();
		
		if($('#wId').val() == "")
			$('#wIdDiv').text('아이디를 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#wId').val() != $('#idChk').val())
			$('#wIdDiv').text('중복체크 하세요').css('color','blue').css('font-size','9pt');
		else if($('#wPwd').val() == "")
			$('#wPwdDiv').text('비밀번호를 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#wRepwd').val() == "")
			$('#wRepwdDiv').text('비밀번호를 재입력하세요').css('color','red').css('font-size','9pt');
		else if($('#wPwd').val() != $('#wRepwd').val())
			$('#wRepwdDiv').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','9pt');
		else if($('#wPwd').val().length < 8){
			$('#wPwdDiv').text('비밀번호 글자 수는 8자 이상입니다.').css('color','red').css('font-size','9pt');
		}
		else if(!$('#wPwd').val().match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,-,~,`])|([!,@,#,$,%,^,&,*,?,_,-,~,`].*[a-zA-Z0-9])/)){
			$('#wPwdDiv').text('비밀번호는 영문자(대소문자 구분), 숫자, 특수문자의 조합으로 작성해주세요.').css('color','red').css('font-size','9pt');
		}
		else if($('#wName').val() == "")
			$('#wNameDiv').text('이름을 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#tel2').val() == "" || $('#tel3').val() == "")
			$('#telDiv').text('핸드폰 번호를 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#cerMailHidden').val() == "false"){
			$('#wEmailDiv').text('이메일 인증하세요.').css('color','red').css('font-size','9pt');
		}
		else 
			$('#writeForm').submit();
	});
	
	
	// 회원가입 - 이메일 인증
	$('#cerMailBtn').click(function(){
		if($('#email').val() == ''){
			$('#wEmailDiv').text('이메일을 입력하세요').css('color','red').css('font-size','9pt');
			return false;
		}
		
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if(xhttp.readyState == 4){
				$.ajax({
					type : "POST",
					url : "/finalProject/member/checkMail.do",
					data : 'email='+$('#email').val(), // java코드에서 바로 받아옴 
					dataType : "json", 
					success : function(data){
						if(data.memberDTO == null){
							$('#wEmailDiv').empty();
							$('#cerMailBtn').prop("disabled", true);
							
							sendMail($('#email').val());
						}else{
							$('#wEmailDiv').text('이미 있는 메일입니다.').css('color','red').css('font-size','9pt');
						}
					}
				});
			}
		};
		xhttp.open("POST",'/member/checkMail.do',true);
		xhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		xhttp.send('email='+$('#email').val());
		return false;
	});
	
	// 확인 버튼 클릭 시
	$('body').on('click','#confirmMail',function(){
		$.ajax({
			type : "POST",
			url : "/finalProject/member/mailCompare.do",
			data : 'verifyNum='+$('#emailConfirm').val(),
			dataType : "text", 
			success : function(data){
				if(data == 'empty'){
					$('#cerMailDiv').empty();
					$('#cerMailDiv').text('인증번호를 입력하세요.').css('color','red').css('font-size','9pt');
				}else if(data == 'same'){
					$('#wEmailDiv').empty();
					$('#cerMailDiv').text('인증되었습니다.').css('color','blue').css('font-size','9pt');
					$('#cerMailHidden').val('true');
					$('#email').prop("readonly", true);
					
					if($('#is_modifyForm').val() == 'true'){
						modifyForm(2);
						$('#dialog > div').text('인증번호가 전송되었습니다.');
						$('#dialog_frame').show();
					}
				}else if(data == 'different'){
					$('#cerMailDiv').empty();
					$('#cerMailDiv').text('유효하지 않은 인증번호입니다.').css('color','red').css('font-size','9pt');
				}
			}
		});
	});
	
	//수정버튼
	function modifyForm(index) {
		if(index==1) {
			$('#modifyForm').prop('action','/finalProject/member/modifyPwd.do');
		}else if(index==2) {
			$('#modifyForm').prop('action','/finalProject/member/modifyEmail.do');
		}else if(index==3) {
			$('#modifyForm').prop('action','/finalProject/member/modify.do');
		}else return false;
		
		$('#modifyForm').submit();
	}
	
	
	$('#mPwd').keyup(function(){
		if($(this).val().length == 0)
			$('#mPwdDiv').text('비밀번호를 입력하세요').css('color','red').css('font-size','9pt');
		else
			$('#mPwdDiv').text('');
	});
	
	$('#mNewpwd').keyup(function(){
		if($(this).val().length == 0)
			$('#mNewpwdDiv').text('새비밀번호를 입력하세요').css('color','red').css('font-size','9pt');
		else
			$('#mNewpwdDiv').text('');
	});
	
	$('#mNewrepwd').keyup(function(){
		if($(this).val().length == 0)
			$('#mNewrepwdDiv').text('새비밀번호를 재입력하세요').css('color','red').css('font-size','9pt');
		else if($('#mNewpwd').val() != $('#mNewrepwd').val())
			$('#mNewrepwdDiv').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','9pt');
		else
			$('#mNewrepwdDiv').text('');
	});
	
	
	$('#modifyBtn').click(function(){	
		modifyForm(3);
	});
	
	$('#pwdUpdateBtn').click(function(){
		$('#mPwdDiv').empty();
		$('#mNewpwdDiv').empty();
		$('#mNewrepwdDiv').empty();
		
		if($('#mPwd').val() == "")
			$('#mPwdDiv').text('비밀번호를 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#mNewpwd').val() == "")
			$('#mNewpwdDiv').text('새비밀번호를 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#mNewrepwd').val() == "")
			$('#mNewrepwdDiv').text('새비밀번호를 재입력하세요').css('color','red').css('font-size','9pt');
		else if($('#mNewpwd').val() != $('#mNewrepwd').val())
			$('#mNewrepwdDiv').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','9pt');
		else if($('#mPwd').val() != $('#pwdChk').val())
			$('#mPwdDiv').text('현재 비밀번호가 맞지 않습니다').css('color','red').css('font-size','9pt');
		else if($('#mNewpwd').val().length < 8){
			$('#mNewpwdDiv').text('비밀번호 글자 수는 8자 이상입니다.').css('color','red').css('font-size','9pt');
		}
		else if(!$('#mNewpwd').val().match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,-,~,`])|([!,@,#,$,%,^,&,*,?,_,-,~,`].*[a-zA-Z0-9])/)){
			$('#mNewpwdDiv').text('비밀번호는 영문자(대소문자 구분), 숫자, 특수문자의 조합으로 작성해주세요.').css('color','red').css('font-size','9pt');
		}
		else if($('#mPwd').val() == $('#mNewpwd').val())
			$('#mNewpwdDiv').text('현재 비밀번호와 동일합니다').css('color','red').css('font-size','9pt');
		else {
			modifyForm(1);
		}
	});
	
	$('#emailUpdateBtn').on('click',function(){
		$('#edit_bx').append($('<div/>',{
			class : 'in_row'
		}).append($('<div/>',{
			class : 'edit_in'
		}).append($('<span/>',{
			class : 'inpbx'
		}).append($('<input/>',{
			type : 'text',
			id : 'email',
			name : 'email',	
		}))).append($('<button/>',{
			class :'btn_black',
			id : 'modifyEmailBtn',
			type : 'button',
			text : '인증메일 전송'
		}))
		))
		$(this).prop("readonly", true);
	});
	
	//회원정보수정 - 인증메일 전송
	$('body').on('click','#modifyEmailBtn',function(){
		if($('#email').val() == ''){
			$('#editMailDiv').text('이메일을 입력하세요').css('color','red').css('font-size','9pt');
			return false;
		}
		
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if(xhttp.readyState == 4){
				$.ajax({
					type : "POST",
					url : "/finalProject/member/checkMail.do",
					data : 'email='+$('#email').val(), // java코드에서 바로 받아옴 
					dataType : "json", 
					success : function(data){
						if(data.memberDTO == null){
							$('#editMailDiv').empty();
							$('#modifyEmailBtn').prop("disabled", true);
							
							sendMail($('#email').val());
						}else{
							$('#editMailDiv').text('이미 있는 메일입니다.').css('color','red').css('font-size','9pt');
						}
					}
				});
			}
		};
		xhttp.open("POST",'/member/checkMail.do',true);
		xhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		xhttp.send('email='+$('#email').val());
		return false;
	});
	

	// 주소찾기
	$('#addrBtn').on('click',function(){
		new daum.Postcode({
            oncomplete: function(data) {

                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#zipcode').val(data.zonecode);
                $('#addr1').val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
	});
	
	//회원탈퇴
	$('#byeMember').click(function(){
		$('#myConfirmDialog_frame').show();
	});
	
	//다이얼로그 이벤트
	$('#myConfirmDialog_closeBtn, #myConfirmDialog_cancelBtn').click(function(){
		$('#myConfirmDialog_frame').hide();
	});
	
	$('#myConfirmDialog_okBtn').click(function() {
		location.href="/finalProject/member/bye.do";
	});
	
	

	//아이디 찾기, 비밀번호 찾기
	// 이메일 인증
	$('#certNum').click(function(){
		if($('#email').val() == ""){
			$('#cerEmailDiv').text('이메일을 입력해주세요.').css('color','red').css('font-size','9pt');
			return false;
		}
			
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if(xhttp.readyState == 4){
				$.ajax({
					type : "POST",
					url : "/finalProject/member/checkMail.do",
					data : 'email='+$('#email').val(), 
					dataType : "json", 
					success : function(data){
						if(data != null){
							$('#cerEmailDiv').empty();
							sendMail($('#email').val());
						}else{
							$('#cerEmailDiv').text('없는 메일입니다.').css('color','red').css('font-size','9pt');
						}
					}
				});
			}
		};
		xhttp.open("POST",'/member/checkMail.do',true);
		xhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		xhttp.send('email='+$('#email').val());
		return false;
	});
	
	function sendMail(email){
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if(xhttp.readyState == 4){
				if(xhttp.status == 200){ // 메일을 성공적으로 전송
					$('#dialog > div').text('이메일이 정상적으로 변경되었습니다.');
					$('#dialog_frame').show();
					
					$('#cerMail_bx').append($('<div/>',{
						class : 'in_row'
					}).append($('<div/>',{
						class : 'edit_in confirm'
					}).append($('<span/>',{
						class : 'inpbx'
					}).append($('<input/>',{
						type : 'text',
						id : 'emailConfirm'
					}))).append($('<button/>',{
						class :'btn_black',
						id : 'confirmMail',
						type : 'button',
						text : '확인'
					}))
					))
				}
				
			} // if(xhttp.statechange == 4)
		};
		xhttp.open("POST","/finalProject/member/sendMail.do",true);
		xhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		xhttp.send('email='+$('#email').val());
		return false;
	}
	
	//다이얼로그 - 닫기
	$('#dialog_closeBtn').click(function(){
		$('#dialog_frame').hide();
	});
	
	$('#dialog_closeBtn_email').click(function(){
		$('#dialog_frame').hide();
	});
	
	//다음
	$('#verify_number').keyup(function(){
		$('#verifyDiv').text('인증번호를 입력해주세요.').css('color','black').css('font-size','9pt');
	});
	
	// 다음 버튼 클릭 시
	$('#searchBtn').on('click',function(){
		if($('#findId').val() == ""){
			$('#findIdDiv').text('아이디를 입력하세요.').css('color','red').css('font-size','9pt');
			return false;
		}
		$.ajax({
			type : "POST",
			url : "/finalProject/member/mailCompare.do",
			data : 'verifyNum='+$('#verify_number').val(), // java코드에서 바로 받아옴 
			dataType : "text", 
			success : function(data){
				if(data == 'empty'){
					$('#verifyDiv').empty();
					$('#verifyDiv').text('유효하지 않은 인증번호입니다.').css('color','red').css('font-size','9pt');
				}else if(data == 'same'){
					$('#searchForm').submit();
				}else if(data == 'different'){
					$('#verifyDiv').empty();
					$('#verifyDiv').text('유효하지 않은 인증번호입니다.').css('color','red').css('font-size','9pt');
				}
			}
		});
	});

	
	//비밀번호 변경
	$('#newpwd').keyup(function(){
		if($(this).val().length == 0)
			$('#newpwdDiv').text('새비밀번호를 입력하세요').css('color','red').css('font-size','9pt');
		else
			$('#newpwdDiv').text('');
	});
	
	$('#newrepwd').keyup(function(){
		if($(this).val().length == 0)
			$('#newrepwdDiv').text('새비밀번호를 재입력하세요').css('color','red').css('font-size','9pt');
		else if($('#newpwd').val() != $('#newrepwd').val())
			$('#newrepwdDiv').text('비밀번호가 일치하지 않습니다').css('color','red').css('font-size','9pt');
		else
			$('#newrepwdDiv').text('');
	});
	
	
	$('#newPwdBtn').click(function(){
		$('#newpwdDiv').empty();
		$('#newrepwdDiv').empty();
		
		if($('#newpwd').val() == "")
			$('#newpwdDiv').text('새비밀번호를 입력하세요.').css('color','red').css('font-size','9pt');
		else if($('#newrepwd').val() == "")
			$('#newrepwdDiv').text('새비밀번호를 재입력하세요.').css('color','red').css('font-size','9pt');
		else if($('#newpwd').val() != $('#newrepwd').val())
			$('#newrepwdDiv').text('비밀번호가 일치하지 않습니다.').css('color','red').css('font-size','9pt');
		else if($('#newpwd').val().length < 8){
			$('#newpwdDiv').text('비밀번호 글자 수는 8자 이상입니다.').css('color','red').css('font-size','9pt');
		}
		else if(!$('#newpwd').val().match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,-,~,`])|([!,@,#,$,%,^,&,*,?,_,-,~,`].*[a-zA-Z0-9])/)){
			$('#newpwdDiv').text('비밀번호는 영문자(대소문자 구분), 숫자, 특수문자의 조합으로 작성해주세요.').css('color','red').css('font-size','9pt');
		}
		else {
			$('#newpwdForm').submit();
		}
	});
});