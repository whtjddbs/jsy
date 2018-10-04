<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<div>
	<div _myPage class="my_my">
		<h3 _myPage>${memberDTO.name}님</h3>
		<p _myPage>${memberDTO.email}</p>
		<div class="wish">
			<a _myPage href="#">
				<span _myPage class="heartIcon">
					<c:if test="${myHeartCount > 0 }">
						<i class="material-icons" style="color: red; font-size: 16px;">favorite</i>
					</c:if>
					<c:if test="${myHeartCount == 0 }">
						<i class="material-icons" style="color: red; font-size: 16px;">favorite_border</i>
					</c:if>
				</span>
				<span _myPage class="txt" onclick="location.href='/finalProject/myPage/wishList.do'">나의 하트</span>
				<em _myPage>${myHeartCount }</em>
			</a>
		</div>
	</div>
	<div _myPage class="my_shop">
		<h4 _myPage><a href="/finalProject/myPage/myPageIndex.do">나의 쇼핑정보</a></h4>
		<ul _myPage>
			<li _myPage><a _myPage href="/finalProject/myPage/tracking.do">주문배송조회</a></li>
			<li _myPage><a _myPage href="/finalProject/myPage/modifyList.do">취소/교환/반품 내역</a></li>
			<li _myPage><a _myPage href="/finalProject/myPage/myReview.do">상품후기 내역</a></li>
		</ul>
		<h4 _myPage>나의 계정설정</h4>
		<ul _myPage>
			<li _myPage><a _myPage href="/finalProject/member/checkPwd.do">회원정보수정</a></li>
			<li _myPage><a _myPage href="/finalProject/myPage/grade.do">회원등급</a></li>
			<li _myPage><a _myPage href="/finalProject/myPage/myPoint.do">마일리지현황</a></li>
		</ul>
		<h4 _myPage>고객센터</h4>
		<ul _myPage>
			<li _myPage><a _myPage href="#">1:1 문의내역</a></li>
			<li _myPage><a _myPage href="#">상품 Q&A내역</a></li>
			<li _myPage><a _myPage href="/finalProject/customerService/notice.do">공지사항</a></li>
			<li _myPage><a _myPage href="/finalProject/customerService/faq.do">FAQ</a></li>
		</ul>
	</div>
	<div _myPage class="my_call">
		<strong _myPage class="mycs">1588-0000</strong>
		<p _myPage>
			CUSTOMER@BBANV.CO.KR<br>
			AM 10:00~ PM 17:00<br>
			(점심시간 12:00~14:00)<br>
			DAY OFF (토/일/공휴일)
		</p>
		
	</div>
</div>
