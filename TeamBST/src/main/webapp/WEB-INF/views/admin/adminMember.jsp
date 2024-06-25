<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>




      <button type="button" class="community" onclick="location.href='/admin/adminMember'">회원현황</button> <br>
      <button type="button" class="community" onclick="location.href='/admin/adminGeneralMember'">일반회원</button> <br>
      <button type="button" class="community" onclick="location.href='/admin/adminWithdrawMember'">탈퇴회원</button>



	
	<h1>일반 회원 : ${generalMemberNum }</h1>
	<h1>탈퇴 회원 : ${withdrawMemberNum }</h1>










<%@ include file="../include/footer.jsp"%>
</body>
</html>