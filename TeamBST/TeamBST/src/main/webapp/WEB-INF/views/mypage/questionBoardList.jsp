<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
    <h1>내 질문글 목록</h1>
    <table border="1">
        <tr>
            <th>no</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="post" items="${qBoardList}">
        <tr>
	         <td>${post.quest_id}</td>
	         <td>
	         	<a href="/mypage/qbread?quest_id=${post.quest_id}">${post.quest_sub }</a>
	         </td>
	         <td>${post.quest_writer_id}</td>
	         <td>
	         	<fmt:formatDate type="both" value="${post.quest_cre_date }" pattern="yy/MM/dd HH:mm" />
	         </td>
	         <td><span class="badge bg-blue">${post.quest_view }</span></td>
        </tr>
        </c:forEach>
    </table>
    <a href="/mypage/mypage">마이페이지로 돌아가기</a>
</body>
</html>