<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

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


	<div>
		<input type="text" placeholder="검색어 입력">
		<button>검색</button>
	</div>
	
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
	</div>
	<br>









	<button onclick="location.href='/community/communityWrite'">글쓰기</button>
	
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

<div class="box-footer clearfix">
    <ul class="pagination pagination-sm no-margin pull-right">
        <c:if test="${pageDTO.prev }">
            <li><a href="javascript:void(0);" onclick="getMemberList(${pageDTO.startPage - 1});">«</a></li>
        </c:if>
        
        <c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
            <li ${pageDTO.cri.page == i ? 'class="active"' : '' }><a href="javascript:void(0);" onclick="getMemberList(${i});">${i }</a></li>
        </c:forEach>
        
        <c:if test="${pageDTO.next && pageDTO.endPage > 0 }">
            <li><a href="javascript:void(0);" onclick="getMemberList(${pageDTO.endPage + 1});">»</a></li>
        </c:if>
    </ul>
</div>

<script>
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




</body>
</html>