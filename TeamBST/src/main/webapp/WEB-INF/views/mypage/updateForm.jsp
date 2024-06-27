<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
.headings {
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
               <div class="schedule-contents bg-schedule">
                  <div class="tab-content" id="pills-tabContent">
                     <div class="tab-pane fade show active schedule-item" id="nov20">
                        <!-- Headings -->
                        <ul class="m-0 p-0">
                           <li class="headings">
                              <div class="time" style="margin-left: 30px">내 정보</div>
                           </li>
                           <!-- Schedule Details -->
                           <fieldset>
                           		<form action="/mypage/updateForm" method="post" name="fr">
                           <li class="schedule-details">
                              <div class="block">
                                 <!-- time -->
                                 <div class="time">
                                    <span class="time">아이디</span>
                                 </div>
                                 <!-- Speaker -->
                                 <div class="speaker">
                                    <input type="text" name="user_id" class="name"
                                       value="${resultDTO.user_id }" readonly>
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
                                    <input type="password" name="user_pwd"  class="masked-password"
                                       placeholder="비밀번호를 입력하세요" required>
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
                                    <input type="text" name="user_name"  class="name"
                                       value="${resultDTO.user_name } ">
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
                                    <input type="text" name="user_nick" class="name"
                                       value="${resultDTO.user_nick } ">
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
                                    <input type="text" name="user_phone" class="name"
                                       value="${resultDTO.user_phone }">
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
                                    <input type="email" name="user_email" class="name"
                                       value="${resultDTO.user_email }">
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
                                    <input type="date" name="user_birth" class="name"
                                       value="${resultDTO.user_birth }">
                                 </div>
                              </div>
                           </li>
                        </ul>

                        <div class="download-button text-center">
                           <input type="submit" class="btn btn-main-md" value="회원정보수정하기">
                           <input type="button" class="btn btn-main-md" value="마이페이지" onclick="location.href='/mypage/mypage'">
                     </form>  
                     </fieldset>    
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div>
   </section>

   <script type="text/javascript">
        <%-- alertMessage가 존재할 경우에만 alert 창을 띄움 --%>
        <%   if (session.getAttribute("alertMessage") != null) {%>
            alert("<%=session.getAttribute("alertMessage")%>");
      <%
         // alert를 한 번 띄운 후 session에서 해당 메시지를 삭제
         session.removeAttribute("alertMessage");
      %>
      
      <%}%>
   </script>

   <%@ include file="../include/footer.jsp"%>

</body>
</html>