<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
.button {background-color: white; border: 1px solid #d4d4d4; color: black; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 10px; margin: 4px 2px; cursor: pointer;}
.checkBtn {background-color: black; border: none; color: white; padding: 28px 38%; text-align: center; text-decoration: none; display: inline-block; font-size: 20px; margin: 4px 2px; cursor: pointer;}
#floatMenu {
	position: absolute;
	width: 200px;
	height: 200px;
	left: 55%;
	top: 11%;
	background-color: white;
	color: black;
}
</style>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var floatPosition = parseInt($("#floatMenu").css('top'));
	
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
});
</script>
<link rel="stylesheet" type="text/css" href="../css/order/css">
</head>
<body>
<div align="center">
<h3>
<span>01 shoppingBag</span> >
<span>02 order</span> >
<span>03 order confirmed</span>
</h3>
</div>

<!-- 왼쪽 div -->
<div style="width:50%; float:left; margin-left: 50px; margin-right:50px;">
<p>
*표시는 필수입력 항목
</p>
<div align="center" style="width:100%; border: 2px solid;"></div>
<h3>주문자 정보</h3>
<div align="center" style="width:100%; border: 1px solid;"></div>
<table>
<tr>	
	<td width="180px">* 보내는 사람</td>
	<td><input type="text" size="60">
</tr>
<tr>	
	<td width="180px">* 연락처</td>
	<td>
		<input type="text" size="4"> -
		<input type="text" size="4"> -
		<input type="text" size="4">
	</td>
</tr>
<tr>
	<td width="180px">* 이메일</td>
	<td><input type="text" size="60"><br>
	<span style="font-size:9pt;">SNS 및 이메일로 주문 진행상황을 안내해드립니다</span>
	</td>
</tr>
</table>
<br><br>
<div>
	<button class="button">기본배송지</button>
	<button class="button">새로운배송지</button>
</div>
<div style="width:100%; border:1px solid;"></div>
<table>
<tr>
	<td width="180px">이전 배송지</td>
	<td>
	<button class="button">배송목록에서 선택</button>
	</td>
</tr>
<tr>
	<td width="180px">* 받는 사람</td>
	<td><input type="text" size="60"></td>
</tr>
<tr>
	<td width="180px">* 연락처</td>
	<td>
	<input type="text" size="4"> - 
	<input type="text" size="4"> -
	<input type="text" size="4">
	</td>
</tr>
<tr>
	<td width="180px">추가번호(선택)</td>
	<td>
	<input type="text" size="4"> - 
	<input type="text" size="4"> -
	<input type="text" size="4">
	</td>
</tr>
<tr>
	<td width="180px" valign="top">* 배송주소</td>
	<td>
	<input type="text" size="30"> <button class="button">주소찾기</button><br>
	<input type="text" size="60">
	<input type="text" size="60" placeholder="상세주소 입력"><br>
	<input type="checkbox"> 상세주소 입력하지 않음<br>
	<input type="checkbox"> 기본배송지로 설정(회원정보 주소가 수정됩니다.)
	</td>
</tr>
<tr>
	<td width="180px" valign="top">배송요청사항 선택</td>
	<td>
	<input type="radio"> 부재 시 경비실에 맡겨 주세요.<br>
	<input type="radio"> 부재 시 전화 또는 문자 주세요.<br>
	<input type="radio"> 택배함에 넣어 주세요.<br>
	<input type="radio"> 직접 입력<br>
	<input type="text" size="60">
	<br><br>
	<span>- 도서산간 지역의 경우 추후 수령 시 추가 배송비가 발생할 수 있으며, 해외배송은 불가합니다.</span><br>
	<span style="color:red">
	- 배송지 불분명 및 수신불가 연락처 기입으로 반송되는 왕복 택배 비용은 구매자 부담으로 정확한 주소 및 통화 가능한 연락처 필수 기입.<br>
	- 대리 주문으로 해외 주소로 발송 전, 주문품 꼭 확인해주세요. 오배송 및 불량 교환에 따른 배송비는 국내 택배 비용만 지원됩니다.</span>
	</td>
</tr>
</table>
<br><br>
<div style="width:100%; border: 2px solid;"></div>
<h3>쿠폰 / 마일리지 사용</h3>
<div style="width:100%; border: 1px solid;"></div>
<table>
<tr>
	<td width="180px">보너스 쿠폰</td>
	<td>
	<select style="width:500px;">
	<option selected>보너스 쿠폰 선택(1개)</option>	
	<option>Green쿠폰(10%)</option>
	</td>
	</select>
