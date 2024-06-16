<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
      
      
      <button type="button" class="community" onclick="location.href='/mypage/mypage'">회원정보 조회</button> 
      <button type="button" class="community" onclick="location.href='/mypage/myticket?state=will'">예정 경기</button>
      <button type="button" class="community" onclick="location.href='/mypage/myticket?state=previous'">지난 경기</button> <br>
      <br>
      
      <button type="button" class="community" onclick="location.href='/mypage/myticket'">MY 티켓</button> <br>
      <button type="button" class="community" onclick="location.href='/mypage/mywrite'">MY 게시글</button>


      <br>

<c:choose>
    <c:when test="${not empty pBoardList}">
		<table border="1">
			<tr>
				<th>no</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="post" items="${pBoardList}">
				<tr>
					<td>${post.post_id}</td>
					<td><a href="/mypage/pbread?post_id=${post.post_id}">${post.post_sub }</a>
					</td>
					<td>${post.post_writer_id}</td>
					<td><fmt:formatDate type="both" value="${post.post_cre_date }" pattern="yy/MM/dd HH:mm" /></td>
					<td><span class="badge bg-blue">${post.post_view }</span></td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
    <c:when test="${not empty qBoardList}">
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
					<td><a href="/mypage/qbread?quest_id=${post.quest_id}">${post.quest_sub }</a>
					</td>
					<td>${post.quest_writer_id}</td>
					<td><fmt:formatDate type="both" value="${post.quest_cre_date }" pattern="yy/MM/dd HH:mm" /></td>
					<td><span class="badge bg-blue">${post.quest_view }</span></td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
</c:choose>
    
    
</body>
</html>