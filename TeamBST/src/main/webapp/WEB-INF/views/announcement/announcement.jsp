<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>

<style>
.headings, .schedule-details {
	display: flex;
	justify-content: space-between;
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

.headings {
	font-weight: bold;
	background-color: #f0f0f0;
}

.schedule-details {
	background-color: #fff;
}

.headings div, .schedule-details>div {
	flex: 1;
	text-align: center;
}

.schedule-details>div a {
	color: #007bff;
	text-decoration: none;
}

.schedule-details>div a:hover {
	text-decoration: underline;
}
</style>

<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>ANNOUNCEMENT</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">공지사항</li>
				</ol>
			</div>
		</div>
	</div>
</section>

<body>
	<section class="section schedule">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="schedule-contents bg-schedule">
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active schedule-item" id="nov20">
								<button type="button" class="btn btn-main-md"
									onclick="location.href='/announcement/announcement'">공지사항</button>
								<button type="button" class="btn btn-main-md"
									onclick="location.href='/announcement/bulletin'">문의게시판</button>
									<br>
									<br>
									<br>
								<!-- Headings -->
								<ul class="m-0 p-0">
									<li class="headings">
										<div class="post">게시글</div>
										<div class="regdate">등록일</div>
										<div class="cnt">조회수</div>
									</li>
									<!-- Schedule Details -->
									<c:forEach var="dto" items="${nBoardList}">
										<li class="schedule-details">
											<div class="post">
												<a href="/announcement/announcementContent?notice_id=${dto.notice_id }">[공지]${dto.notice_sub}</a>
											</div>
											<div class="regdate">
												<fmt:formatDate value="${dto.notice_cre_date}"
													pattern="yyyy-MM-dd" />
											</div>
											<div class="cnt">${dto.notice_view}</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						
						<!-- 페이지네이션 버튼  -->
						<nav class="d-flex justify-content-center">
						  <ul class="pagination">
						    <!-- 이전 페이지로 이동하는 링크 -->
						    <c:if test="${pageDTO.prev}">
						      <li class="page-item">
						        <a class="page-link" href="/announcement/announcement?page=${pageDTO.startPage-1}" aria-label="prev">
						          <span aria-hidden="true"><i class="fa fa-angle-left"></i></span>
						          <span class="sr-only">prev</span>
						        </a>
						      </li>
						    </c:if>
						    
						    <!-- 페이지 번호를 나열하는 반복문 -->
						    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
						      <li class="page-item ${pageDTO.cri.page == i ? 'active' : ''}">
						        <a class="page-link" href="/announcement/announcement?page=${i}">${i}</a>
						      </li>
						    </c:forEach>
						    
						    <!-- 다음 페이지로 이동하는 링크 -->
						    <c:if test="${pageDTO.next && pageDTO.endPage > 0}">
						      <li class="page-item">
						        <a class="page-link" href="/announcement/announcement?page=${pageDTO.endPage+1}" aria-label="Next">
						          <span aria-hidden="true"><i class="fa fa-angle-right"></i></span>
						          <span class="sr-only">Next</span>
						        </a>
						      </li>
						    </c:if>
						  </ul>
						</nav>
						<!-- 페이지네이션 버튼 끝 -->

				
<!-- 						<div class="box-footer clearfix"> -->
<!-- 							<ul class="pagination pagination-sm no-margin pull-right"> -->

<%-- 								<c:if test="${pageDTO.prev }"> --%>
<%-- 									<li><a href="/announcement/announcement?page=${pageDTO.startPage-1 }">«</a></li> --%>
<%-- 								</c:if> --%>

<%-- 								<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1"> --%>

<%-- 									<li ${pageDTO.cri.page == i? 'class="active"':'' }><a href="/announcement/announcement?page=${i }">${i }</a></li> --%>

<%-- 								</c:forEach> --%>

<%-- 								<c:if test="${pageDTO.next && pageDTO.endPage > 0 }"> --%>
<%-- 									<li><a href="/announcement/announcement?page=${pageDTO.endPage+1 }">»</a></li> --%>
<%-- 								</c:if> --%>
<!-- 							</ul> -->
<!-- 						</div> -->
						
					</div>
				</div>

			</div>
		</div>
	</section>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>
