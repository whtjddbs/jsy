<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav>
	<jsp:include page="adminNav.jsp"></jsp:include>
</nav>
<article style="margin-left: 250px;">
	<jsp:include page="${adminBody}"></jsp:include>
</article>
</body>
</html>