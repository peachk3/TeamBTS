<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
	<script src="../resources/css/findId.css"></script>
	
</head>
<body>
	 <div class="container">
        <h2>ID/PW 찾기</h2>
        <div class="tabs">
            <div class="findIdTab" id="findIdTab">아이디 찾기</div>
            <div class="findPwdTab" id="findPwdTab">비밀번호 찾기</div>
        </div>
        <form action="find_info.jsp" method="post">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="user_name" name="user_name" required>
            </div>
            <div class="form-group">
                <label for="info">전화번호</label>
                <input type="text" id="user_phone" name="user_phone" placeholder="전화번호" required>
            </div>
            <div class="button-group">
                <button type="submit" class="button-primary"><p> 회원정보로찾기</p></button>
            </div>
            <div class="divider">---------------    or    -----------------</div>
            <div class="button-group">
                <button type="button" class="button-secondary"><p>이메일로 찾기</p></button>
            </div>
        </form>
    </div>
</body>
</html>