</tr>
<tr>
	<td width="180px">브랜드 쿠폰</td>
	<td>
	<select style="width:500px;">
	<option selected>적용 가능한 쿠폰이 없습니다</option>	
	</td>
	</select>
</tr>
<tr>
<td colspan="2">
	<span style="color:red">
	- 할인쿠폰 제외 상품이 포함되어 있는 경우, 해당 제품을 제외하고 할인이 적용됩니다.<br>
	</span>
	<span>
	- 브랜드쿠폰과 보너스쿠폰은 중복사용이 불가능합니다.<br>
	- 일부 상품(할인쿠폰제외상품)에는 보너스쿠폰이 적용되지 않습니다.
	</span>
</td>
</tr>
</table>
<br><br>
<div style="width:100%; border: 2px solid;"></div>
<h3>결제방법 선택</h3>
<div style="width:100%; border: 1px solid;"></div>
<br><br>
<table>
	<tr>
		<td>
			<button class="button">신용/체크카드</button>
			<button class="button">현대카드</button>
			<button class="button">실시간계좌이체</button>
			<button class="button">무통잡입금(가상계좌)</button>
			<button class="button">휴대폰결제</button>
			<button class="button">카카오페이</button>
			<button class="button">네이버페이</button>
			<button class="button">페이코</button>
		</td>
	</tr>
	<tr>
		<td>
			<span>
			MAC 환경에서도 신용카드 결제가 가능합니다.(ISP 결제 제외)<br><br>
			국내 모든 카드 사용이 가능하며 해외에서 발행된 카드는 이용하실수 없습니다. (해외배송은 불가능합니다)
			금요일 오후 6시~ 일요일 주문은 결제 완료 후 취소 요청시 고객센터 > 주문취소를 이용하시면 됩니다.
			</span><br><br><br>
		</td>
	</tr>
	
	<tr>
		<td>
			<button class="button">공인인증서안내</button>
			<button class="button">안심클릭 의무사용</button>
		</td>
	</tr>
</table>
</div>

<!-- 오른쪽 div -->
<div id="floatMenu" style="width:40%; height:600px; border:3px solid black; float:left;">
<h3>주문상품 확인 / 총 1개</h3>
<div style="width:100%; border: 1px solid;"></div>
<table>
	<tr>
		<td width="200px">
			<img src="../image/shoes.png" width="180" height="180" style="margin-top: 30px;
			 margin-left: 10px;"> 
		</td>
		<td style="margin-top: 20px;">
			<span>바스</span><br>
			<strong>[코리안핏]바스 여성 페니로퍼-블랙(BA4172O-OOO)</strong><br><br>
			<span style="font-size:9pt;">옵션:[사이즈]BA41710K-OOO_235</span><br><br>
			<span style="color:red; font-size:11pt;">[20%]90,400원 /1
		</td>
	</tr>
</table>
<div style="width:100%; border: 1px solid;"></div>
<table align="center" style="width:90%;">
	<tr>
		<td align="left" style="margin-left: 10px;"> 총상품금액</td>
		<td align="right">90,400원 </td>
	</tr>
	<tr>
		<td align="left" style="margin-left: 10px;"> 배송비</td>
		<td align="right">0원 </td>
	</tr>
	<tr>
		<td align="left" style="margin-left: 10px;"> 마일리지 사용</td>
		<td align="right">0원</td>
	</tr>
	<tr>
		<td align="left" style="margin-left: 10px;"> 쿠폰 사용</td>
		<td align="right">0원 </td>
	</tr>
	<tr>
		<td align="left" style="margin-left: 10px;"> 총 결제금액</td>
		<td align="right">90,400원 </td>
	</tr>
	<tr>
		<td colspan="2">
		<span><br><br></span>
		<input type="checkbox">주문하실 상품 및 결제, 주문정보 확인하였으며, 이에 동의합니다. (필수)
		</td>
	</tr>
	<tr >
		<td colspan="2" align="center" style="margin-left: 20px;">
			<button class="checkBtn">CHECK OUT</button>
		</td>
	</tr>
</table>
</div>
</body>
</html>