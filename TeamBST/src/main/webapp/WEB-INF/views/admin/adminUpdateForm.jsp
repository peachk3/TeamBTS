<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>


	<fieldset>
		<legend>회원정보수정</legend>
		<form action="/admin/adminUpdateForm" method="post" name="fr">
			아이디 <input type="text" name="admin_id" value="${resultDTO.admin_id }" readonly><br>
			비밀번호 <input type="password" name="admin_pwd" placeholder="비밀번호를 입력하세요" required><br>
			이름 <input type="text" name="admin_name" value="${resultDTO.admin_name } "><br>
			닉네임<input type="text" name="admin_nick" value="${resultDTO.admin_nick } "><br>
			휴대번호<input type="text" name="admin_phone" value="${resultDTO.admin_phone }"><br>
			이메일 <input type="email" name="admin_email" value="${resultDTO.admin_email }"><br>
			생년월일<input type="date" name="admin_birth" value="${resultDTO.admin_birth }"><br>
			<input type="submit" class="btn" value="회원정보수정하기">
			<input type="button" class="btn" value="마이페이지" onclick="location.href='/admin/admin'">
		</form>
	</fieldset>




</body>
</html>