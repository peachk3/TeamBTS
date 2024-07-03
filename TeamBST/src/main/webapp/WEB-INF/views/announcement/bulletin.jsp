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

.pagination {
	display: flex;
	padding-left: 0;
	list-style: none;
	border-radius: 0.25rem;
}

.pagination-sm .page-item {
	margin: 0 2px;
}

.pagination-sm .page-item .page-link {
	padding: 0.25rem 0.75rem;
	font-size: 0.875rem;
	line-height: 1.5;
	border-radius: 0.2rem;
	border: 1px solid #dee2e6;
	color: #007bff;
	text-decoration: none;
}

.pagination-sm .page-item .page-link:hover {
	background-color: #e9ecef;
	border-color: #dee2e6;
}

.pagination-sm .page-item.active .page-link {
	z-index: 1;
	color: #fff;
	background-color: #007bff;
	border-color: #007bff;
}

.pagination-sm .page-item.disabled .page-link {
	color: #6c757d;
	pointer-events: none;
	background-color: #fff;
	border-color: #dee2e6;
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
					<li class="breadcrumb-item active">고객센터</li>
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
								<!-- Headings -->
								<ul class="m-0 p-0">
									<li class="headings">
										<div class="post">게시글</div>
										<div class="regdate">등록일</div>
										<div class="cnt">조회수</div>
									</li>
									<!-- Schedule Details -->
									<c:forEach var="dto" items="${qBoardList}">
										<li class="schedule-details">
											<!-- 										<div class="block"> -->
											<div class="post">
												<c:choose>
													<c:when test="${dto.quest_public.equals('Y')}">
														<a
															href="/announcement/bulletinContent?quest_id=${dto.quest_id}">
															[공개] ${dto.quest_sub } </a>
													</c:when>
													<c:otherwise>
														<a
															href="/announcement/bulletinContent?quest_id=${dto.quest_id}">
															[비공개] ${dto.quest_sub } </a>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="regdate">
												<fmt:formatDate value="${dto.quest_cre_date}"
													pattern="yyyy-MM-dd" />
											</div>
											<div class="cnt">${dto.quest_view}</div> <!-- 										</div> -->
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
						        <a class="page-link" href="/announcement/bulletin?page=${pageDTO.startPage-1}" aria-label="prev">
						          <span aria-hidden="true"><i class="fa fa-angle-left"></i></span>
						          <span class="sr-only">prev</span>
						        </a>
						      </li>
						    </c:if>
						    
						    <!-- 페이지 번호를 나열하는 반복문 -->
						    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
						      <li class="page-item ${pageDTO.cri.page == i ? 'active' : ''}">
						        <a class="page-link" href="/announcement/bulletin?page=${i}">${i}</a>
						      </li>
						    </c:forEach>
						    
						    <!-- 다음 페이지로 이동하는 링크 -->
						    <c:if test="${pageDTO.next && pageDTO.endPage > 0}">
						      <li class="page-item">
						        <a class="page-link" href="/announcement/bulletin?page=${pageDTO.endPage+1}" aria-label="Next">
						          <span aria-hidden="true"><i class="fa fa-angle-right"></i></span>
						          <span class="sr-only">Next</span>
						        </a>
						      </li>
						    </c:if>
						  </ul>
						</nav>
						<!-- 페이지네이션 버튼 끝 -->






<script type="text/javascript">
    <%-- alertMessage가 존재할 경우에만 alert 창을 띄움 --%>
    <% if (session.getAttribute("alertMessage") != null) { %>
        alert("<%= session.getAttribute("alertMessage") %>");
    <% 
        // alert를 한 번 띄운 후 session에서 해당 메시지를 삭제
        session.removeAttribute("alertMessage");
       %>
    <% } %>
</script>



								<c:if test="${pageDTO.next && pageDTO.endPage > 0 }">
									<li><a
										href="/announcement/bulletin?page=${pageDTO.endPage+1 }">»</a></li>
								</c:if>
							</ul>
						</div>
						<button class="float-right" onclick="location.href='/announcement/bulletinWrite'">글쓰기</button>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>