<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
.headings{
	display: flex;
	padding: 10px;
	border-bottom: 1px solid #ccc;
	font-weight: bold;
	background-color: #f0f0f0;
}
</style>


    <body class="body-wrapper">

<!--================================
=            Page Title            =
=================================-->

<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>MY PAGE</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
				  <li class="breadcrumb-item active">내 정보 확인하기</li>
				</ol>
			</div>
		</div>
	</div>
</section>

<!--====  End of Page Title  ====-->


<!--==============================
=            Schedule            =
===============================-->

<section class="section schedule">
   <div class="container">
      <div class="row">
         <div class="col-12">
            <div class="schedule-tab">
               <ul class="nav nav-pills text-center">
                 <li class="nav-item" id="info">
                   <a class="nav-link active" href="#nov20" data-toggle="pill">
                      정보조회
                   </a>
                 </li>
                 <li class="nav-item" id="ticket">
                   <a class="nav-link"  href="#nov21" data-toggle="pill">
                     MY 티켓
                   </a>
                 </li>
                 <li class="nav-item" id="write">
                   <a class="nav-link" href="#nov22" data-toggle="pill">
                     MY 게시글
                   </a>
                 </li>
               </ul>
            </div>
            <div class="schedule-contents bg-schedule">
               <div class="tab-content" id="pills-tabContent">
                 <div class="tab-pane fade show active schedule-item" id="nov20">
                    <!-- Headings -->
                    <ul class="m-0 p-0">
                       <li class="headings">
                          <div class="time" style="margin-left:30px">내 정보</div>
                       </li>
                       <!-- Schedule Details -->
                       <li class="schedule-details">
                          <div class="block">
                             <!-- time -->
                             <div class="time">
                                <span class="time">아이디</span>
                             </div>
                             <!-- Speaker -->
                             <div class="speaker">
                              <span class="name">${resultDTO.user_id }</span>
                             </div>
                          </div>
                       </li>
                       <!-- Schedule Details -->
                       <li class="schedule-details">
                          <div class="block">
                             <!-- time -->
                             <div class="time">
                                <span class="time">비밀번호</span>
                             </div>
                             <!-- Speaker -->
                             <div class="speaker">
                              <span class="masked-password"  style="margin-left:20px">********</span>
                             </div>
                          </div>
                       </li>
                       <!-- Schedule Details -->
                       <li class="schedule-details">
                          <div class="block">
                             <!-- name -->
                             <div class="time">
                                <span class="time">이름</span>
                             </div>
                             <!-- Speaker -->
                             <div class="speaker">
                              <span class="name">${resultDTO.user_name }</span>
                             </div>
                          </div>
                       </li>
                       <!-- Schedule Details -->
                       <li class="schedule-details">
                          <div class="block">
                             <!-- time -->
                             <div class="time">
                                <span class="time">닉네임</span>
                             </div>
                             <!-- Speaker -->
                             <div class="speaker">
                              <span class="name">${resultDTO.user_nick }</span>
                             </div>
                          </div>
                       </li>
                       <!-- Schedule Details -->
                       <li class="schedule-details">
                          <div class="block">
                             <!-- time -->
                             <div class="time">
                                <span class="time">휴대번호</span>
                             </div>
                             <!-- Speaker -->
                             <div class="speaker">
                              <span class="name">${resultDTO.user_phone }</span>
                             </div>
                          </div>
                       </li>
                       <!-- Schedule Details -->
                       <li class="schedule-details">
                          <div class="block">
                             <!-- time -->
                             <div class="time">
                                <span class="time">이메일</span>
                             </div>
                             <!-- Speaker -->
                             <div class="speaker">
                              <span class="name">${resultDTO.user_email }</span>
                             </div>
                          </div>
                       </li>
                       <!-- Schedule Details -->
                       <li class="schedule-details">
                          <div class="block">
                             <!-- time -->
                             <div class="time">
                                <span class="time">생년월일</span>
                             </div>
                             <!-- Speaker -->
                             <div class="speaker">
                              <span class="name">${resultDTO.user_birth }</span>
                             </div>
                          </div>
                       </li>
                    </ul>
                    
                    <div class="download-button text-center">
                     <a href="/main/main" class="btn btn-main-md">메인으로</a>
                     <a href="/mypage/updateForm" class="btn btn-main-md">정보수정</a>
                     <a href="/mypage/deleteMember" class="btn btn-main-md">회원탈퇴</a>
                  </div>
                 </div>
                 <div class="tab-pane fade schedule-item" id="nov21">
                 <button type="button" class="btn btn-main-md" id="Upcoming" value="Upcoming">예정 경기</button>
                    <button type="button" class="btn btn-white-md" id="Past" value="Past">지난 경기</button>
                    <br>
                    <br>
                    <br>
                 
                    <!-- Headings -->
                    <ul class="m-0 p-0" id="ticket_table">
                       <li class="headings">
                          <div class="time" style="margin-left:40px">경기 일자</div>
                          <div class="time">시작 시간</div>
                          <div class="time">구장</div>
                          <div class="time">홈팀</div>
                          <div class="time">원정팀</div>
                       </li>
                    </ul>
                 </div>
                 <div class="tab-pane fade schedule-item" id="nov22">
                  <select name="boardTable_id" class="btn btn-main-md" id="boardTable_id">
                     <option value="All">전체 게시판</option>
                     <option value="Community">거래 게시판</option>
                     <option value="Bulletin">문의 게시판</option>
                  </select>
                  <br>
                  <br>
                  <br>
                  <!-- Headings -->
                    <ul class="m-0 p-0" id="write_table">
                       <li class="headings">
                          <div class="venue" style="margin-left:40px">No.</div>
                          <div class="speaker" style="margin-left:40px">제목</div>
                          <div class="time" style="margin-left:300px">작성일</div>
                          <div class="venue">조회수</div>
                       </li>
                    </ul>
                 </div>
               </div>
            </div>
               
            
         </div>
      </div>
   </div>
