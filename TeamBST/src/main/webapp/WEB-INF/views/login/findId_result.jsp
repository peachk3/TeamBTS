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
			<c:when test="${user_name != null }">
				<p> 아이디 : ${user_id }</p>
			</c:when>		
			<c:otherwise>
				<p>해당 이름과 전화번호가 일치하는 회원 아이디를 찾지 못하였습니다.</p>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>