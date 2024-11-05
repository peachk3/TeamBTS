<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
body{
	background-color: white;
	text-align: center;
}
th{
	text-align: center;
}
.box-body{
	margin-left: 30px;
	margin-right: 30px;
}
</style>
<body>
<main>
<section class="section speakers bg-speaker overlay-lighter">

	<div class="box-body" style="background-color: white">
		<table class="table table-bordered">
			<tbody>
				<tr>
				    <th>조장</th>
				    <th>부조장1</th>
				    <th>부조장2</th>
				    <th>팀원1</th>
				    <th>팀원2</th>
				</tr>
					<tr>
				    <td>박도경</td>
				    <td>박경민</td>
				    <td>홍여원</td>
				    <td>이예진</td>
				    <td>조수영</td>

					</tr>

			</tbody>
		</table>
</div>

</section>
</main>
<%@ include file="../include/footer.jsp"%>
</body>
</html>