<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>

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
	 <div class="box-body">
<form action="/admin/adminNoticeWrite" method="post">
    작성자 : <input type="text" readonly value="${user_id}" name="admin_id"> <br>
    제목 : <input type="text" name="notice_sub"> <br>
    내용 : <textarea rows="5" cols="30" name="notice_cont"></textarea> <br>
    <label> 파일선택 <input type="file" name="photo_url"> </label> <br><br>
    <input type="button" onclick="location.href='/admin/adminNotice'" value="취소">
    <input type="submit" value="등록"> <br>
</form>
</div>
</div>
</section>	
		






<%@ include file="../include/footer.jsp"%>
</body>
</html>