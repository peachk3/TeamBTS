<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

   <style>
       .bg-schedule {
        border: 1px solid #ddd;
        background: none;
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
      
      .notice {
	   		border: 1px solid #ccc;
	        padding: 0;
	        margin-bottom: 20px;
	        width: 100%;
	    }
      
      .post-info {
         border: 1px solid #ccc;
         padding: 20px;
         padding-bottom: 10px;
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
        font-size: 16px;
        padding: 50px; 20px;
        overflow-wrap: break-word;
        white-space:pre-wrap;
      }
        
      .buttons {
	        display: flex;
	        justify-content: flex-end;
      }
      
      textarea {
    	padding: 10px;
        width: 100%;
        height: 100px;
      }
	</style>
	
<body>
	<section class="section schedule">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<c:forEach var="notice" items="${noticeOneList}">
						<div class="notice">
							<div class="post-info">
								<div class="post-header">${notice.notice_sub }</div>
								<div class="post-meta">
									<span>작성자: ${notice.admin_id }</span> &nbsp; | &nbsp; <span>작성일: ${notice.notice_cre_date }</span> &nbsp; | &nbsp; <span>조회수: ${notice.notice_view }</span>
								</div>
							</div>
							<div class="post-content">${notice.notice_cont }</div>
						</div>
					</c:forEach>

				</div>
			</div>
			<div class="buttons">
				<button type="button" onclick="window.history.back();">뒤로가기</button>
			</div>
		</div>
	</section>




	<%@ include file="../include/footer.jsp"%>
</body>
</html>