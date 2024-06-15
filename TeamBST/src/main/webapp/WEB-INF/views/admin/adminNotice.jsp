<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>


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
						<td>${dto.notice_sub}</td>
						<td>${dto.admin_id}</td>
						<td><fmt:formatDate value="${dto.notice_cre_date}"
								pattern="yyyy-MM-dd" /></td>
						<td><span class="badge bg-purple">${dto.notice_view}</span></td>
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



















</body>
</html>