<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

   <style>
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
      }  /* 댓글 목록 스타일 */
      
    .comments {
        margin-top: 20px;
        padding: 10px;
        border: 1px solid #ddd;
        background-color: #f9f9f9;
      }

      .comment {
        margin-bottom: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        background-color: #fff;
      }

      .comment-info {
        margin-bottom: 5px;
      }

      .comment-info p {
        margin: 0;
      }

      .comment-content p {
        margin: 0;
      }
   </style>

<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>ANNOUNCEMENT</h3>
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

<c:if test="${not empty errorMessage}">
    <div class="error-message">${errorMessage}</div>
</c:if>

<c:forEach var="quest" items="${QuestionOneList}">
    <div class="notice">
        <div class="post-info">
            <div class="post-header">${quest.quest_sub }</div>
            <div class="post-meta">
                <span>작성자: ${quest.quest_writer_id }</span> &nbsp; | &nbsp;
                <span>작성일: ${quest.quest_cre_date }</span>
                &nbsp; | &nbsp;
                <span>조회수: ${quest.quest_view }</span>
            </div>
        </div>
        <div class="post-content">
            ${quest.quest_cont }
        </div>
    </div>

    <button type="submit" onclick="location.href='/announcement/bulletinModify?quest_id=${quest.quest_id}&quest_writer_id=${quest.quest_writer_id }'">수정</button>
    <form action="/announcement/bulletinDelete?quest_id=${quest.quest_id}&quest_writer_id=${quest.quest_writer_id }" method="post" onsubmit="return confirmDelete()">
	        <input type="hidden" name="notice_id">
	        <input type="submit" value="삭제">
	    </form>   
	    
    <button type="button" onclick="location.href='/announcement/bulletin'">목록</button>
</c:forEach>

<!-- 답변 내용 -->
<div class="comments">
    <h3>답변</h3>
    <c:forEach var="comment" items="${QuestionCommendList}">
        <div class="comment">
            <div class="comment-info">
                <p><strong>작성자:</strong> ${comment.admin_id }</p>
                <p><small>${comment.comm_cre_date }</small></p>
            </div>
            <div class="comment-content">
                <p>${comment.comm_cont }</p>
            </div>
        </div>
    </c:forEach>
</div>
</div>
</section>

<script type="text/javascript">
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