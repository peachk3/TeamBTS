<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>






	<fieldset>
		<legend>회원정보수정</legend>
		<form action="/mypage/updateForm" method="post" name="fr">
			아이디 <input type="text" name="user_id" value="${resultDTO.user_id }" readonly><br>
			비밀번호 <input type="password" name="user_pwd" placeholder="비밀번호를 입력하세요" required><br>
			이름 <input type="text" name="user_name" value="${resultDTO.user_name } "><br>
			닉네임<input type="text" name="user_nick" value="${resultDTO.user_nick } "><br>
			휴대번호<input type="text" name="user_phone" value="${resultDTO.user_phone }"><br>
			이메일 <input type="email" name="user_email" value="${resultDTO.user_email }"><br>
			생년월일<input type="date" name="user_birth" value="${resultDTO.user_birth }"><br>
			<input type="submit" class="btn" value="회원정보수정하기">
			<input type="button" class="btn" value="마이페이지" onclick="location.href='/mypage/mypage'">
		</form>
	</fieldset>
	
	
	
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

	
	
	
	
	
	
	
	
<%@ include file="../include/footer.jsp"%>	
</body>
</html>