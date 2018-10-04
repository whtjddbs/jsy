<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet"/>


</head>
<link rel="stylesheet" href="../css/template.css">
<div class="footer_main">
	<div class="footer_cs_section">
		<h2 class="footer_title">SERVICE CENTER</h2>
		<ul class="footer_cs_section_info">
			<li class="footer_phone">1234-1234</li>
			<li >AM 10:00 ~ PM 05:00</li> 
            <li >Off-time PM 12:00 ~ PM 02:00</li>
            <li >DAY OFF (SATURDAY. SUNDAY, HOLIDAY)</li>
		</ul>
		<a  class="footer_FAQ_Btn" href="">FAQ</a>
		<div class="footer_findStore" style="float:right; margin-right:10px;">
			<img id="footer_findStore_Btn"src="../image/findStore.png" width="50px" height="50px" style="cursor: pointer;">
		</div>
	
		
	</div>
	<div class="footer_half">
		<div class="footer_menu_section">
			<ul class="footer_menu_section_list">
				<li>
					<h2 class="footer_menu_section_list_title">ABOUT US</h2>
					<a  href="">회사소개</a>
                    <a  href="">상시 할인 혜택</a>
				</li>
				<li>
					<h2 class="footer_menu_section_list_title">MY ORDER</h2>
					<a  href="/finalProject/myPage/tracking.do">주문배송</a>
                    <a  href="/finalProject/myPage/modifyList.do">취소/교환/반품 내역</a>
                    <a  href="/finalProject/myPage/myReview.do">상품후기 내역</a>
				</li>
				<li>
					<h2 class="footer_menu_section_list_title">MY ACCOUNT</h2>
					<a  href="/finalProject/member/modifyForm.do">회원정보수정</a>
                    <a  href="">회원등급</a>
                    <a  href="/finalProject/myPage/myPoint.do">마일리지현황</a>
				</li>
				<li>
					<h2 class="footer_menu_section_list_title">HELP</h2>
					<a  href="">1:1 상담내역</a>
                    <a  href="">상품 Q&A내역</a>
                    <a  href="/finalProject/myPage/notice.do">공지사항</a>
                    <a  href="">FAQ</a>
				</li>
			</ul>
		</div>
		<div class="footer_notice_section">
			<h2 style="font-size: 13px; font-weight: 700; color: #303033; line-height: 26px; margin-bottom: 5px;">NOTICE</h2>
			<ul>
				<!-- notice 목록 띄울거야. -->
			</ul>
		</div>
	</div>
	<footer class="footer_info">
		<div class="footer_info_documentation">
			<a href="/finalProject/etc/privacyPolicy.do" style="border-right: 1px solid lightgray; padding-right: 10px;height:18px;">개인정보취급방침</a>
			<a href="/finalProject/etc/termsAndConditions.do" style="padding-left:10px;">이용약관</a>
		</div>
		<div class="footer_info_corp">
			<div>
				<dl  class="footer_info_corp_item">
        			<dt >프로젝트명</dt>
        			<dd >BbanB</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >학원</dt>
        			<dd >서울특별시 종로구 돈화문로 26 단성사</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >팩스</dt>
        			<dd >000-0000-0000</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >사업자등록번호</dt>
        			<dd >111-11-1111</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >프로젝트발표</dt>
        			<dd >2018-단성사307-1011 
        				<a  class="footer_info_corp_Btn" target="_blank">사업자정보확인</a>
        			</dd>
        		</dl>
			</div>
			<div>
				<dl  class="footer_info_corp_item">
        			<dt >고객센터</dt>
        			<dd ><a  href="tel:1234-1234">1234-1234</a></dd>
        			<dd >평일 10:00 ~ 17:00 / Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무)</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >이메일</dt>
        			<dd ><a  href="">BbanB@project.com</a></dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >프로젝트그룹</dt>
        			<dd >6남2녀</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >개인정보책임자</dt>
        			<dd >6남2녀</dd>
        		</dl>
			</div>
		</div>	
	</footer>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$('#footer_findStore_Btn').click(function(){
	//alert("~~");
	window.open('../etc/findStore.jsp','','width=1000 height=700');
});

$(document).ready(function(){
	$.ajax({
		type: 'POST',
		url: '/finalProject/customerService/noticeList.do',
		data : 'pg=${pg}',
		dataType: 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$('.footer_notice_section ul *').remove();
			$.each(data.list, function(index, item){
				if(index >= 5) return true;
				$('.footer_notice_section > ul').append($('<li/>').append($('<a/>',{
					href : '/finalProject/customerService/notice.do',
					style: 'text-decoration: none; font-size: 12px; line-height: 22px; font-weight: 400; color : #303033; max-width: 98%; overflow: hidden; text-overflow: ellipsis;',
					text : item.title
				})));
			});
		}
	});
});
</script>
