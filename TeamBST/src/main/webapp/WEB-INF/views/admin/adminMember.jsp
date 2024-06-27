<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.member {
    display: block;
    width: 300px; /* Increased width */
    height: 70px; /* Increased height */
    margin: 20px auto; /* Center the buttons horizontally and add vertical margin */
    padding: 10px;
    background-color: #f0f0f0; /* Light gray background */
    border: 1px solid #ddd; /* Light gray border */
    border-radius: 10px; /* Rounded corners */
    text-align: center;
    font-size: 18px; /* Increased font size */
    color: #333; /* Dark text color */
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s; /* Smooth transition for hover effects */
}

/* Hover effect for buttons */
.member:hover {
    background-color: #ddd; /* Darker gray background on hover */
    color: #000; /* Darker text color on hover */
}

/* Style for the highlighted menu item */
.memeber {
    background-color: #ffe500; /* Yellow background for active menu item */
    color: #000; /* Black text color for active menu item */
}

/* Style for non-active menu items */
.memeber:not(.active) {
    background-color: #f0f0f0; /* Light gray background for non-active menu items */
    color: #333; /* Dark text color for non-active menu items */
}

</style>




<section class="page-title bg-title overlay-dark">
   <div class="container">
      <div class="row">
         <div class="col-12 text-center">
            <div class="title">
               <h3>MEMBER</h3>
            </div>
            <ol class="breadcrumb p-0 m-0">
               <li class="breadcrumb-item active">일반회원</li>
            </ol>
         </div>
      </div>
   </div>
</section>

<section class="section schedule">
   <div class="container">
      <button type="button" class="btn" onclick="location.href='/admin/adminMember'">회원현황</button>

	<br>
	
      <button type="button" class="member" onclick="location.href='/admin/adminGeneralMember'">
      일반 회원 : ${generalMemberNum } 명</button>
     
      <button type="button" class="member" onclick="location.href='/admin/adminWithdrawMember'">
      탈퇴 회원 : ${withdrawMemberNum } 명</button>



</div>
</section>


<%@ include file="../include/footer.jsp"%>
</body>
</html>