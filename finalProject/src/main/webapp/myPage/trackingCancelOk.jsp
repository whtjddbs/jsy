<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.cancelTitle{
	border-bottom: 4px solid #000;
}

.cancelComment{
	padding-top : 80px;
}

.cancelOk_btn{
    width: 240px;
    height: 40px;
    background: #303033;
    font-size: 15px;
    color: #fff;
    border: 1px solid #303033;
}

.cancelWords{
	font-size: 30px;
}

</style>    
<div class="cancelTitle">
	<h3>주문취소</h3>
</div>
<div class="cancelComment" align="center">
	<span class="cancelWords">주문취소가 완료되었습니다</span>
	<br><br><br><br><br>
	<input type="button" class="cancelOk_btn" id="cancelOkBtn" value="접수내역 확인">
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#cancelOkBtn').click(function(){
		location.href="/finalProject/myPage/modifyList.do";
	});
});
</script>
