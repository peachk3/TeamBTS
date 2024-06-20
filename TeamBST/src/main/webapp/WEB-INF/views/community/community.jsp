<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<form action="#">
		<select name="state" id="state">
			<option value="all">전체 게시글</option>
			<option value="sell">판매중</option>
			<option value="selldone">판매 완료</option>
		</select> <select name="stadium" id="stad">
			<option value="select">구장을 선택하세요</option>
			<option value="gochuck">고척 스카이돔</option>
			<option value="gwangju">광주 챔피언스 필드</option>
			<option value="daegu">대구 라이온즈파크</option>
			<option value="daejun">대전 이글스파크</option>
			<option value="busan">부산 사직야구장</option>
			<option value="seoul">서울 잠실야구장</option>
			<option value="suwon">수원 KT위즈파크</option>
			<option value="incheon">인천 랜더스필드</option>
			<option value="changwon">창원 NC파크</option>
		</select>
	</form>


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
				<c:forEach var="dto" items="${pBoardList}">
					<tr>
						<td>${dto.post_id }</td>
						
						<td>
				<c:choose>
					<c:when test="${dto.sale_status.equals('SALE')}">
						<a href="/community/communityContent?post_id=${dto.post_id }">	[판매중] ${dto.post_sub} </a>
					</c:when>
					<c:otherwise>
						<a href="/community/communityContent?post_id=${dto.post_id }">	[판매완료] ${dto.post_sub} </a>
					</c:otherwise>
				</c:choose>		
						</td>
						
						
						
						<c:forEach var="dto_" items="${dto.userList}">
							<td>${dto_.user_nick}</td>
						</c:forEach>
						<td><fmt:formatDate value="${dto.post_cre_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${dto.post_view }</td>
					</tr>
					
					
				</c:forEach>

			</tbody>
		</table>
	</div>
	<br>


	<button onclick="location.href='/community/communityWrite'">글쓰기</button>





</body>
</html>