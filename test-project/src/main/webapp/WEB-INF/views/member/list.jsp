<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp"%>
<%@include file="../include/jstl.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<ul>
	<c:forEach items="${list}" var="item">
		<li>${item.USERNAME}</li>
		<li>${item.ROLE}</li>
	</c:forEach>
	</ul>
</div>
</body>
</html>