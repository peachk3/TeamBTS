<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


      <button type="button" class="community" onclick="location.href='/admin/adminNotice'">공지사항</button> <br>
      <button type="button" class="community" onclick="location.href='/admin/adminBulletin'">문의 게시판</button> <br>
    

        
        
	



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
				<c:forEach var="dto" items="${questionList}">
					<tr>
						<td>${dto.quest_sub}</td>
						<td>
				<c:choose>
					<c:when test="${dto.quest_public.equals('Y')}">
			<a href="/admin/adminbulletinContent?quest_id=${dto.quest_id}">	[공개] ${dto.quest_sub } </a>
					</c:when>
					<c:otherwise>
			<a href="/admin/adminbulletinContent?quest_id=${dto.quest_id}">	[비공개] ${dto.quest_sub } </a>
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

	<br>



 <div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			
			<c:if test="${pageDTO.prev }">
			<li><a href="/admin/adminBulletin?page=${pageDTO.startPage-1 }">«</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
		
			<li ${pageDTO.cri.page == i? 'class="active"':'' }><a href="/admin/adminBulletin?page=${i }">${i }</a></li>
		
			</c:forEach>
			
			<c:if test="${pageDTO.next && pageDTO.endPage > 0 }">
			<li><a href="/admin/adminBulletin?page=${pageDTO.endPage+1 }">»</a></li>
			</c:if>
		</ul>
	</div> 









<%@ include file="../include/footer.jsp"%>
</body>
</html>