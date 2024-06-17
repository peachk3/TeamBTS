<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
      
      
      <button type="button" class="community" onclick="location.href='/mypage/mypage'">회원정보 조회</button> 
      <br>
      
      <button type="button" class="community" onclick="location.href='/mypage/myticket'">MY 티켓</button> <br>
      <button type="button" class="community" onclick="location.href='/mypage/mywrite'">MY 게시글</button>


      <br>
		
		<table border="1">
			<tr>
				<td>글번호</td>
				<td>작성자</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성일</td>
				<td>구장</td>
				<td>조회수</td>
				<td>상태</td>
			</tr>
			<c:forEach var="post" items="${postBoardList}">
			<tr>
				<td>${post.post_id }</td>
				<td>${post.post_writer_id }</td>
				<td>${post.post_sub }</td>
				<td>${post.post_cont }</td>
				<td>${post.post_cre_date }</td>
				<td>${post.stad_id }</td>
				<td>${post.post_view }</td>
				<td>${post.sale_status }</td>
			</tr>
			</c:forEach>
		
		</table>

	
	<table border="1">
			<tr>
				<td>글번호</td>
				<td>작성자</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:forEach var="post" items="${questionBoardList}">
			<tr>
				<td>${post.quest_id }</td>
				<td>${post.quest_writer_id }</td>
				<td>${post.quest_sub }</td>
				<td>${post.quest_cont }</td>
				<td>${post.quest_cre_date }</td>
				<td>${post.quest_view }</td>
			</tr>
			</c:forEach>
		
		</table>








    
</body>
</html>