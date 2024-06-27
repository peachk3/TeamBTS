<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
   <section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>NOTICE</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">공지사항</li>
				</ol>
			</div>
		</div>
	</div>
</section>
  
 <section class="section schedule">
	<div class="container">
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


<hr>

              <button type="submit" onclick="location.href='/admin/adminNoticeModify?notice_id=${notice.notice_id }&admin_id=${notice.admin_id }'">수정</button>

	    <form action="/admin/adminNoticeDelete?notice_id=${notice.notice_id}&admin_id=${notice.admin_id}" method="post" onsubmit="return confirmDelete()">
	        <input type="hidden" name="notice_id">
	        <input type="submit" value="삭제">
	    </form>   
				
                <button type="button" class="btn btn-main-md" onclick="location.href='/admin/adminNotice'">목록</button>
</c:forEach>
      </div>
      </section>  
   <script>
function confirmDelete() {
    return confirm("정말로 삭제하시겠습니까?");
}

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