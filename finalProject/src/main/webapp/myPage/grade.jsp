<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<style>
.tab2{overflow:hidden;margin-top:40px;border-bottom:4px solid #000;font-size:0}
.tab2   li{margin:0 -1px -1px 0}
.tab2   li, .tab2   li   a{display:inline-block}
.tab2   li   a{padding:0 30px;border:1px solid #d4d4d4;font-size:14px;color:#a0a0a0;line-height:48px;text-decoration: none;}
.tab2   .selected   a{border-color:#000;background:#000;color:#fff}

.my_tbl_tit {border-bottom: 1px solid #000;font-weight: 700;}
.my_tbl_info {table-layout: fixed;position: relative;box-sizing: border-box;color: #303033;}
.my_tbl_info, .my_tbl_info .infoinner {display: table;width: 100%;}
.my_tbl_info p {display: table-cell;min-height: 50px;text-align: center;vertical-align: middle;font-size: 14px;box-sizing: border-box;}
.my_tbl_lst .my_tbl, .my_tbl_lst>li {border-bottom: 1px solid #d4d4d4;}

.my_guide_tit {margin-top: 80px;}
.my_guide_info li {
    position: relative;
    padding-left: 10px;
    font-size: 14px;
    line-height: 32px;
    color: #303033;
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


@media screen and (max-width:540px){
.tab2{margin:17px -20px 0;border:0}
.tab2   ul{display:table}
.tab2   li{display:table-cell}
.tab2   li   a{margin:0 20px;padding:0;font-size:14px;font-weight:700;border:0;background:#fff;color:#d4d4d4;line-height:30px;text-align:center;text-decoration: none;}
.tab2   .selected   a{border-bottom:4px solid #000;background:#fff;color:#000}
}

.my_notice2   .my_guide_tit{margin-top:60px}

@media screen and (max-width:540px){
.my_notice2{padding:0 20px 40px}
.my_notice2   .my_guide_tit{margin-top:43px;padding-bottom:3px;font-size:18px}
}

.my_tbl_mygrade{border-top:0}
.my_tbl_mygrade   p{padding:15px 1%;font-size:14px}
.my_tbl_mygrade   .tit{display:none}

@media screen and (max-width:540px){
.my_tbl_mygrade{margin-top:8px}
.my_tbl_mygrade > li{padding:0;border-bottom:0}
.my_tbl_mygrade > li + li{border-bottom:0}
.my_tbl_mygrade   p{padding:15px 0 14px;font-size:16px;border-bottom:1px solid #d4d4d4}
.my_tbl_mygrade   .tit{display:inline-block;width:90px;font-size:13px}
.my_tbl_lst   .my_tbl{border:0}}
.my_tbl_grade{margin-top:30px;border-top:4px solid #000;word-break:keep-all}
.my_tbl_grade   p{padding:15px 1%;font-size:14px}
.my_tbl_grade   .grade{width:85px;color:#000;font-size:16px;font-weight:700}
.my_tbl_grade   .grade2{width:25%}
.my_tbl_grade   .grade3{width:30%}
.my_tbl_grade   .rowspan{width:55%;padding:15px 2%}
.my_tbl_grade   .tit{display:none}
}

@media screen and (max-width:540px){
	.my_tbl_grade{margin:20px 0 0}
	.my_tbl_grade > li{padding:19px 0 22px}
	.my_tbl_grade   p{padding:10px 0 5px;font-size:15px;font-weight:600}
	.my_tbl_grade   p   span{font-size:12px;font-weight:300}
	.my_tbl_grade   .my_tbl_info{padding:0 0 0 40%}
	.my_tbl_grade   .tit{display:block;margin-bottom:4px;color:#a0a0a0}
	.my_tbl_grade   .grade{position:absolute;top:4px;left:0;width:auto;font-size:28px;color:#000}
	.my_tbl_grade   .grade   .tit{display:none}
	.my_tbl_grade   .grade2, .my_tbl_grade   .grade3, .my_tbl_grade   .rowspan{width:auto}
}
</style>
</head>

<body>
<div>
	<h3  class="my_tit nobor">회원혜택보기</h3>
    <div  class="tab2">
        <ul >
            <li class="selected"><a id="nowGrade" href="javascript:void(0)">회원등급</a></li>
            <li class=""><a id="nextGrade" href="javascript:void(0)">예상회원등급</a></li>
        </ul>
    </div>

    <div  class="my_tbl_lst my_tbl_mygrade">
        <div  class="my_tbl_tit">
            <div  class="my_tbl_info">
                <p  class="grade">회원등급</p>
                <p  class="grade2">구매횟수</p>
                <p  class="grade3">구매금액</p>
                <p  class="grade4">날짜</p>
            </div>
        </div>
        <div  class="my_tbl">
            <div  class="my_tbl_info">
                <p  class="grade"><span  class="tit">회원등급</span>
                	<!-- 0: green 1: yellow 2: orange 3: red 4: vip -->
	                <c:if test="${memberDTO.lev == 0 }">GREEN</c:if>
	                <c:if test="${memberDTO.lev == 1 }">YELLOW</c:if>
	                <c:if test="${memberDTO.lev == 2 }">ORANGE</c:if>
	                <c:if test="${memberDTO.lev == 3 }">RED</c:if>
	                <c:if test="${memberDTO.lev == 4 }">VIP</c:if>
                </p>
                <p  class="grade2"><span  class="tit">구매횟수</span>0회 (1만원 이상)</p>
                <p  class="grade3"><span  class="tit">구매금액</span>0원</p>
                <p  class="grade4"><span  class="tit">날짜</span>2018.4.1 ~ 2018.8.31</p>
            </div>
            <!---->
        </div>
    </div>

    <h3  class="my_guide_tit">회원혜택</h3>
    <ul  class="my_guide_info">
        <li >최근 5개월간의 이용내역을 반영하여 단계가 결정되면 매월 1일 새로운 회원등급이 부여됩니다.</li>
        <li >향후 맴버쉽 단계별 혜택 및 선정기준은 사전동지 후 변경될 수 있습니다.</li>
    </ul>
    <ul  class="my_tbl_lst my_tbl_grade">
        <li  class="my_tbl_tit">
            <div  class="my_tbl_info">
                <p  class="grade">회원단계</p>
                <p  class="grade2">최근5개월간 구매금액</p>
                <p  class="grade3">최근5개월간 1만원 이상 구매횟수</p>
                <p  class="grade4">마일리지 적립율</p>
            </div>
        </li>
        <li  class="">
            <div  class="my_tbl_info">
                <p  class="grade"><span  class="tit">회원단계</span>VIP</p>
                <p  class="grade2"><span  class="tit">최근5개월간 구매금액</span>50만원 이상</p>
                <p  class="grade3"><span  class="tit">최근5개월간 1만원 이상 구매횟수</span>10회 이상</p>
                <p  class="grade4"><span  class="tit">마일리지 적립율</span>마일리지 적립 20%</p>
            </div>
        </li>
        <li >
            <div  class="my_tbl_info">
                <p  class="grade"><span  class="tit">회원단계</span>Red</p>
                <p  class="grade2"><span  class="tit">최근5개월간 구매금액</span>30만원 이상, 50만원 미만</p>
                <p  class="grade3"><span  class="tit">최근5개월간 1만원 이상 구매횟수</span>5회 이상, 10회 미만</p>
                <p  class="grade4"><span  class="tit">마일리지 적립율</span>마일리지 적립 15%</p>
            </div>
        </li>
        <li >
            <div  class="my_tbl_info">
                <p  class="grade"><span  class="tit">회원단계</span>Orange</p>
                <p  class="grade2"><span  class="tit">최근5개월간 구매금액</span>10만원 이상, 30만원 미만</p>
                <p  class="grade3"><span  class="tit">최근5개월간 1만원 이상 구매횟수</span>1회 이상, 5회 미만</p>
                <p  class="grade4"><span  class="tit">마일리지 적립율</span>마일리지 적립 10%</p>
            </div>
        </li>
        <li >
            <div  class="my_tbl_info">
                <p  class="grade"><span  class="tit">회원단계</span>Yellow</p>
                <p  class="rowspan"><span  class="tit">최근5개월간 구매금액</span>5개월 이내 재구매 경험이 없는 고객</p>
                <p  class="grade4"><span  class="tit">마일리지 적립율</span>마일리지 적립 5%</p>
            </div>
        </li>
        <li >
            <div  class="my_tbl_info">
                <p  class="grade"><span  class="tit">회원단계</span>Green</p>
                <p  class="rowspan"><span  class="tit">최근5개월간 구매금액</span>신규가입회원, 구매 경험이 없는 고객</p>
                <p  class="grade4"><span  class="tit">마일리지 적립율</span>마일리지 적립 5%</p>
            </div>
        </li>
    </ul>

    <h3  class="my_guide_tit">멤버쉽 안내</h3>
    <ul  class="my_guide_info">
        <li >구매내역 또는 주문횟수 두가지 중 한가지 조건만 만족하면 해당 단계가 적용됩니다. (출고완료기준)</li>
        <li >실결제액이 1만원 미만의 구매내역은 구매횟수로 계산되는 선정기준에서는 제외됩니다. 단, 할인상품과 일부상품(별도표시)에서는 사용이 불가능합니다.
        </li>
        <li >기준 금액은 주문상품의 합계 금액입니다. (할인판매가나 쿠폰적용가 기준, 배송비제외)</li>
    </ul>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$('.my_shop > ul:eq(1) > li:eq(1) > a').css('font-weight', '800');
	
	//지난 5개월간 거래내역
	var now = new Date();
	var startDate = jsonDateFormat(new Date(now.getYear()+1900, now.getMonth()-5, 1));
	var endDate = jsonDateFormat(new Date(now.getYear()+1900, now.getMonth(), 0));
	var nextStartDate = jsonDateFormat(new Date(now.getYear()+1900, now.getMonth()-4, 1));
	var nextEndDate = jsonDateFormat(new Date(now.getYear()+1900, now.getMonth()+1, 0));
	
	function jsonDateFormat(date) {
		var year = date.getYear()+1900;
		var month = date.getMonth()+1;
		var day = date.getDate();
		return year+(month>9 ? '-':'-0')+month+(day>9 ? '-':'-0')+day;
	}
	
	//최초 호출
	calcGrade(startDate, endDate);
	
	function calcGrade(startDate, endDate) {
		$.ajax({
			type : 'POST',
			url : '/finalProject/myPage/buyListCount.do',
			data : {'id' : '${memberDTO.id}',
					'startDate' : startDate,
					'endDate' : endDate},
			dataType : 'json',
			success : function(data) {
				var count = data.grade.COUNT;
				var sum = data.grade.SUM;
				
				if(count == 0) $('.my_tbl .grade').text('GREEN');
				else if((count >= 1 && count < 5) || (sum >= 100000 && sum < 300000 )) $('.my_tbl .grade').text('ORANGE');
				else if((count >= 5 && count < 10) || (sum >= 300000 && sum < 500000 )) $('.my_tbl .grade').text('RED');
				else if(count >= 10 || sum >= 500000) $('.my_tbl .grade').text('VIP');
				
				$('.my_tbl .grade2').text(count+'회 (1만원 이상)');
				if(count == 0 ) $('.my_tbl .grade3').text('0원');
				else $('.my_tbl .grade3').text(sum+'원');
				$('.my_tbl .grade4').text(startDate+" ~ "+endDate);			
			}
		});
	}
	
	//클릭 이벤트
	$('#nowGrade').click(function(){
		$(this).parent().addClass('selected');
		$('#nextGrade').parent().removeClass('selected');
		calcGrade(startDate, endDate);
	});
	$('#nextGrade').click(function(){
		$(this).parent().addClass('selected');
		$('#nowGrade').parent().removeClass('selected');
		calcGrade(nextStartDate, nextEndDate);
	});
});
</script>
</body>