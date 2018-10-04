<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../css/myPage.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 메인페이지 죄측메뉴바 -->
<nav class="mypage_left">
	<jsp:include page="myPageNav.jsp"/>
</nav>

<!-- 메인페이지 우측바디 -->
<article class="mypage_right">
	<section _myPage class="my_grade">
    <ul _myPage>
        <li _myPage>
            <a _myPage href="/finalProject/myPage/grade.do">
                <span _myPage>회원등급</span>
                <em _myPage>
	                <!-- 0: green 1: yellow 2: orange 3: red 4: vip -->
	                <c:if test="${memberDTO.lev == 0 }">GREEN</c:if>
	                <c:if test="${memberDTO.lev == 1 }">YELLOW</c:if>
	                <c:if test="${memberDTO.lev == 2 }">ORANGE</c:if>
	                <c:if test="${memberDTO.lev == 3 }">RED</c:if>
	                <c:if test="${memberDTO.lev == 4 }">VIP</c:if>
                </em>
            </a>
            <a _myPage class="benefit_show" href="#">
              	할인혜택 보기
            </a>
        </li>
        <li _myPage>
            <a _myPage href="/finalProject/myPage/tracking.do">
                <span _myPage>배송중</span>
                <em _myPage>${deliveringCount }</em>
            </a>
        </li>
        <li _myPage>
            <a _myPage href="/finalProject/myPage/myPoint.do">
                <span _myPage>마일리지</span>
                <em _myPage>${memberDTO.point }</em>
            </a>
        </li>
    </ul>
	</section>
	
	<!-- 메인페이지 바디 -->
	<section>
		<jsp:include page="${myPageBody }"/>
	</section>
</article>