<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기 결과 페이지</title>
</head>
<body>
	<div class="result-box">
		<c:choose>
			<c:when test="${empty findId }">
				<p class="inquiry">조회 결과가 없습니다.</p>
			</c:when>		
			<c:otherwise>
				<p>${findId.fid}</p>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>