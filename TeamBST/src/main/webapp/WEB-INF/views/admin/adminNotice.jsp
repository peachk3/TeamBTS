<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>NOTICE</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">공지사항</li>
				</ol>
			</div>
		</div>
	</div>
</section>

<section class="section schedule">
	<div class="container">
<button type="button" class="btn btn-main-md"
		onclick="location.href='/admin/adminNotice'">공지사항</button>
	<button type="button" class="btn btn-main-md"
		onclick="location.href='/admin/adminBulletin'">문의 게시판</button>
		<br>
		<br>
		<br>
	<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>TILE</th>
					<th>WRITER</th>
					<th>REGDATE</th>
					<th style="width: 40px">VIEWCNT</th>
				</tr>
				<c:forEach var="dto" items="${nBoardList}">
					<tr>
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
	<button class="btn btn-main-md" onclick="location.href='/admin/adminNoticeWrite'">글쓰기</button>
	</div>
	</div>
</section>







<!-- 페이지네이션 버튼  -->
						<nav class="d-flex justify-content-center">
						  <ul class="pagination">
						    <!-- 이전 페이지로 이동하는 링크 -->
						    <c:if test="${pageDTO.prev}">
						      <li class="page-item">
						        <a class="page-link" href="/admin/adminNotice?page=${pageDTO.startPage-1}" aria-label="prev">
						          <span aria-hidden="true"><i class="fa fa-angle-left"></i></span>
						          <span class="sr-only">prev</span>
						        </a>
						      </li>
						    </c:if>
						    
						    <!-- 페이지 번호를 나열하는 반복문 -->
						    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
						      <li class="page-item ${pageDTO.cri.page == i ? 'active' : ''}">
						        <a class="page-link" href="/admin/adminNotice?page=${i}">${i}</a>
						      </li>
						    </c:forEach>
						    
						    <!-- 다음 페이지로 이동하는 링크 -->
						    <c:if test="${pageDTO.next && pageDTO.endPage > 0}">
						      <li class="page-item">
						        <a class="page-link" href="/admin/adminNotice?page=${pageDTO.endPage+1}" aria-label="Next">
						          <span aria-hidden="true"><i class="fa fa-angle-right"></i></span>
						          <span class="sr-only">Next</span>
						        </a>
						      </li>
						    </c:if>
						  </ul>
						</nav>
						<!-- 페이지네이션 버튼 끝 -->















<%@ include file="../include/footer.jsp"%>
</body>
</html>