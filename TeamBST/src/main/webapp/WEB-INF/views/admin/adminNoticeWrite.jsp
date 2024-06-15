<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>


          
 	<form action="/admin/adminNoticeWrite" method="post">
  	
	  	작성자 : <input type="text" readonly name="${user_id }"> <br>
		제목 : <input type="text" name="notice_sub"> <br>
		내용 : <textarea rows="5" cols="30" name="notice_cont"></textarea> <br>
	    <label> 파일선택 <input type="file" name="photo_url"> </label> <br><br>
		<input type="button" onclick="location.href='/admin/adminNotice'" value="취소">
		<input type="submit" value="등록"> <br>
		
	</form>
		
		







</body>
</html>