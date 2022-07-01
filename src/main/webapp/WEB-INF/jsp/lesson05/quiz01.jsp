<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1JSTL core변수</h1>
	<c:set var="number1" value="36" />
	<c:set var="number2">3</c:set>
	
	<c:set var="average">${(number1+number2)/2}</c:set>
	
	<c:if test="${average >= 10}">
		<h1>${average} h1</h1>
	</c:if>
	
</body>
</html>