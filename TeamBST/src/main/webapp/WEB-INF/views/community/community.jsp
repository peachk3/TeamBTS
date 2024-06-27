<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
.headings, .schedule-details {
	display: flex;
	justify-content: space-between;
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

.headings {
	font-weight: bold;
	background-color: #f0f0f0;
}

.schedule-details {
	background-color: #fff;
}

.headings div, .schedule-details>div {
	flex: 1;
	text-align: center;
}

.schedule-details>div a {
	color: #007bff;
	text-decoration: none;
}

.schedule-details>div a:hover {
	text-decoration: underline;
}

}
</style>
<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>COMMUNICATION</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">거래게시판</li>
				</ol>
			</div>
		</div>
	</div>
</section>

<section class="section schedule">
	<div class="container">
	
	<select name="state" id="sale_status">
		<option value="ALL">전체 게시글</option>
		<option value="SALE">판매중</option>
		<option value="COMP">판매 완료</option>
	</select>
	<select name="stadium" id="stad_id">
		<option value="ALL">전체 구장</option>
		<option value="GC">고척 스카이돔</option>
		<option value="GJ">광주 챔피언스 필드</option>
		<option value="DG">대구 라이온즈파크</option>
		<option value="DJ">대전 이글스파크</option>
		<option value="SJ">부산 사직야구장</option>
		<option value="JS">서울 잠실야구장</option>
		<option value="SW">수원 KT위즈파크</option>
		<option value="IC">인천 랜더스필드</option>
		<option value="CW">창원 NC파크</option>
	</select>
	
	<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th style="width: 10px">BNO</th>
					<th>게시글</th>
					<th>닉네임</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				
				
				<%-- <c:forEach var="dto" items="${pBoardList}">
					<tr>
						<td>${dto.post_id }</td>
						
						<td>
							<c:choose>
								<c:when test="${dto.sale_status.equals('SALE')}">
									<a href="/community/communityContent?post_id=${dto.post_id }">
										[판매중] ${dto.post_sub} </a>
								</c:when>
								<c:otherwise>
									<a href="/community/communityContent?post_id=${dto.post_id }">
										[판매완료] ${dto.post_sub} </a>
								</c:otherwise>
							</c:choose>
						</td>
	
						<c:forEach var="dto_" items="${dto.userList}">
							<td>${dto_.user_nick}</td></c:forEach>
						<td><fmt:formatDate value="${dto.post_cre_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${dto.post_view }</td>
					</tr>
				</c:forEach> --%>
	
			</tbody>
		</table>
	<button class="btn btn-main-md" onclick="location.href='/community/communityWrite'">글쓰기</button>
	</div>
	</div>
	</section>
	<!-- 페이지네이션 버튼  -->
						<nav class="d-flex justify-content-center">
						  <ul class="pagination">
						    <!-- 이전 페이지로 이동하는 링크 -->
						    <c:if test="${pageDTO.prev}">
						      <li class="page-item">
						        <a class="page-link" href="/community/community?page=${pageDTO.startPage-1}" aria-label="prev">
						          <span aria-hidden="true"><i class="fa fa-angle-left"></i></span>
						          <span class="sr-only">prev</span>
						        </a>
						      </li>
						    </c:if>
						    
						    <!-- 페이지 번호를 나열하는 반복문 -->
						    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
						      <li class="page-item ${pageDTO.cri.page == i ? 'active' : ''}">
						        <a class="page-link" href="/community/community?page=${i}">${i}</a>
						      </li>
						    </c:forEach>
						    
						    <!-- 다음 페이지로 이동하는 링크 -->
						    <c:if test="${pageDTO.next && pageDTO.endPage > 0}">
						      <li class="page-item">
						        <a class="page-link" href="/community/community?page=${pageDTO.endPage+1}" aria-label="Next">
						          <span aria-hidden="true"><i class="fa fa-angle-right"></i></span>
						          <span class="sr-only">Next</span>
						        </a>
						      </li>
						    </c:if>
						  </ul>
						</nav>
						<!-- 페이지네이션 버튼 끝 -->

	
