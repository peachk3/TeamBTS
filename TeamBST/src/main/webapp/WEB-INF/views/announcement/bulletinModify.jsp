<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>




<c:forEach var="quest" items="${QuestionOneList}">
	<!--begin::Card-->
	<div class="card card-custom gutter-b example example-compact">
		<div class="card-header">
			<h3 class="card-title">문의 게시글 수정</h3>
			<div class="card-toolbar">
				<div class="example-tools justify-content-center">
					<span class="example-toggle" data-toggle="tooltip"
						title="View code"></span> <span class="example-copy"
						data-toggle="tooltip" title="Copy code"></span>
				</div>
			</div>
		</div>
		<!--begin::Form-->
		<form class="form" action="/announcement/bulletinModify?quest_id=${quest.quest_id }" method="post">
			<div class="card-body">

				<div class="form-group">
					<label>제목 <input type="text" name="quest_sub"
						class="form-control form-control-solid" value="${quest.quest_sub }"></label>
				</div>
				
				<div class="form-group">
					<label>공개/비공개 <select name="quest_public" id="selltype">
							<option value="Y" ${quest.quest_public == 'Y' ? 'selected' : ''}>공개</option>
							<option value="N" ${quest.quest_public == 'N' ? 'selected' : ''}>비공개</option>
					</select></label>
				</div>

				<div class="form-group">
					<label>문의 유형 <select name="quest_cate" id="selltype">
							<option value="1" ${quest.quest_cate == '1' ? 'selected' : ''}>일반 문의</option>
							<option value="2" ${quest.quest_cate == '2' ? 'selected' : ''}>환불 문의</option>
							<option value="3" ${quest.quest_cate == '3' ? 'selected' : ''}>계정 문의</option>
							<option value="4" ${quest.quest_cate == '4' ? 'selected' : ''}>티켓 문의</option>
					</select></label>
				</div>
				

				<div class="form-group">
					<label for="exampleTextarea">내용</label>
					<textarea class="form-control form-control-solid" rows="3"
						name="quest_cont" >${quest.quest_cont }</textarea>
				</div>

				<div class="form-group">
					<label> 파일선택 <input type="file" name="photo_url"
						class="form-control form-control-solid"></label>
				</div>


			</div>
			<div class="card-footer">
				<button type="submit" class="btn btn-primary mr-2">Submit</button>
				<button type="reset" class="btn btn-secondary"
					onclick="window.history.back();">Cancel</button>
			</div>
		</form>
		<!--end::Form-->
	</div>
	<!--end::Card-->
</c:forEach>













</body>
</html>