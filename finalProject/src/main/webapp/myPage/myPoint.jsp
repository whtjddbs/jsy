<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>마일리지</title>
    
<style>
    ul{
    	list-style:none;
    	padding-left:0px; 
    	text-decoration:none;
    }
    body, input, select, textarea, button, a {
    	text-decoration:none;
        -webkit-text-size-adjust:none;
        font-family: "campton", "Apple SD Gothic Neo", NanumBarunGothic, "나눔바른고딕", Malgun Gothic, "맑은 고딕", dotum, sans-serif;
    }
</style>
    
<style> 
	a,   button{outline:none}

	/* 상단 여백 */
	.article_right{overflow:hidden;}
	.article_right   .article_right, .cs_wrap   .article_left, .cs_wrap   .article_right{padding-top:0}
	
	@media screen and (max-width:540px){
		.article_right{padding-top:0}
	}
	
 	/* 마일리지현황 관련 style */>
 	.mytit_area{padding-bottom:10px;border-bottom:4px solid #000}
	.mytit_area .tit{font-size:22px;line-height:30px}
	.mytit_area .txt{margin-top:4px;font-size:14px;line-height:26px}
	.my_tit{position:relative;padding-bottom:10px;border-bottom:4px solid #000;font-size:22px;color:#000;line-height:30px;font-weight:500}
	.my_tit{margin: 0px;}
	.my_tit span{font-size:13px;line-height:30px}
	.my_tit.nobor{padding:0;border:0}
	
	/* 적립마일리지 표 관련 style */
	.my_tbl_tit{border-bottom:1px solid #000;font-weight:700}
	.my_tbl_lst .my_tbl_tit .tit,   .my_tbl_lst .my_tbl_tit .type{text-align:center}
	.my_tbl_lst .my_tbl,   .my_tbl_lst>li{border-bottom:1px solid #d4d4d4}
	.my_tbl_lst .btn_bor{position:absolute;top:50%;right:20px;width:43px;height:34px;margin-top:-17px;border-radius:2px;line-height:34px}
	.my_tbl_info{table-layout:fixed;position:relative;box-sizing:border-box;color:#303033}
	.my_tbl_info,   .my_tbl_info .infoinner{display:table;width:100%}
	.my_tbl_info p{display:table-cell;min-height:50px;text-align:center;vertical-align:middle;font-size:14px;box-sizing:border-box}

</style>
	

<style>	
	/* 마일리지 포인트 부분 */	
	.my_tbl_mymileage{border-top:0}
	.my_tbl_mymileage ul {margin: 0px;}
	.my_tbl_mymileage   p{padding:15px 1%;font-size:14px}
	.my_tbl_mymileage   .tit{display:none}
	
	/* 적립 마일리지 탭 */
	.tab2{overflow:hidden;margin-top:30px;border-bottom:4px solid #000;font-size:0}
	.tab2   li{margin:0 -1px -1px 0}
	.tab2   li, .tab2   li   a{display:inline-block}
	.tab2   li   a{padding:0 30px;border:1px solid #d4d4d4;font-size:14px;color:#a0a0a0;line-height:48px}
	.tab2   .selected   a{border-color:#000;background:#000;color:#fff}
	
</style>




</head>
	
<body>   
	<div class="article_right">	<!-- 오른쪽 화면(메인) -->
		<router-outlet></router-outlet>
			<ui-mileage ng-version="4.0.3">
                
				<!-- 마일리지 부분 -->
				<div  class="my_notice">
					<h3  class="my_tit">마일리지 현황</h3>
		    					
					<!-- 마일리지 표 -->
					<ul  class="my_tbl_lst my_tbl_mymileage">
						<li  class="my_tbl_tit">
							<div  class="my_tbl_info">
								<p  class="mileage">현재 마일리지</p>
								<p  class="mileage2">적립 마일리지</p>
								<p  class="mileage3">사용한 마일리지</p>
								<p  class="mileage4">소멸된 마일리지</p>
							</div>
						</li>
						<li >
							<div  class="my_tbl_info">
								<!-- 포인트 정보 가져오기 -->
								<p  class="mileage"><span  class="tit">현재 마일리지</span>0 point</p>
								<p  class="mileage2"><span  class="tit">적립 마일리지</span>0 point</p>
								<p  class="mileage3"><span  class="tit">사용한 마일리지</span>0 point</p>
								<p  class="mileage4"><span  class="tit">소멸된 마일리지</span>0 point</p>
							</div>
						</li>
					</ul>	<!-- class="my_tbl_lst my_tbl_mymileage" -->
					    
					<!-- 마일리지 안내 -->
					<ul  class="my_guide_info">
						<li >201X년 XX월 XX일 소멸 대상 마일리지 : 0 포인트</li>	<!-- 적용날짜 / 포인트 가져와야 함 -->
					    <li >마일리지는 부여된 해로부터 5년 이내에 사용하셔야 합니다.</li>
					    <li >특정 이벤트 당첨 마일리지는 이벤트 기한내에서만 사용이 가능하고 미사용 적립금은 소멸됩니다.</li>
					</ul>
					   
				</div>	<!-- class="my_notice" 마일리지 부분-->
				<br><br><br>


				<section  class="my_mileage2">
					<div >
						<h3  class="my_tit nobor">마일리지 적립 및 사용</h3>
						<p  class="my_tit_dsc">마일리지는 적립 및 사용하신 내역입니다. (주문 마일리지는 주문 내역 조회에서 확인 가능합니다.)</p>
						<div  class="tab2">
							<ul  id="tabMileage">
								<li  class="selected">
									<a >적립 마일리지</a>	<!-- 적립마일리지 뜨게 href 적용 -->
								</li>
							</ul>
						</div>
					
						<div >
							<ui-mileage-lists >
								<ul class="my_tbl_lst my_tbl_mileage">
									<li class="my_tbl_tit">
										<div class="my_tbl_info">
											<p class="mileage">적용일자</p>
											<p class="mileage2">적용내용</p>
											<p class="mileage3">마일리지</p>
											<p class="mileage4">관련주문번호</p>
										</div>
									</li>
									    
									<li>
										<div class="my_tbl_info">
											<p>해당 마일리지 내역이 없습니다.</p>
									    </div>
									</li> 
								</ul>	<!-- class="my_tbl_lst my_tbl_mileage" -->
							</ui-mileage-lists>
					    </div>
					</div>
					  
					<br><br> 
					 
					<!-- 마일리지 사용기준(수정 필요 시 수정) -->
					<div >
					    <h3  class="my_guide_tit">마일리지 사용기준 및 사용기한</h3>
					    <ul  class="my_guide_info">
					        <li >마일리지는 구매금액 제한 없이 현금처럼 사용하실 수 있습니다.</li>
					        <li >마일리지는 부여된 해로부터 5년 이내에 사용하셔야 합니다.</li>
					        <li >특정 이벤트 당첨 마일리지는 이벤트 기한내에서만 사용이 가능하고 미사용 적립금은 소멸됩니다.</li>
					        <li >마일리지는 부여 된 순서로 사용 되며 해당 기간 내에 사용하지 않으실 경우, 잔여 마일리지는 1년 단위로 매해 12월 31일 자동 소멸 됩니다.</li>
					        <li >주문적립 마일리지는 배송완료일 기준 7일 시점으로 적립 됩니다.</li>
					    </ul>
					</div>
				</section>	<!-- class="my_mileage2" -->
					
				</ui-mileage>
            </div>	<!-- class="article_right" 오른쪽 화면(메인) -->

</body>


<script type="text/javascript">
$(document).ready(function(){
	$('.my_shop > ul:eq(1) > li:eq(2) > a').css('font-weight', '800');
});
</script>
</html>
