<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>BULLETIN</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">문의글</li>
				</ol>
			</div>
		</div>
	</div>
</section>
    

        
        
	


<section class="section schedule">
	<div class="container">
      <button type="button" class="btn btn-main-md" onclick="location.href='/TeamBST/admin/adminNotice'">공지사항</button>
      <button type="button" class="btn btn-main-md" onclick="location.href='/TeamBST/admin/adminBulletin'">문의 게시판</button>
      <br>
      <br>
      <br>
	<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>게시글</th>
					<th>닉네임</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="dto" items="${questionList}">
					<tr>
						<td>
				<c:choose>
					<c:when test="${dto.quest_public.equals('Y')}">
			<a href="/TeamBST/admin/adminbulletinContent?quest_id=${dto.quest_id}">	[공개] ${dto.quest_sub } </a>
					</c:when>
					<c:otherwise>
			<a href="/TeamBST/admin/adminbulletinContent?quest_id=${dto.quest_id}">	[비공개] ${dto.quest_sub } </a>
					</c:otherwise>
				</c:choose>						
						
						</td>
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
</div>
</section>



 <div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			
			<c:if test="${pageDTO.prev }">
			<li><a href="/TeamBST/admin/adminBulletin?page=${pageDTO.startPage-1 }">«</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
		
			<li ${pageDTO.cri.page == i? 'class="active"':'' }><a href="/TeamBST/admin/adminBulletin?page=${i }">${i }</a></li>
		
			</c:forEach>
			
			<c:if test="${pageDTO.next && pageDTO.endPage > 0 }">
			<li><a href="/TeamBST/admin/adminBulletin?page=${pageDTO.endPage+1 }">»</a></li>
			</c:if>
		</ul>
	</div> 









<%@ include file="../include/footer.jsp"%>
</body>
</html>