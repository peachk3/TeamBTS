<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<c:forEach var="post" items="${PostOneList}">
	<!--begin::Card-->
	<div class="card card-custom gutter-b example example-compact">
		<div class="card-header">
			<h3 class="card-title">거래 게시글 수정</h3>
			<div class="card-toolbar">
				<div class="example-tools justify-content-center">
					<span class="example-toggle" data-toggle="tooltip"
						title="View code"></span> <span class="example-copy"
						data-toggle="tooltip" title="Copy code"></span>
				</div>
			</div>
		</div>
		<!--begin::Form-->
		<form class="form" action="/TeamBST/community/communityModify?post_id=${post.post_id }" method="post">
			<div class="card-body">

				<div class="form-group">
					<label>제목 <input type="text" name="post_sub"
						class="form-control form-control-solid" value="${post.post_sub }"></label>
				</div>

				<div class="form-group">
					<label>거래방식 <select name="sale_ty" id="selltype">
							<option value="DITR" ${post.sale_ty == 'DITR' ? 'selected' : ''}>직거래</option>
							<option value="NFTF" ${post.sale_ty == 'NFTF' ? 'selected' : ''}>티켓전송</option>
					</select></label>
				</div>
				
				<div class="form-group">
					<label>상태 <select name="sale_status" id="status">
							<option value="SALE" ${post.sale_status == 'SALE' ? 'selected' : ''}>판매중</option>
							<option value="COMP" ${post.sale_status == 'COMP' ? 'selected' : ''}>판매완료</option>
					</select></label>
				</div>
				
				<div class="form-group">
    <label>원정팀 
        <select name="stad_id" id="stad">
            <option value="GC" ${post.stad_id == 'GC' ? 'selected' : ''}>고척 스카이돔</option>
            <option value="GJ" ${post.stad_id == 'GJ' ? 'selected' : ''}>광주 챔피언스 필드</option>
            <option value="DG" ${post.stad_id == 'DG' ? 'selected' : ''}>대구 라이온즈파크</option>
            <option value="DJ" ${post.stad_id == 'DJ' ? 'selected' : ''}>대전 이글스파크</option>
            <option value="SJ" ${post.stad_id == 'SJ' ? 'selected' : ''}>부산 사직야구장</option>
            <option value="JS" ${post.stad_id == 'JS' ? 'selected' : ''}>서울 잠실야구장</option>
            <option value="SW" ${post.stad_id == 'SW' ? 'selected' : ''}>수원 KT위즈파크</option>
            <option value="IC" ${post.stad_id == 'IC' ? 'selected' : ''}>인천 랜더스필드</option>
            <option value="CW" ${post.stad_id == 'CW' ? 'selected' : ''}>창원 NC파크</option>
        </select>
    </label>
</div>

				<div class="form-group">
					<label for="exampleTextarea">내용</label>
					<textarea class="form-control form-control-solid" rows="3"
						name="post_cont" >${post.post_cont }</textarea>
				</div>

				<div class="form-group">
					<label> 파일선택 <input type="file" name="photo_url"
						class="form-control form-control-solid"></label>
				</div>


			</div>
			<div class="card-footer">
				<button type="submit" class="btn">수정하기</button>
				<button type="reset" class="btn"
					onclick="window.history.back();">뒤로가기</button>
			</div>
		</form>
		<!--end::Form-->
	</div>
	<!--end::Card-->
</c:forEach>
<%@ include file="../include/footer.jsp"%>
</body>
</html>