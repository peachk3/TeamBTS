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
					<li class="breadcrumb-item active">일반회원</li>
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

 	<h1>일반 회원 : ${generalMemberNum }</h1>
	<h1>탈퇴 회원 : ${withdrawMemberNum }</h1>
 
</div>
</section>


<%@ include file="../include/footer.jsp"%>
</body>
</html>