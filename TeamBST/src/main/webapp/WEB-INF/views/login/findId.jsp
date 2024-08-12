<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <form action="/TeamBST/login/findId" method="post">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="user_name" name="user_name" placeholder="이름" required>
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" id="user_phone" name="user_phone" placeholder="전화번호" required>
            </div>
            <div class="button-group">
                <button type="submit" class="id-find" onclick="findSubmit(); return false;"><p> 아이디 찾기</p></button>
            </div>
            
            <!-- 이름과 전화번호가 일치하지 않을 때  -->
            <c:if test="${check == 1 }">
            	<script>
            		opener.document.findform.name.value="";
            		opener.document.findform.phone.value="";
            	</script>
            	<label>일치하는 정보가 존재하지 않습니다</label>
       	 </c:if>    
            <div class="divider">---------------    or    -----------------</div>
            <div class="button-group">
                <button type="button" class="button-secondary"><p>이메일로 찾기</p></button>
            </div>
        </form>
        <script type="text/javascript">
        	function closethewindow() {
				self.colse();
			}
        </script>
        
        
    </div>
</body>
</html>