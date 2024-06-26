<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>


<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>ADMIN PAGE</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">관리자페이지</li>
				</ol>
			</div>
		</div>
	</div>
</section>   

<section class="section schedule">
	<div class="container">
		<div class="row">
			<div class="col-12">
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
							  			<i class="fa fa">□</i>
							  			<span class="time">아이디</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.admin_id }</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">비밀번호</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="masked-password">********</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- name -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">이름</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.admin_name }</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">닉네임</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.admin_nick }</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">휴대번호</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.admin_phone }</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">이메일</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.admin_email }</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">생년월일</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.admin_birth }</span>
							  		</div>
					  			</div>
					  		</li>
					  	</ul>
					  </div>  
					  </div>  
<input type="button" value="메인으로" class="btn" onclick="location.href='/admin/admin'">
<input type="button" value="정보수정" class="btn" onclick="location.href='/admin/adminUpdateForm'">
<input type="button" value="회원탈퇴" class="btn" onclick="location.href='/admin/adminDeleteMember'">
					  </div>  
					  </div>  
					  </div>  
					  </div>
					  </section>  
      







<%@ include file="../include/footer.jsp"%>
</body>
</html>