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
   
   
<c:forEach var="notice" items="${noticeOneList}">
   <div class="notice">
      <div class="post-info">
         <div class="post-header">${notice.notice_sub }</div>
         <div class="post-meta">
            <span>작성자: ${notice.admin_id }</span> &nbsp; | &nbsp; 
            <span>작성일: ${notice.notice_cre_date }</span>
            &nbsp; | &nbsp; 
            <span>조회수: ${notice.notice_view }</span>
         </div>
      </div>
      <div class="post-content">
         ${notice.notice_cont }
      </div>
   </div>
</c:forEach>
   
   
</body>
</html>