<!-- 	<script>
	
	$(document).ready(function(){

		$('table td').remove();
		
		getMemberList();
		
		$("#sale_status").change(getMemberList); //id="listButton"인 태그에 click하면 function getMemberList() 실행
		$("#stad_id").change(getMemberList); //id="listButton"인 태그에 click하면 function getMemberList() 실행
	});
	
	function getMemberList(){
		var sale_status = $('#sale_status').val();
		var stad_id = $('#stad_id').val();
		
		$('table td').remove();
			
		$.ajax({
        	url : "/community/community",
        	type : "post",
        	data : JSON.stringify({ sale_status: sale_status, stad_id: stad_id }),
        	contentType: 'application/json; charset=utf-8',
        	dataType : "json",
        	success : function(data){
//         		alert("JTBC 다녀옴");
// 				console.log(data);
        		
        		// body 태그에 내용 추가
        		$(data).each(function(idx, item){
        			
					if(item.sale_status == 'SALE'){
	        			$('table').append("<tr><td>"+ (parseInt(idx)+1) +"</td><td><a href='/community/communityContent?post_id="+ item.post_id +"'>[판매중] "+ item.post_sub +"</a></td><td>"+ item.userList[0].user_nick+"</td><td>"+ item.post_cre_date +"</td><td>"+ item.post_view +"</td></tr>")
					}        			
					if(item.sale_status == 'COMP'){
	        			$('table').append("<tr><td>"+ (parseInt(idx)+1) +"</td><td><a href='/community/communityContent?post_id="+ item.post_id +"'>[판매완료] "+ item.post_sub +"</a></td><td>"+ item.userList[0].user_nick+"</td><td>"+ item.post_cre_date +"</td><td>"+ item.post_view +"</td></tr>")
					}        			
        			
        		});
        	},
        	error: function(jqXHR, textStatus, errorThrown) {
                console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
                alert("AJAX 요청 실패!");
            }
        });
	}
	
	</script> -->


<script>
function confirmDelete() {
    return confirm("정말로 삭제하시겠습니까?");
}



function getMemberList(page) {
    var sale_status = $('#sale_status').val();
    var stad_id = $('#stad_id').val();
    
    $('table td').remove();
    
    var category = {
        sale_status: sale_status,
        stad_id: stad_id
    };
    
    $.ajax({
        url: "/community/community",
        type: "post",
        data: JSON.stringify(category),
        contentType: 'application/json; charset=utf-8',
        dataType: "json",
        beforeSend: function(xhr) {
            xhr.setRequestHeader("page", page);
            xhr.setRequestHeader("pageSize", 10);
        },
        success: function(data) {
            // body 태그에 내용 추가
            $(data.pBoardList).each(function(idx, item){
                var statusLabel = item.sale_status == 'SALE' ? '[판매중]' : '[판매완료]';
                $('table').append("<tr><td>" + (parseInt(idx)+1) + "</td><td><a href='/community/communityContent?post_id="+ item.post_id +"'>"+ statusLabel +" "+ item.post_sub +"</a></td><td>"+ item.userList[0].user_nick +"</td><td>"+ item.post_cre_date +"</td><td>"+ item.post_view +"</td></tr>");
            });
            
            var paginationHTML = ''; 
            if(data.pageDTO.prev) {
                paginationHTML += '<li><a href="javascript:void(0);" onclick="getMemberList(' + (data.pageDTO.startPage - 1) + ');">«</a></li>';
            }
            for(var i = data.pageDTO.startPage; i <= data.pageDTO.endPage; i++) {
                var activeClass = data.pageDTO.cri.page == i ? 'class="active"' : '';
                paginationHTML += '<li ' + activeClass + '><a href="javascript:void(0);" onclick="getMemberList(' + i + ');">' + i + '</a></li>';
            }
            if(data.pageDTO.next && data.pageDTO.endPage > 0) {
                paginationHTML += '<li><a href="javascript:void(0);" onclick="getMemberList(' + (data.pageDTO.endPage + 1) + ');">»</a></li>';
            }
            $('.pagination').html(paginationHTML);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
            alert("AJAX 요청 실패!");
        }
    });
}

$(document).ready(function(){
    getMemberList(1);
    $("#sale_status").change(function() { getMemberList(1); });
    $("#stad_id").change(function() { getMemberList(1); });
});

</script>



<%@ include file="../include/footer.jsp"%>
</body>
</html>