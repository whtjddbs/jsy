<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mantoman.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
function mantomanPaging(pg2){
	$('#pg').val(pg2);
	
	onPageLoad();
}
</script>

<script type="text/javascript">
$('.my_shop > ul:eq(2) > li:eq(0) > a').css('font-weight', '800');

$(document).ready(function(){
	
	onPageLoad();
	
});

function onPageLoad(){
	$('div#mantomanTable div.info').siblings().remove();
	
	$.ajax({
		type : 'POST',
		url : '/finalProject/customerService/getMantomanList.do',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			$.each(data.list,function(index,mantomanDTO){
				$('<div/>',{
					class : 'info2'
				}).append($('<p/>',{
					text : mantomanDTO.type
					}).css({
						'padding-left':'25px', 
						width: '150px'
				})).append($('<p/>',{
					text : mantomanDTO.title,
					class : 'mm_title'
					}).css({
						'text-align':'left',
						padding: '2% 3% 2% 0'
				})).append($('<p/>',{
					text : mantomanDTO.logtime
					}).css({
						width:'105px'
				})).append($('<p/>',{
					text : "상태"
					}).css({
						width:'60px'
				})).append($('<p/>')
					.css({
						width:'50px'	
				}).append($('<button/>',{
					type : 'button',
					class : "m_d_btn",
					text : "삭제",
					value : mantomanDTO.seq
					}))).appendTo($('#mantomanTable'));
				
				$('<div/>',{
					class : 'wrap_info34'
				}).append($('<div/>',{
					class : 'info3'
				}).append($('<span/>',{
					text : 'Q.',
					class : 'styleQA'
				})).append($('<p/>',{
					id : 'p_conetent',
					text : mantomanDTO.content
				}))).append($('<div/>',{
					class : 'info4'
				}).append($('<span/>',{
					text : 'A.',
					class : 'styleQA'
				})).append($('<p/>',{
					id : 'p_answer',
					text : '관리자응답'
				}))).appendTo($('#mantomanTable'));
			});
			
			$('#mantomanPagingDiv').html(data.paging.pagingHTML);
		}
	});
	
	//생겼다,사라졌다
	$('body').on('click','.mm_title',function(){
		if($(this).parent().next().css('display')=='none'){
			$(this).parent().next().slideDown();
		}else {
			$(this).parent().next().slideUp();
		}
	});
	
	//삭제버튼 클릭시
	$('body').on('click','.m_d_btn',function(){
		$('#mantomanDelete_frame').show();
		$('#mantomanDelete_frame').val($(this).val());
		
	});
	
	$('#mantomanDelete_closeBtn, #mantomanDelete_cancelBtn').click(function(){
		$('#mantomanDelete_frame').hide();
	});
	
	$(document).on('click','#dialog_closeBtn',function(){
		$(this).parent().parent().hide();	
		location.href="/finalProject/customerService/mantomanList.do";
	});
	
	$('#mantomanDelete_okBtn').click(function(){
		$('#mantomanDelete_frame').hide();
		
		$.ajax({
			type : 'POST',
			url : '/finalProject/customerService/deleteMtm.do',
			data : "seq="+$('#mantomanDelete_frame').val(),
			dataType : 'text',
			success : function(response){
				if(response=="success"){
					$('#deleteMtm_frame').show();
				}
			}
		});
		
	});	
}

</script>
</head>
<body>


<div class="wrap" style="padding: 0 50px 100px;">

<div>
	<h3>1:1 문의내역</h3>
	<p style="margin-top: 40px; margin-bottom: 20px;">
		<strong>상담시간</strong><br/>
		평일(월 ~ 금) 10:00 ~ 17:00<br/>
		(Off-time 12:00 ~ 14:00, 토/일/공휴일 휴무)
	</p>
	<ul class="ml_ul">
		<li>한번 등록한 상담내용은 수정이 불가능합니다.</li>
		<li>향후 멤버쉽 단계별 혜택 및 선정기준은 사전공지 후 변경될 수 있습니다.</li>
	</ul>
</div>

<div style="text-align: right;">
	<a id="ml_a" href="/finalProject/customerService/mantomanWriteForm.do">
		1:1문의 쓰기
	</a>
</div>
<br/>
	<div id="mantomanTable">
		<div class="info">
			<p class="type" style="padding-left:30px; width: 150px;">상담구분</p>
			<p class="tit" style="text-align:left; padding: 15px 3% 15px 0;">상담제목</p>
			<p class="date" style="text-align:right; padding-right:40px;">작성일</p>
			<p class="state" style="width: 120px; padding-right: 50px">답변유무</p>
		</div>
	</div>
	
	<div id="mantomanPagingDiv" style="float: left; width: 100%;" align="center"></div>
	
	<div id="mantomanDelete_frame" style="display: none;">
		<div id="mantomanDelete">
			<i class="material-icons" id="mantomanDelete_closeBtn">clear</i>
			문의글을 삭제하시겠습니까?
			<button id="mantomanDelete_okBtn">확인</button>
			<button id="mantomanDelete_cancelBtn">취소</button>
		</div>
	</div>
	
	<div id="deleteMtm_frame">
		<div id="dialog">
			<i class="material-icons" id="dialog_closeBtn"><img src="../image/close.png" width="50" height="50"></i>
			문의글이 삭제되었습니다.
		</div>		
	</div>	
	
</div>
</body>
<input type="hidden" value="1" id="pg">

</html>