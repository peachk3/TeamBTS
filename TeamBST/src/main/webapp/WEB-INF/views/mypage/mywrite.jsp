<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
      
      
	<button type="button" class="community" onclick="location.href='/mypage/mypage'">회원정보 조회</button> <br>
	<button type="button" class="community" onclick="location.href='/mypage/myticket'">MY 티켓</button> <br>
	<button type="button" class="community" onclick="location.href='/mypage/mywrite'">MY 게시글</button><br>

	<select name="boardTable_id" id="boardTable_id">
		<option value="All">전체 게시판</option>
		<option value="Community">거래 게시판</option>
		<option value="Bulletin">문의 게시판</option>
	</select>

<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</tbody>
		</table>
	</div>
	
	<!-- 
	<table border="1">
		<tr>
		</tr>
		<c:forEach var="post" items="${postBoardList}">
			<tr>
				<td>${post.post_id }</td>
				<td>${post.post_writer_id }</td>
				<td><a href="/mypage/pbread?post_id=${post.post_id}">${post.post_sub }</a>
				</td>
				<td>${post.post_cont }</td>
				<td><fmt:formatDate type="both" value="${post.post_cre_date }"
						pattern="yy/MM/dd HH:mm" /></td>
				<td>${post.stad_id }</td>
				<td><span>${post.post_view }</span></td>
				<td>${post.sale_status }</td>
			</tr>
		</c:forEach>
	</table>
	 -->

	<!-- 
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<c:forEach var="post" items="${questionBoardList}">
			<tr>
				<td>${post.quest_id }</td>
				<td>${post.quest_writer_id }</td>
				<td><a href="/mypage/qbread?quest_id=${post.quest_id}">${post.quest_sub }</a>
				</td>
				<td>${post.quest_cont }</td>
				<td><fmt:formatDate type="both" value="${post.quest_cre_date }"
						pattern="yy/MM/dd HH:mm" /></td>
				<td>${post.quest_view }</td>
			</tr>
		</c:forEach>
	</table>
	 -->
	 
	 <script>
	
	 $(document).ready(function(){
		$('table td').remove();
		 getBoardList();
		
		$("#boardTable_id").change(getBoardList); //id="listButton"인 태그에 click하면 function getMemberList() 실행
	});
	
	function getBoardList(){
		var boardTable_id = $('#boardTable_id').val();
		console.log(boardTable_id);
		
		$('table td').remove();
			
		$.ajax({
        	url : "/mypage/mywrite",
        	type : "post",
        	data : JSON.stringify({ boardTable_id: boardTable_id }),
        	contentType : "application/json",
        	dataType : "json",
        	success : function(data){
// 	       		alert("JTBC 다녀옴");
// 				console.log(data);
	       		
	       		// body 태그에 내용 추가
	       		$(data).each(function(idx, item){
	       			
	       			$('table').append("<tr><td>"+ (parseInt(idx)+1) +"</td><td>"+ item.board_sub +"</td><td>"+ item.board_cre_date +"</td><td>"+ item.board_view +"</td></tr>")
	       			
	       		});
	       	},
	       	error: function(jqXHR, textStatus, errorThrown) {
               console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
               alert("AJAX 요청 실패!");
	        }
	    });
	}
	
	</script>








<%@ include file="../include/footer.jsp"%>
</body>
</html>