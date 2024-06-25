<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<button type="button" class="community"
		onclick="location.href='/admin/adminNotice'">공지사항</button>
	<br>
	<button type="button" class="community"
		onclick="location.href='/admin/adminBulletin'">문의 게시판</button>
	<br>

	<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th style="width: 10px">BNO</th>
					<th>TILE</th>
					<th>WRITER</th>
					<th>REGDATE</th>
					<th style="width: 40px">VIEWCNT</th>
				</tr>
				<c:forEach var="dto" items="${nBoardList}">
					<tr>
						<td>${dto.notice_sub}</td>
						<td><a href="/admin/adminNoticeContent?notice_id=${dto.notice_id }">
						[공지]${dto.notice_sub}</a></td>
						<td>${dto.admin_id}</td>
						<td><fmt:formatDate value="${dto.notice_cre_date}"
								pattern="yyyy-MM-dd" /></td>
						<td><span>${dto.notice_view}</span></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>




	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<button onclick="location.href='/admin/adminNoticeWrite'">글쓰기</button>




 <div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			
			<c:if test="${pageDTO.prev }">
			<li><a href="/admin/adminNotice?page=${pageDTO.startPage-1 }">«</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
		
			<li ${pageDTO.cri.page == i? 'class="active"':'' }><a href="/admin/adminNotice?page=${i }">${i }</a></li>
		
			</c:forEach>
			
			<c:if test="${pageDTO.next && pageDTO.endPage > 0 }">
			<li><a href="/admin/adminNotice?page=${pageDTO.endPage+1 }">»</a></li>
			</c:if>
		</ul>
	</div> 















<%@ include file="../include/footer.jsp"%>
</body>
</html>