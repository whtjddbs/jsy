<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../css/paging.css">
<link rel="stylesheet" href="../css/tracking.css">

<section  class="my_order">
    <h3 >주문배송조회</h3>
    <ul  class="order_lst">
        <li  class="thead">
            <div  class="in_td col1">상품정보</div>
            <div  class="in_td col2">배송비</div>
            <div  class="in_td col3">진행상태</div>
            <div  class="in_td col4">&nbsp;</div>
        </li>
       	<c:if test="${empty list }">
			<div style="text-align:center;">최근 주문내역이 없습니다</div>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="data" items="${list }">
		        <li>
		            <div class="stepbox_tracking">
		                <ul class="order_num">
		                    <li>
		                        <span>주문일자</span> <em >${data.logtime }</em>
		                    </li>
		                    <li>
		                        <span  class="pc_view">주문번호</span>  <em >${data.serial }</em>
		                    </li>
		                    <c:if test="${data.status == '입금대기' || data.status == '결제완료'}">
		                    <li>
		                        <span class="pc_view cancel_span">주문취소
		                        <i class="material-icons" style="font-size:13px;">arrow_forward_ios</i></span>
		                    </li>
		                   </c:if>  
		                </ul>
		                <!-- <ul  class="btnbx">
		                </ul> -->
		            </div>
		            <div class="goods">
		            	<!-- ajax -->
                    </div>
				</li>
  			</c:forEach>
		</c:if>
		</ul>		
				
	<div class="paging">${paging.pagingHTML }</div>
</section>

<section class="pc_view my_process">
    <h3 class="my_tit">주문상태 및 취소기간 안내</h3>
    <div class="my_step">
        <ol class="step">
        <li class="dark">
            <div class="rect">
                <span>입금 대기</span>
                <ruler-svg-icon-next height="100%" stroke="#000" strokewidth="3px" width="100%"><svg viewBox="0 0 42 80" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 100%;">
    <path d="M1 0l40 40.083L1.166 80" style="fill: none; fill-rule: evenodd; stroke: rgb(0, 0, 0); stroke-width: 3px;"></path>
</svg>
</ruler-svg-icon-next>
            </div>
            <p class="txt">입금 전 상태입니다<br>(3일 이내 미입금 시<br>자동취소)</p>
        </li>
        <li class="dark">
            <div class="rect">
                <span>결제 완료</span>
                <ruler-svg-icon-next height="100%" stroke="#000" strokewidth="3px" width="100%"><svg viewBox="0 0 42 80" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 100%;">
    <path d="M1 0l40 40.083L1.166 80" style="fill: none; fill-rule: evenodd; stroke: rgb(0, 0, 0); stroke-width: 3px;"></path>
</svg>
</ruler-svg-icon-next>
            </div>
            <p class="txt">입금(결제) 확인이<br>완료되었습니다</p>
        </li>
        <li class="dark">
            <div class="rect">
                <span>상품 준비중</span>
                <ruler-svg-icon-next height="100%" stroke="#000" strokewidth="3px" width="100%"><svg viewBox="0 0 42 80" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 100%;">
    <path d="M1 0l40 40.083L1.166 80" style="fill: none; fill-rule: evenodd; stroke: rgb(0, 0, 0); stroke-width: 3px;"></path>
</svg>
</ruler-svg-icon-next>
            </div>
            <p class="txt">주문하신 상품을<br>발송할 예정입니다</p>
        </li>
        <li class="dark">
            <div class="rect">
                <span>배송 중</span>
                <ruler-svg-icon-next height="100%" stroke="#000" strokewidth="3px" width="100%"><svg viewBox="0 0 42 80" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 100%;">
    <path d="M1 0l40 40.083L1.166 80" style="fill: none; fill-rule: evenodd; stroke: rgb(0, 0, 0); stroke-width: 3px;"></path>
</svg>
</ruler-svg-icon-next>
            </div>
            <p class="txt">상품이 고객님께<br>배송중입니다</p>
        </li>
        <li class="dark">
            <div class="rect"><span>배송 완료</span></div>
            <p class="txt">상품이 주문자에게<br>전달완료 되었습니다</p>
        </li>
        </ol>
        <p class="info_txt info1"><span class="blind">입금대기, 결제완료 일 경우</span>직접취소가능</p>
        <p class="info_txt info2"><span class="blind">상품준비중, 배송시작, 배송중, 배송완료 일 경우</span>취소불가</p>
    </div>
</section>

<section class="pc_view my_return">
    <div class="mytit_area">
        <h3 class="tit">반품안내</h3>
        <p class="txt">불량 및 파손에 의한 반품을 제외한, 고객 변심에 의한 반품은 출고일로부터 7일 이후(평일기준)에는 불가합니다.<br>상품의 배송구분에 따라 반품방식이 다르니, 이점 유의하시기 바랍니다.</p>
    </div>
    <div class="return_art">
        <h4 class="tit">반품절차</h4>
        <p class="txt">번거로우시겠지만, 직접 반품을 해주셔야 합니다. 가능하시면 상품을 수령한 택배회사를 이용해주세요.<br>업체별 개별기준이 있는 경우, 해당 기준이 우선 적용 됩니다 (해당 상품의 상품페이지 참고)</p>
        <ol class="step_bor">
        <li>
            <div class="inner">
                <strong>반품접수</strong>
                <p>반품신청을 하신 후, 반품하실<br>상품을 받으신 상태로<br>재포장해주세요.</p>
                <ruler-svg-icon-next height="100%" stroke="#000" strokewidth="3px" width="100%"><svg viewBox="0 0 42 80" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 100%;">
    <path d="M1 0l40 40.083L1.166 80" style="fill: none; fill-rule: evenodd; stroke: rgb(0, 0, 0); stroke-width: 3px;"></path>
