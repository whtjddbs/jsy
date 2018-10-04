<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

#dialog_frame {
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

#moveCart{
    display: inline-block;
    width: 161px;
    margin-top: 24px;
    border: 1px solid #d4d4d4;
    border-radius: 2px;
    font-size: 14px;
    color: #5d5d5d;
    line-height: 40px;
    text-align: center;
    box-sizing: border-box;
}


#dialog_closeBtn {
	position: fixed;
	top: 5px;
	right: 5px;
	cursor: pointer;
}

#dialog {
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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$('#checkLogin1').click(function(){
		$('#dialog_frame').show();
	});

	$('#dialog_closeBtn').click(function(){
		$('#dialog_frame').hide();
	});
});
</script>

</head>
<body>
<div id="dialog_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn"><img src="../image/close.png" width="50" height="50"></i>
			이미 선택된 옵션입니다.<br>

	</div>		
</div>
</body>
</html>