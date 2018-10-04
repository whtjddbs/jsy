<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../css/paging.css">
<link rel="stylesheet" href="../css/tracking.css">


<section class="tracking">
	<h3>주문배송조회</h3>
	<div>
		<table class="tracking_table">
			<thead>
				<tr>
					<td width="70%">상품정보</td>
					<td width="10%">배송비</td>
					<td width="20%">진행상태</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="3" align="center" height="100px">
							<div style="text-align:center;">최근 주문내역이 없습니다</div>
						</td>
					</tr>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach var="data" items="${list }">
						<tr>
							<td colspan="3">
								<div class="stepbox">
									주문일자 <span>${data.logtime }</span> 주문번호 <span>${data.serial }</span>
								</div>
								<div class="items">
									
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div class="paging">${paging.pagingHTML }</div>
	</div>
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
        <!-- <li class="dark">
            <div class="rect">
                <span>배송 시작</span>
                <ruler-svg-icon-next height="100%" stroke="#000" strokewidth="3px" width="100%"><svg viewBox="0 0 42 80" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 100%;">
    <path d="M1 0l40 40.083L1.166 80" style="fill: none; fill-rule: evenodd; stroke: rgb(0, 0, 0); stroke-width: 3px;"></path>
</svg>
</ruler-svg-icon-next>
            </div>
            <p class="txt">상품준비가 완료되어<br>곧 배송 될 예정입니다</p>
        </li> -->
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
	
	//배송조회 상세보기
	$('.tracking_table').on('click','.item_1',function(){
		var serial = $(this).parent().parent().prev().children().last().text();
		var logtime = $(this).parent().parent().prev().children().eq(0).text();
		location.href = '/finalProject/myPage/trackingDetail.do?serial='+serial+"&logtime="+logtime;
	});
	
	//주문번호에 해당하는 아이템 로딩
	$('.stepbox').each(function(index){
		var items = $(this).next();
		$.ajax({
			type : 'POST',
			url : '/finalProject/myPage/getSerialMapper.do',
			data : {'serial' : $(this).find('span:eq(1)').text() },
			dataType : 'json',
			success : function(data) {
				$.each(data.list, function(index, item){
					items.append($('<div/>',{
						class : 'item'
					}).append($('<div/>',{
						class : 'item_1'
					}).append($('<div/>',{
						class : 'item_image'
					}).append($('<img/>',{
						src : '../image/'+item.MAIN_CODENAME+'/'+item.IMG
					})).append($('<div/>',{
						class : 'item_info'
					}).append($('<div/>',{
						class : 'item_name',
						text : item.NAME
					})).append($('<div/>',{
						class : 'item_size',
						text : '[Size] '+item.SIZE1+ (item.SIZE2==null ? '' : item.SIZE2)
					})).append($('<div/>',{
						class : 'item_count',
						text : item.PRICE+"원 / 수량 "+item.COUNT+"개"
					}))))).append($('<div/>',{
						class : 'item_2',
						text : '무료배송'
					})).append($('<div/>',{
						class : 'item_3',
					}).append($('<strong/>',{
						text : item.STATUS
					})).append($('<br/>')).append($('<span/>',{
						text : item.PARCEL
					})).append($('<a/>',{
						class : 'searchDelivery',
						href : 'javascript:void(0)',
						text : item.PARCEL_CODE
					}))));
				});
			}
		});
	});
	
	//페이지 클릭
	$('.paging').on('click','span',function(){
		var pg = $(this).prop('class');
		location.href = '/finalProject/myPage/tracking.do?pg='+pg;
	});
	
	$(document).on('click','.searchDelivery', function(){
		window.open('https://service.epost.go.kr/trace.RetrieveDomRigiTraceList.comm?sid1='+$(this).text()+'&displayHeader=N'
				,"","width=730 height=800 scrollbars=yes");
	});
		
});
</script>