</svg>
</ruler-svg-icon-next>
            </div>
        </li>
        <li>
            <div class="inner">
                <strong>택배발송</strong>
                <p>해당 택배사로 연락 후 업체로<br>직접 상품을 보내주세요.</p>
                <ruler-svg-icon-next height="100%" stroke="#000" strokewidth="3px" width="100%"><svg viewBox="0 0 42 80" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 100%;">
    <path d="M1 0l40 40.083L1.166 80" style="fill: none; fill-rule: evenodd; stroke: rgb(0, 0, 0); stroke-width: 3px;"></path>
</svg>
</ruler-svg-icon-next>
            </div>
        </li>
        <li>
            <div class="inner">
                <strong>반품진행</strong>
                <p>택배 발송 후 [취소/교환/반품 내역]에<br>보내신 송장번호를 입력해주세요.</p>
                <ruler-svg-icon-next height="100%" stroke="#000" strokewidth="3px" width="100%"><svg viewBox="0 0 42 80" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 100%;">
    <path d="M1 0l40 40.083L1.166 80" style="fill: none; fill-rule: evenodd; stroke: rgb(0, 0, 0); stroke-width: 3px;"></path>
</svg>
</ruler-svg-icon-next>
            </div>
        </li>
        <li>
            <div class="inner">
                <strong>반품완료</strong>
                <p>반품된 상품 확인 후 결제취소<br>또는 환불을 해드립니다.</p>
            </div>
        </li>
        </ol>
    </div>
</section>

<script type="text/javascript">
$(document).ready(function(){
	$('.my_shop > ul:eq(0) > li:eq(0) > a').css('font-weight', '800');
	
	//주문번호에 해당하는 아이템 로딩
	$('.stepbox_tracking').each(function(index){
		var items = $(this).next().first(); 
		$.ajax({
			type : 'POST',
			url : '/finalProject/myPage/getSerialMapper.do',
			data : {'serial' : $(this).children().eq(0).children().eq(1).children().last().text() },
			dataType : 'json',
			success : function(data) {
				$.each(data.list, function(index, item){
					items.append($('<div/>',{
						class : 'goods_inDiv'
					}).append($('<div/>',{
						class : 'goods_row'
					}).append($('<div/>',{
						class : 'in_td col1'
					}).append($('<a/>',{
						class : 'info_bx',
					}).append($('<div/>',{
						class : 'imgbx'
					}).append($('<div/>',{
						class : 'imgin'
					}).append($('<img/>',{
						src : '../image/'+item.MAIN_CODENAME+'/'+item.IMG
					})))).append($('<div/>',{
						class : 'info'
					}).append($('<p/>',{
						class : 'goods_tit',
						text : item.NAME
					})).append($('<ul/>',{
						class : 'option_lst',
					}).append($('<li/>').append($('<span/>',{
						text : '[Size] '+item.SIZE1+item.SIZE2
					})))).append($('<p/>',{
						class : 'goods_price',
					}).append($('<span/>',{
						class : 'num',
						text : item.PRICE+"원 / 수량 "+item.COUNT+"개"
					})))))).append($('<div/>',{
						class : 'in_td col2',
						text : '무료배송'
					})).append($('<div/>',{
						class : 'in_td col3'
					}).append($('<strong/>',{
						class : 'type point',
						text : item.STATUS
					})).append($('<span/>',{
						text : /* item.PARCEL */ '빤브택배'
					})).append($('<a/>',{
						class : 'deliver',
						href : 'javascript:void(0)',
						text : /* item.PARCEL_CODE */ '96764160415'
					})))));
				});
			}
		});
	});
	
	//배송조회 상세보기
	$('.goods').on('click','.info_bx',function(){
		var serial = $(this).parent().parent().parent().parent().prev().children().eq(0).children().eq(1).children().last().text();
		var logtime = $(this).parent().parent().parent().parent().prev().children().eq(0).children().eq(0).children().last().text();
		location.href = '/finalProject/myPage/trackingDetail.do?serial='+serial+"&logtime="+logtime;
	});
	
	//페이지 클릭
	$('.paging').on('click','span',function(){
		var pg = $(this).prop('class');
		location.href = '/finalProject/myPage/tracking.do?pg='+pg;
	});
	
	$(document).on('click','.deliver', function(){
		window.open('https://service.epost.go.kr/trace.RetrieveDomRigiTraceList.comm?sid1='+$(this).text()+'&displayHeader=N'
				,"","width=730 height=800 scrollbars=yes");
	});
	
	//주문취소
	$('.cancel_span').click(function(){
		var cancelSerial = $(this).parent().prev().children().last().text();
		location.href='/finalProject/myPage/trackingCancel.do?serial='+cancelSerial;
	});
		
});
</script>