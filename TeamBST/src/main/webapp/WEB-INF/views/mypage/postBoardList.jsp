<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시글 목록</title>
</head>
<body>

${pBoardList}
    <h1>내 게시글 목록</h1>
    <table border="1">
        <tr>
            <th>게시글 번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="post" items="${pBoardList}">
        <tr>
	         <td>${post.post_id}</td>
	         <td>
	         	<a href="/mypage/postBoardList/read?id=${post.post_id}">${post.post_title }</a>
	         </td>
	         <td>${post.post_writer_id}</td>
	         <td>
	         	<fmt:formatDate type="both" value="${post.post_cre_date }" pattern="yyyy-MM-dd (a)HH:mm:ss" />
	         </td>
	         <td><span class="badge bg-blue">${post.viewcnt }</span></td>
        </tr>
        </c:forEach>
    </table>
    <a href="/mypage/mypage">마이페이지로 돌아가기</a>
</body>
</html>
