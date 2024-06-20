<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              .answer {
            border: 1px solid #ddd;
            padding: 10px;
            background-color: #f1f1f1;
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
   <div class="notice">
      <div class="post-info">
         <div class="post-header">
				<c:choose>
					<c:when test="${quest.quest_public.equals('Y')}">
						[공개] ${quest.quest_sub }
					</c:when>
					<c:otherwise>
						[비공개] ${quest.quest_sub }
					</c:otherwise>
				</c:choose>
			</div>
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

<hr>
   
<%--    <div class="answer">
            <form action="/admin/adminbulletinContent?quest_id=${quest.quest_id }" method="post">
            	<input type="hidden" name="comm_cre_date" />
            	<input type="hidden" name="admin_id" />
            <input type="hidden" name="quest_id" value="${quest.quest_id}" />
                <p><strong>답변</strong></p>
                <textarea name="comm_cont" placeholder="답변 내용을 입력하세요..."></textarea>
                <div class="buttons">
                    <button type="button" onclick="window.history.back();">취소</button>
                    <button type="submit">등록</button>
                </div>
            </form>
        </div>
</c:forEach>  --%>

   <div class="answer">
        <form action="/admin/adminbulletinContent" method="post">
            <input type="hidden" name="quest_id" value="${quest.quest_id}" />
            <p><strong>답변</strong></p>
            <textarea name="comm_cont" placeholder="답변 내용을 입력하세요..."></textarea>
            <div class="buttons">
                <button type="button" onclick="window.history.back();">취소</button>
                <button type="submit">등록</button>
            </div>
        </form>
    </div>
</c:forEach> 

   
</body>
</html>