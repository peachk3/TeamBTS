<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>

      
      
      
      <button type="button" class="community" onclick="location.href='/admin/adminMember'">회원현황</button> <br>
      <button type="button" class="community" onclick="location.href='/admin/adminGeneralMember'">일반회원</button> <br>
      <button type="button" class="community" onclick="location.href='/admin/adminWithdrawMember'">탈퇴회원</button>


		
      <br><br><br>
      <table border="1">

	<tr>
		<td>아이디</td>
		<td>${resultDTO.admin_id }</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td class="masked-password">********</td> <!-- 비밀번호 마스킹 -->
	</tr>
	<tr>
		<td>이름</td>
		<td>${resultDTO.admin_name }</td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td>${resultDTO.admin_nick }</td>
	</tr>
	<tr>
		<td>휴대번호</td>
		<td>${resultDTO.admin_phone }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${resultDTO.admin_email }</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>${resultDTO.admin_birth }</td>
	</tr>
</table>




<input type="button" value="메인으로" class="btn" onclick="location.href='/admin/admin'">
<input type="button" value="정보수정" class="btn" onclick="location.href='/admin/adminUpdateForm'">
<input type="button" value="회원탈퇴" class="btn" onclick="location.href='/admin/adminDeleteMember'">




<%@ include file="../include/footer.jsp"%>
</body>
</html>