<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

	<!--begin::Card-->
	<div class="card card-custom gutter-b example example-compact">
		<div class="card-header">
			<h3 class="card-title">거래 게시글 작성</h3>
			<div class="card-toolbar">
				<div class="example-tools justify-content-center">
					<span class="example-toggle" data-toggle="tooltip"
						title="View code"></span> <span class="example-copy"
						data-toggle="tooltip" title="Copy code"></span>
				</div>
			</div>
		</div>
		<!--begin::Form-->
		<form class="form" action="/TeamBST/community/communityWrite" method="post">
			<div class="card-body">
<%-- ?user_id=${user_id} --%>
				<div class="form-group">
					<label>제목 <input type="text" name="post_sub"
						class="form-control form-control-solid"></label>
				</div>

				<div class="form-group">
					<label>거래방식 <select name="sale_ty" id="selltype">
							<option value="DITR">직거래</option>
							<option value="NFTF">티켓전송</option>
					</select></label>
				</div>

				<div class="form-group">
					<label>원정팀 <select name="stad_id" id="stad">
							<option value="GC">고척 스카이돔</option>
							<option value="GJ">광주 챔피언스 필드</option>
							<option value="DG">대구 라이온즈파크</option>
							<option value="DJ">대전 이글스파크</option>
							<option value="SJ">부산 사직야구장</option>
							<option value="JS">서울 잠실야구장</option>
							<option value="SW">수원 KT위즈파크</option>
							<option value="IC">인천 랜더스필드</option>
							<option value="CW">창원 NC파크</option>
					</select></label>
				</div>

				<div class="form-group">
					<label for="exampleTextarea">내용</label>
					<textarea class="form-control form-control-solid" rows="3"
						name="post_cont"></textarea>
				</div>

				<div class="form-group">
					<label> 파일선택 <input type="file" name="photo_url"
						class="form-control form-control-solid"></label>
				</div>
			</div>

			
			<div class="card-footer">
				<button type="submit" class="btn btn-primary mr-2">Submit</button>
				<button type="reset" class="btn btn-secondary"
					onclick="location.href='/TeamBST/community/community'">Cancel</button>
			</div>
		</form>
		<!--end::Form-->
	</div>
	<!--end::Card-->
<%@ include file="../include/footer.jsp"%>
</body>
</html>