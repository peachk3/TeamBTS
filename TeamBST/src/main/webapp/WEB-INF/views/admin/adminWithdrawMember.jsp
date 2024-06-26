<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>MEMBER</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">탈퇴회원</li>
				</ol>
			</div>
		</div>
	</div>
</section>

<section class="section schedule">
	<div class="container">
      <button type="button" class="btn" onclick="location.href='/admin/adminMember'">회원현황</button>
      <button type="button" class="btn" onclick="location.href='/admin/adminGeneralMember'">일반회원</button>
      <button type="button" class="btn" onclick="location.href='/admin/adminWithdrawMember'">탈퇴회원</button>


<div class="box-body">
		<table class="table table-bordered">
	<tr>
		<th>no</th>
		<th>아이디</th>
		<th>이름</th>
		<th>닉네임</th>
		<th>이메일</th>
		<th>전화번호</th>
		<th>가입일자</th> 
	</tr>
	<c:forEach var="vo" items="${withdrawMemberList}">
		<tr>
			<td>넘버</td>
			<td>${vo.user_id }</td>
			<td>${vo.user_name }</td>
			<td>${vo.user_nick }</td>
			<td>${vo.user_phone }</td>
			<td>${vo.user_email }</td>
			<td>${vo.user_birth }</td>
		</tr>
	</c:forEach>
</table>

 <div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			
			<c:if test="${pageDTO.prev }">
			<li><a href="/admin/adminWithdrawMember?page=${pageDTO.startPage-1 }">«</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
		
			<li ${pageDTO.cri.page == i? 'class="active"':'' }><a href="/admin/adminWithdrawMember?page=${i }">${i }</a></li>
		
			</c:forEach>
			
			<c:if test="${pageDTO.next && pageDTO.endPage > 0 }">
			<li><a href="/admin/adminWithdrawMember?page=${pageDTO.endPage+1 }">»</a></li>
			</c:if>
		</ul>
	</div>
	</div>
 </div>
</section>


<%@ include file="../include/footer.jsp"%>
</body>
</html>