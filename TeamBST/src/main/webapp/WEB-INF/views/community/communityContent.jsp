<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>



   <style>
      body {
         font-family: Arial, sans-serif;
         line-height: 1.6;
         margin: 20px;
      }
      
      .post {
         padding: 20px;
         margin-bottom: 20px;
      }
      
      .post-info {
         border: 1px solid #ccc;
         padding: 20px; padding-bottom: 10px;
         margin-bottom: 20px;
         background-color: #E1E6F6;
      }
      
      .post-header {
         font-size: 18px;
         font-weight: bold;
         margin-bottom: 10px;
      }
      
      .post-meta {
         color: #666;
         font-size: 14px;
         margin-bottom: 10px;
      }
      
      .post-content {
         padding-right: 30px;
         padding-left: 30px;
         font-size: 16px;
      }
   </style>
   
   
<c:forEach var="post" items="${PostOneList}">
   <div class="post">
      <div class="post-info">
         <div class="post-header">${post.post_sub }</div>
         <div class="post-meta">
            <span>작성자: ${post.post_writer_id }</span> &nbsp; | &nbsp; <span>작성일: ${post.post_cre_date }</span>
            &nbsp; | &nbsp; <span>조회수: ${post.post_view }</span>
         </div>
      </div>
      <div class="post-content">
         ${post.post_cont }
      </div>
   </div>
   
              <button type="submit" onclick="location.href='/community/communityModify?post_id=${post.post_id }&post_writer_id=${post.post_writer_id }'">수정</button>

		<form action="/community/communityDelete?post_id=${post.post_id }&post_writer_id=${post.post_writer_id }" method="post">
			<input type="hidden" name="post_id" >
			<input type="submit" value="삭제">
		</form>	
				
                <button type="button" onclick="window.history.back();">취소</button>
   
</c:forEach>
   
</body>
</html>