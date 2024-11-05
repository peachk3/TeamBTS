<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
html, body {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    margin: 0;
}

main {
    flex: 1; /* 메인 콘텐츠가 남은 공간을 차지하도록 설정 */
}

.subfooter {
    position: relative;
    padding: 10px 0;
    width: 100%;
    }
    

</style>
<!DOCTYPE html>
<html lang="en">
<!--============================
=            Footer            =
=============================-->

<!-- Subfooter -->
<footer class="subfooter">
  <div class="container">
    <div class="row">
      <div class="col-md-6 align-self-center">
        <div class="copyright-text">
          <p><a href="https://www.itwillbs.co.kr/">ITWILL</a> &#169; 2024 All Right Reserved</p>
        </div>
      </div>
      <div class="col-md-6">
          <a href="#" class="to-top"><i class="fa fa-angle-up"></i></a>
      </div>
    </div>
  </div>
</footer>



  <!-- JAVASCRIPTS -->
  <!-- jQuey -->
  <script src="<c:url value="/resources/plugins/jquery/jquery.js"/>"></script>
  <!-- Popper js -->
  <script src="<c:url value="/resources/plugins/popper/popper.min.js"/>"></script>
  <!-- Bootstrap 4 -->
  <script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
  <!-- Smooth Scroll -->
<%--   <script src="<c:url value="/resources/plugins/smoothscroll/SmoothScroll.min.js"/>"></script>   --%>
  <!-- Isotope -->
  <script src="<c:url value="/resources/plugins/isotope/mixitup.min.js"/>"></script>  
  <!-- Magnific Popup -->
  <script src="<c:url value="/resources/plugins/magnific-popup/jquery.magnific-popup.min.js"/>"></script>
  <!-- Slick Carousel -->
  <script src="<c:url value="/resources/plugins/slick/slick.min.js"/>"></script>  
  <!-- SyoTimer -->
  <script src="<c:url value="/resources/plugins/syotimer/jquery.syotimer.min.js"/>"></script>
  <!-- Custom Script -->
  <script src="<c:url value="/resources/js/custom.js"/>"></script>