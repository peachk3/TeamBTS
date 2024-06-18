<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    

        <button type="button" class="community" onclick="location.href='/announcement/announcement'">공지사항</button> <br>
        <button type="button" class="community" onclick="location.href='/announcement/bulletin'">문의게시판</button>
        
        
	



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
					<th>닉네임</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="dto" items="${qBoaardList}">
					<tr>
						<td>${dto.quest_sub}</td>
						<td><a href="/announcement/bulletinContent?quest_id=${dto.quest_id}">${dto.quest_sub}</a></td>
						<c:forEach var="dto_" items="${dto.userList}">
							<td>${dto_.user_nick}</td>
						</c:forEach>
						<td><fmt:formatDate value="${dto.quest_cre_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${dto.quest_view}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<br>

        <button onclick="location.href='/announcement/bulletinWrite'">글쓰기</button>


</body>
</html>
