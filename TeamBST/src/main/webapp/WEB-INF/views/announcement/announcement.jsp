<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>


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
						<td><a href="/announcement/announcementContent?notice_id=${dto.notice_id }">[공지]${dto.notice_sub}</a></td>
						<td><fmt:formatDate value="${dto.notice_cre_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${dto.notice_view}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



<div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			
			<c:if test="${pageDTO.prev }">
			<li><a href="/announcement/announcement?page=${pageDTO.startPage-1 }">«</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
		
			<li ${pageDTO.cri.page == i? 'class="active"':'' }><a href="/announcement/announcement?page=${i }">${i }</a></li>
		
			</c:forEach>
			
			<c:if test="${pageDTO.next && pageDTO.endPage > 0 }">
			<li><a href="/announcement/announcement?page=${pageDTO.endPage+1 }">»</a></li>
			</c:if>
		</ul>
	</div>






</body>
</html>