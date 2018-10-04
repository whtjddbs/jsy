<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/member.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		$('#dialog_frame').show();
	$('#dialog_closeBtn').click(function(){
		$('#dialog_frame').hide();
		$(location).attr('href','/finalProject/admin/adminIndex.do');
	});
});
</script>

</head>
<body>
<div id="dialog_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn">clear</i>
			이벤트 등록이 완료되었습니다
	</div>		
</div>	
</body>
</html>