</section>

<!--====  End of Schedule  ====-->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<script>
   $(document).ready(function(){
	   
      $("#ticket").click(function(){
         $('ul#ticket_table li.schedule-details').remove();
         getTicketList();
      });
      
      $("#Past").click(ticketPastStatusSet); //id="listButton"인 태그에 click하면 function getMemberList() 실행
      $("#Upcoming").click(ticketUpcomingStatusSet); //id="listButton"인 태그에 click하면 function getMemberList() 실행
      
      $("#write").click(function(){
         $('ul#write_table li.schedule-details').remove();
         getBoardList();
      });
      
      $("#boardTable_id").change(getBoardList);
      
      
      $("#Past").click(ticketPastStatusSet); //id="listButton"인 태그에 click하면 function getMemberList() 실행
      $("#Upcoming").click(ticketUpcomingStatusSet); //id="listButton"인 태그에 click하면 function getMemberList() 실행
      
      $("#write").click(function(){
         $('ul#write_table li.schedule-details').remove();
         getBoardList();
      });
      
      $("#boardTable_id").change(getBoardList);
   });
   
   function ticketPastStatusSet(){
      var ticket_status = $('#Past').val();
      getTicketList(ticket_status);
   }
   
   function ticketUpcomingStatusSet(){
      var ticket_status = $('#Upcoming').val();
      getTicketList(ticket_status);
   }
   
   function getTicketList(ticket_status){
      console.log(ticket_status);
      
      $('ul#ticket_table li.schedule-details').remove();
         
      $.ajax({
           url : "/mypage/myticket",
           type : "post",
           data : JSON.stringify({ ticket_status : ticket_status}),
           contentType: 'application/json',
           dataType : "json",
           success : function(data){
//               alert("JTBC 다녀옴");
//             console.log(data);
              
              // body 태그에 내용 추가
              $(data).each(function(idx, item){
            
                 $('#ticket_table').append('<li class="schedule-details"><div class="block"><div class="time"><span class="time">'+ item.game_date +'</span></div><div class="time"><span class="time">'+ item.game_time +'</span></div><div class="time"><span class="time">'+ item.stad_id +'</span></div><div class="time"><span class="time">'+ item.home_team_id +'</span></div><div class="time"><span class="time">'+ item.away_team_id + '</span></div></div></li>')
                 
              });
           },
           error: function(jqXHR, textStatus, errorThrown) {
                console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
                alert("AJAX 요청 실패!");
            }
        });

//    }
   
//    function getBoardList(){
//       var boardTable_id = $('#boardTable_id').val();
//       console.log(boardTable_id);
      
//       $('ul#write_table li.schedule-details').remove();
         
//       $.ajax({
//            url : "/mypage/mywrite",
//            type : "post",
//            data : JSON.stringify({ boardTable_id: boardTable_id }),
//            contentType : "application/json",
//            dataType : "json",
//            success : function(data){
// //                 alert("JTBC 다녀옴");
// //             console.log(data);
                
//                 // body 태그에 내용 추가
//                 $(data).each(function(idx, item){
                   
//                    $('#write_table').append('<li class="schedule-details"><div class="block"><div class="venue"><span class="time">'+ (parseInt(idx)+1) +'</span></div><div class="speaker" style="margin-left:30px"><a href="/community/communityContent?post_id='+ item.board_id +'"><span class="name">'+ item.board_sub +'</span></a></div><div class="time" style="margin-left:350px">'+ item.board_cre_date +'</div><div class="venue" style="margin-left:15px">'+ item.board_view +'</div></div></li>')
                   
//                 });
//              },
//              error: function(jqXHR, textStatus, errorThrown) {
	}
	
	function getBoardList(){
		var boardTable_id = $('#boardTable_id').val();
		console.log(boardTable_id);
		
		$('ul#write_table li.schedule-details').remove();
			
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
	       			
	       			$('#write_table').append('<li class="schedule-details"><div class="block"><div class="venue"><span class="time">'+ (parseInt(idx)+1) +'</span></div><div class="speaker" style="margin-left:30px"><a href="/community/communityContent?post_id='+ item.board_id +'"><span class="name">'+ item.board_sub +'</span></a></div><div class="time" style="margin-left:350px">'+ item.board_cre_date +'</div><div class="venue" style="margin-left:15px">'+ item.board_view +'</div></div></li>')
	       			
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