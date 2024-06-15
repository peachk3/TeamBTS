<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="../resources/css/index.css" rel="stylesheet">
</head>

<body>
	<nav>
		<a href="/main/main"><h1>개바리조</h1></a>

		<h6>
			<a href="/login/login">로그인/</a> <a href="/mypage/mypage">마이페이지/</a> <a
				href="/admin/admin">관리자페이지/</a> 로그인시간 ( 58: 00 )
		</h6>
	</nav>


	<ul class="nav">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="/ticketing/ticketing">예매</a></li>
		<li class="nav-item"><a class="nav-link"
			href="/community/community">거래</a></li>
		<li class="nav-item"><a class="nav-link"
			href="/announcement/announcement">고객센터</a></li>
	</ul>

	<hr>

	<button type="button" class="community"
		onclick="location.href='/announcement/announcement'">공지사항</button>
	<br>
	<button type="button" class="community"
		onclick="location.href='/announcement/bulletin'">문의게시판</button>

	<div>
		<input type="text" placeholder="검색어 입력">
		<button>검색</button>
	</div>



	<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th style="width: 10px">BNO</th>
					<th>게시글</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="dto" items="${nBoardList}">
					<tr>
						<td>${dto.notice_sub}</td>
						<td>${dto.notice_sub}</td>
						<td><fmt:formatDate value="${dto.notice_cre_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${dto.notice_view}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


</body>
</html>