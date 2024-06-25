<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        padding: 20px;
        padding-bottom: 10px;
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
    
    .answer {
        border: 1px solid #ddd;
        padding: 10px;
        background-color: #f1f1f1;
        margin-top: 20px; /* 수정: 댓글과 답변 사이의 간격 추가 */
    }
    
    .buttons {
        text-align: right;
        margin-top: 10px; /* 수정: 버튼 간격 추가 */
    }
    
    textarea {
        width: 100%;
        height: 100px;
    }
</style>
<!-- 본문 내용 출력 -->
<c:forEach var="post" items="${PostOneList}">
    <div class="post">
        <div class="post-info">
            <div class="post-header">${post.post_sub }</div>
            <div class="post-meta">
                <span>작성자: ${post.post_writer_id }</span> &nbsp; | &nbsp; 
                <span>작성일: ${post.post_cre_date }</span>
                &nbsp; | &nbsp; 
                <span>조회수: ${post.post_view }</span>
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
<button type="button" onclick="location.href='/community/community'">목록</button>


<!-- 댓글 목록 -->
<div class="comments">
    <h3>댓글</h3>
    <c:forEach var="comment" items="${CommentList}">
        <div class="answer">
            <p><strong>작성자:</strong> ${comment.comm_writer_id}</p>
            <p>${comment.comm_cont}</p>
            <p><small>${comment.comm_cre_date}</small></p>
        </div>
    </c:forEach>
</div>
    <!-- 답변 입력 폼 -->
    <div class="answer">
        <form action="/community/communityContent" method="post">
            <input type="hidden" name="post_id" value="${post.post_id}" />
            <p><strong>답변</strong></p>
            <textarea name="comm_cont" placeholder="답변 내용을 입력하세요..."></textarea>
            <div class="buttons">
                <button type="button" onclick="window.history.back();">취소</button>
                <button type="submit">등록</button>
            </div>
        </form>
    </div>
</c:forEach>



    <script type="text/javascript">
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


