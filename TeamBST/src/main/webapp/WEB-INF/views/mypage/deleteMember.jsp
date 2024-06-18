<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


<fieldset>
    <legend>회원탈퇴</legend>
    <form action="/mypage/deleteMember" method="post" name="fr">
        아이디 <input type="text" name="user_id" value="${resultDTO.user_id}" readonly><br>
        비밀번호 <input type="password" name="user_pwd" placeholder="비밀번호를 입력하세요" required><br>
        <input type="submit" class="btn" value="회원탈퇴">
        <input type="button" class="btn" value="취소" onclick="history.back();">
    </form>
    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>
</fieldset>
    
    
    
</body>
</html>
