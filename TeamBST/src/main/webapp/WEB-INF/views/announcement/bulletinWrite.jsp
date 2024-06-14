<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
    
    
    
    
          <form action="#">
            <select name="type" id="type">
              <option value="open">공개글</option>
              <option value="secret">판매중</option>
            </select>
            
            <br><br><br>
            </form>
		
          
		  <form action="/announcement/bulletin" method="post">

		    <label> 파일선택 <input type="file"> </label> <br><br>
			<input type="button" onclick="location.href='/announcement/bulletin'" value="취소">
			<input type="button" onclick="location.href='/announcement/bulletin'" value="등록"> <br>
		</form>
		
		
		</body>
</html>