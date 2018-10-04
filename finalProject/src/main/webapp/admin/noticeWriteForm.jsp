<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<script type="text/javascript" src="../resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "../resources/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#insertBoard").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#insertBoardFrm").submit();
        });
        
        $('#noticeReset').click(function(){
        	history.back();
        });
    });
</script>
</head>
<div style="margin-left: 80px;">
	<div style="border-bottom: 4px solid black; width: 1000px; top: 300px; padding-bottom: 10px;"> 
		<h4 style="font-size: 25px; font-weight: 900;">공지사항</h4>
	</div>
	<form action="/finalProject/admin/noticeUpload.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
		<div style="padding-top: 20px;">
			<div style="padding-bottom: 20px;">
				<label style="padding-right: 10px; font-size: 20px;">Title </label>
				<input name="title" id="noticeTitle" style="width: 948px;">
				<div id="noticeTitleDiv"></div>
			</div>
			<div>
				<textarea name="content" id="editor" style="width: 1000px; height: 400px;"></textarea>
				<div id="noticeContentDiv"></div>
			</div>
		
			<div style= "padding-top: 20px; width: 1000px;">
				<div style="float: right;">
					<button class="btn_black" type="submit" id="insertBoard" style="background: #000; color: #fff; width: 100px; border: none; line-height: 50px;">글등록</button>
					<button id="noticeReset" class="btn_bor" type="button" style="background: #000; color: #fff; border: none; width: 100px; line-height: 50px;">취소</button>
				</div>
			</div>
		</div>
	</form>
</div>



