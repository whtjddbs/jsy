<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../css/itemView.css">
<title>Insert title here</title>
</head>
<body>
<div class="information">
	<div  class="item_container">
		<div  class="review_section">
			<div  class="dscBx">
				<h2  class="item_tit" style="width:45%; float: left;">상품후기 </h2>
				<div class="productReply">
					<a href="/finalProject/itemView/itemViewReviewForm.do?seq=${param.seq}" style="color: #333;">후기쓰기</a>
				</div>
			</div>
			<p class="review_info_point">후기 작성시 최대 1,500 point를 드립니다</p>
		</div>
	</div>
</div>	

<div class="information">
	<div  class="dscBx">
		<h2  class="item_tit"  style="width:35%; float: left;">상품 Q&amp;A </h2>
		<div  class="askInfo" >
		    <ul class="QNA" >
		        <li >
		            <a  href="" class="active">ALL</a>
		        </li>
		        <li >
		            <a  href="">상품문의 </a>
		        </li>
		        <li >
		            <a  href="">재입고문의 </a>
		        </li>
		        <li >
		            <a  href="">사이즈문의 </a>
		        </li>
		        <li >
		            <a  href="">배송문의 </a>
		        </li>
		        <li >
		            <a  href="">기타 </a>
		        </li>
		    </ul>
		</div>
		<div class="productReply" id="QnAWrite">
			<a style="cursor:pointer;" >Q&amp;A쓰기</a>
		</div>
	</div>
</div>
<div class="itemViewQnA" style="position: relative; padding: 24px 30px 30px; background: #f5f5f5;">
	<ul style="list-style: none;">
		<li style="display: table; width: 80%; table-layout: fixed;">
			<div style="width: 80px; display: table-cell;">
				<label style="display: inline-block; font-size: 14px; color: #303033; line-height: 40px;">아이디</label>
			</div>
			<div style="display: table-cell;">
				<div style="height: 40px; padding: 0 14px; font-size: 14px; color: #303033; line-height: 40px;">${memberDTO.id}</div>
			</div>
		</li>
		<li style="margin-top: 10px; display: table; width: 80%; table-layout: fixed;">
			<div style="width: 80px; display: table-cell;">
				<label style="display: inline-block; font-size: 14px; color: #303033; line-height: 40px;">이메일 주소</label>
			</div>
			<div style="display: table-cell;">
				<div style="display: inline-block; width: 260px; background: #fff;">
					<input type="text" style="width: 100%; height: 40px; padding: 0 14px; font-size: 15px; color: #1a1a1a; border: 0; outline: none;">${memberDTO.email}
				</div>
				<span style="display: inline-block; margin: 9px 0 -9px 8px; color: #5d5d5d;">
					<input type="checkbox">
					<label style="display: inline-block; position: relative; cursor: pointer;">답변메일받기</label>
				</span>
			</div>
		</li>
		<li style="margin-top: 10px; display: table; width: 100%; table-layout: fixed;">
			<div style="width: 80px; display: table-cell;">
				<label style="display: inline-block; font-size: 14px; font-weight: 400; color: #303033;">문의내용</label>
			</div>
			<div style="display: table-cell;">
				<span style="width: 245px; height: 35px; background: #fff; display: inline-block; position: relative; height: 40px; padding: 9px 0 0 14px; border: 1px solid #d4d4d4;">
					<select style="display: block; width: 100%; height: 100%; margin: -4px 0 0; padding: 0; border : 0 none; background: #fff; font-size: 14px; line-height: 30px; outline: none;">
						<option>상품문의</option>
						<option>재입고문의</option>
						<option>사이즈문의</option>
						<option>배송문의</option>
						<option>기타</option>
					</select>
				</span>
				<div style="margin-top: 10px; border: 1px solid #d4d4d4; backtround: #fff;">
					<textarea placeholder="질문은 최대 5자 이상 입력해 주세요." rows="5" value="문의내용 작성" style="background: #fff; width: 100%; padding: 0; font-size: 13px; line-height: 24px;"></textarea>
				</div>
			</div>
		</li>
	</ul>
	<div style="margin-top: 10px; text-align: right;">
		<button style="background: #fff; border: 1px solid #d4d4d4; font-weight: 700; font-size: 13px; width: 82px; height: 40px; vertical-align: bottom; line-height: 40px;">닫기</button>
		<button style="background: #303033; font-size: 13px; line-height: 40px;  font-weight: 700; color: #fff; width: 82px; height: 40px; vertical-align: bottom;">등록</button>
	</div>
</div>
<div class="informaion">
    <section>
        <div >
            <div  class="delInfo" style="margin-top:20px;">
                <h2 style="margin-bottom:20px;">배송정보</h2>
            </div>
            <ul style="margin-top:20px;">
                <li >Delivery 브랜드 업체발송은 상품설명에 별도로 기입된 브랜드 알림 배송공지 기준으로 출고되고 브랜드마다 개별 배송비가 부여됩니다.</li>
                <li >Delivery 29CM 자체발송은 오후 3시까지 결제확인된 주문은 당일 출고되고 5만원 이상 주문은 무료배송, 5만원 미만은 3,000원의 배송비가 추가됩니다.</li>
                <li >SPECIAL ORDER, PT 등 예약주문은 상세설명의 출고일정을 확인하시기 바랍니다.</li>
                <li >구두, 액세서리, 침구, 액자, 가구 등 상품설명의 제작기간을 숙지해주시기 바랍니다.</li>
                <li >가구 및 일부 상품, 제주도를 포함한 도서산간 지역은 추가배송비 입금요청이 있을 수 있습니다.</li>
            </ul>
            <div  class="asInfo" style="margin-top:20px;">
                <h2 style="margin-bottom:20px;">교환, 환불, A/S 안내</h2>
            </div>
            <ul  class="dsc_lst" style="margin-top:20px;">
                <li >상품 수령일로부터 7일 이내 반품 / 환불 가능합니다.</li>
                <li >변심 반품의 경우 왕복배송비를 차감한 금액이 환불되며, 제품 및 포장 상태가 재판매 가능하여야 합니다.</li>
                <li >상품 불량인 경우는 배송비를 포함한 전액이 환불됩니다.</li>
                <li >출고 이후 환불요청 시 상품 회수 후 처리됩니다.</li>
                <li >얼리 등 주문제작상품 / 카메라 / 밀봉포장상품 등은 변심에 따른 반품 / 환불이 불가합니다.</li>
                <li >일부 완제품으로 수입된 상품의 경우 A/S가 불가합니다.</li>
                <li >특정브랜드의 상품설명에 별도로 기입된 교환 / 환불 / AS 기준이 우선합니다.</li>
                <li >구매자가 미성년자인 경우에는 상품 구입 시 법정대리인이 동의하지 아니하면 미성년자 본인 또는 법정대리인이 구매취소 할 수 있습니다.  </li>
            </ul>
        </div>
    </section>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$('.productReply').hide();
	if('${memberDTO}'!= ""){
		$('.productReply').show();
	}
	
	
		
		$('.itemViewQnA').hide();
	$('.productReply').click(function(){
		$('.itemViewQnA').show();
	});
	

});
</script>
</body>
</html>