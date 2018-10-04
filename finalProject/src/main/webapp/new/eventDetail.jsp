<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Maven+Pro" rel="stylesheet">
<style type="text/css">
.event_title{
	text-align: center;
}

.container {
    width: 1200px !important;
    min-width: 1200px !important;
}

.media-view {
    overflow: hidden;
    margin-bottom: 200px;
}

.article {
    margin-bottom: 20px;
}

.header {
    position: relative;
    border-top: 2px solid #333;
    border-bottom: 1px solid #333;
}

.header h3 {
    padding-top: 14px;
    padding-bottom: 14px;
    margin-top: 0;
    margin-bottom: 0;
    margin-left: 40px;
    margin-right: 150px;
    font-size: 13px;
    font-weight: bold;
    line-height: 20px;
    font-family: 'Noto Sans', sans-serif;
    font-size : 20px;
}

.header p {
    position: absolute;
    top: 0;
    right: 40px;
    height: 48px;
    padding-top: 14px;
    padding-bottom: 14px;
    color: #333;
    font-family: 'Maven Pro', sans-serif;
    font-size : 20px;
}

.details {
    border-bottom: 1px solid #ccc;
    padding: 40px;
}

.details > div {
    font-size: 13px;
    line-height: 22px;
}

.img{
	max-width : 100%;
	vertical-align : middle;
	border : 0;
}

.media-view .btn-list {
    float: right;
    width: 90px;
    height: 40px;
    background-color: #000;
    color: #fff;
    font-size: 13px;
    line-height: 28px;
}

.btn {
    border-radius: 0;
    border: 0;
}
.eventEndDiv {
	position: absolute;
    font-size: 20pt;
    font-weight: bold;
    color: white;
    top: 0px;
    left: 0px;
    width: 270px;
    height: 350px;
    padding: 150px 0px 0px 45px;
    background-color: rgba(0,0,0,0.8);
}
</style>
</head>
<body>
<div class="event_title">
	<input type="hidden" name="pg" id="pg" value="1">
	<h3 style="margin-bottom:30px;">EVENT</h3>
</div>

<!-- 현재 날짜 -->
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value='${toDay}' pattern='yyyyMMdd' var="nowDate"/>

<c:if test="${not empty eventDTO}">
<div class="container">
	<div class="media-view">
		<div class="article">
			<div class="header">
				<h3>${eventDTO.title}</h3>
				<p><fmt:formatDate value="${eventDTO.starttime}" pattern="YYYY-MM-dd"/>
				~ <fmt:formatDate value="${eventDTO.endtime}" pattern="YYYY-MM-dd"/></p>
			</div>
			
			<div class="details">
				<div>
					<div>
						<c:if test="${eventDTO.endtime < toDay}">
							<div align="center" style="font-size: 20pt; font-weight: bold;">종료된 이벤트입니다.</div>
						</c:if>
						<c:if test="${eventDTO.endtime > toDay}">
							<img src="../image/event/${eventDTO.detail_img}" class="img">
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<a class="btn btn-default btn-list" onclick="history.back()">목록</a>
	</div>
</div>
</c:if>


</body>
</html>