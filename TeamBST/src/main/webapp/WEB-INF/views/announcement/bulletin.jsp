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
				<c:forEach var="dto" items="${qBoardList}">
					<tr>
						<td>${dto.quest_sub}</td>
						<td>
				<c:choose>
					<c:when test="${dto.quest_public.equals('Y')}">
			<a href="/announcement/bulletinContent?quest_id=${dto.quest_id}">	[공개] ${dto.quest_sub } </a>
					</c:when>
					<c:otherwise>
			<a href="/announcement/bulletinContent?quest_id=${dto.quest_id}">	[비공개] ${dto.quest_sub } </a>
					</c:otherwise>
				</c:choose>						
						
						<c:forEach var="dto2" items="${dto.userList}">
							<td>${dto2.user_nick}</td>
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


 <div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			
			<c:if test="${pageDTO.prev }">
			<li><a href="/announcement/bulletin?page=${pageDTO.startPage-1 }">«</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
		
			<li ${pageDTO.cri.page == i? 'class="active"':'' }><a href="/announcement/bulletin?page=${i }">${i }</a></li>
		
			</c:forEach>
			
			<c:if test="${pageDTO.next && pageDTO.endPage > 0 }">
			<li><a href="/announcement/bulletin?page=${pageDTO.endPage+1 }">»</a></li>
			</c:if>
		</ul>
	</div> 

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




</body>
</html>
