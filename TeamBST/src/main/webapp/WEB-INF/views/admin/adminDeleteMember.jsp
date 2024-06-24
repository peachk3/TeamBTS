<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fieldset>
    <legend>회원탈퇴</legend>
    <form action="/admin/adminDeleteMember" method="post" name="fr">
        아이디 <input type="text" name="admin_id" value="${resultDTO.admin_id}" readonly><br>
        비밀번호 <input type="password" name="admin_pwd" placeholder="비밀번호를 입력하세요" required><br>
        <input type="submit" class="btn" value="회원탈퇴">
        <input type="button" class="btn" value="취소" onclick="history.back();">
    </form>
    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>
</fieldset>
    
</body>
</html>