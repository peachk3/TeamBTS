<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	margin-bottom: 20px;
}

.buttons {
	text-align: right;
}

textarea {
	width: 100%;
	height: 100px;
}
</style>

<c:forEach var="quest" items="${QuestionOneList}">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<!-- 질문 내용 출력 -->
				<div class="notice">
					<div class="post-info">
						<div class="post-header">
							<c:choose>
								<c:when test="${quest.quest_public eq 'Y'}">
                                [공개] ${quest.quest_sub }
                            </c:when>
								<c:otherwise>
                                [비공개] ${quest.quest_sub }
                            </c:otherwise>
							</c:choose>
						</div>
						<div class="post-meta">
							<span>작성자: ${quest.quest_writer_id }</span> &nbsp; | &nbsp; <span>작성일: ${quest.quest_cre_date }</span> &nbsp; | &nbsp; <span>조회수: ${quest.quest_view }</span>
						</div>
					</div>
					<div class="post-content">${quest.quest_cont }</div>
				</div>

				<hr>
    <button type="button" onclick="location.href='/admin/adminBulletin'">목록</button>

				<!-- 답변 부분 -->
				<c:if test="${not empty commend}">
					<div class="answer">
						<div class="post-info">
							<div class="post-header">
								<strong>답변</strong>
							</div>
						</div>
						<div class="post-content">
							${commend.comm_cont }
							<!-- 답변 내용 표시 -->
						</div>
					</div>
				</c:if>

				<!-- 댓글 목록 -->
			<form action="/admin/adminbulletinContentDelete" method="post">
			    <div class="comments">
			        <h3>답변</h3>
			        <c:forEach var="comment" items="${CommentList}">
			            <div class="answer">
			                <p>
			                    <strong>작성자:</strong> ${comment.admin_id}
			                </p>
			                <p>${comment.comm_cont}</p>
			                <p>
			                    <small>${comment.comm_cre_date}</small>
			                </p>
			                <input type="hidden" name="comm_id" value="${comment.comm_id}">
			                <input type="hidden" name="quest_id" value="${comment.quest_id}">
<%-- 			                <button type="button" onclick="location.href='/admin/adminbulletinContent?quest_id=${quest_id}'">수정</button> --%>
			                <button type="submit">삭제</button>
			            </div>
			        </c:forEach>
			    </div>
			</form>
				
				
				
				
				
				<!-- 댓글 입력 폼 -->
				<c:if test="${empty commend and empty CommentList}">
					<div class="answer" id="commentForm">
						<form action="/admin/adminbulletinContent" method="post">
							<input type="hidden" name="quest_id" value="${quest.quest_id}" />
							<p>
								<strong>댓글 작성</strong>
							</p>
							<textarea name="comm_cont" placeholder="댓글 내용을 입력하세요..."></textarea>
							<div class="buttons">
								<button type="button" onclick="window.history.back();">취소</button>
								<button type="submit">등록</button>
							</div>
						</form>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</c:forEach>
<!-- JavaScript를 통한 답변 입력 폼 숨김 처리 -->
<script>
	// isAnswered 변수 값에 따라 답변 입력 폼을 숨기거나 보이기
	var isAnswered = $
	{
		isAnswered
	}; // JSP에서 전달받은 값

	if (isAnswered) {
		document.getElementById("commentForm").style.display = "none";
	}
</script>
<%@ include file="../include/footer.jsp"%>
