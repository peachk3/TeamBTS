<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<!-- <link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous"> -->
<link href="../resources/css/index.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="../resources/css/payment.css" rel="stylesheet">

<style>
   th {
      background-color: transparent;
      color: black;
   }
   
   .btn {
      background-color: #aac1f9;
      margin-right: 10px;
      margin-left: 10px;
   }
</style>

<body>


<section class="section schedule">
<div class="container">
   <div class="modal1" id="termsModal">
      <div class="modal1-content">
         <span class="close1" onclick="closeModal1()">&times;</span>
         <h5>결제 약관 동의</h5>
         <table>
            <tr>
               <td><p>전자금융거래 이용약관</p></td>
               <td></td>
               <td><p>개인정보 수집 및 이용 안내</p></td>
            </tr>
            <tr>
               <td><p>고유식별정보 수집 및 이용안내</p></td>
               <td></td>
               <td><p>개인정보 제공 및 위탁안내</p></td>
            </tr>
         </table>

         <label><input type="checkbox" id="termsCheckbox" value="Y"> 위의 약관에 동의하시겠습니까? </label>
         <div>
            <button type="button" id="modalButton" onclick="agreeTerms()">동의하기</button>
         </div>
      </div>
   </div>

   <div class="reserve_content">
      <div class="reserve_left">

         <div id="paymethod" class="paymethod" onclick="kakaoPay()">
            <p>카카오페이</p>
            <img class="kakaoPay" src="../resources/img/kakaoPay.jpg" alt="kakaoPay">
         </div>

      </div>
      <div class="reserve_right">
         <div class="info-panel">
            <c:forEach var="gs" items="${gameSchedule}">
               <table class="table1">
                  <tr class="tr1">
                     <td><span id="team-name"> <%-- ${gs.away_team_id} --%><br> 
                        <c:if test="${gs.away_team_id == 'KIWOOM'}">
                           <img id="teamsymbol" src="../resources/team/kiwoomkiwoom.png" alt="KIWOOM 로고"> 
                        </c:if>
                        <c:if test="${gs.away_team_id == 'LOTTE'}">
                           <img id="teamsymbol" src="../resources/team/lottelotte.png" alt="LOTTE 로고"> 
                        </c:if>
                        <c:if test="${gs.away_team_id == 'DOSAN'}">
                           <img id="teamsymbol" src="../resources/team/dosandosan.png" alt="DOSAN 로고"> 
                        </c:if>
                        <c:if test="${gs.away_team_id == 'HANHWA'}">
                           <img id="teamsymbol" src="../resources/team/hanhwahanhwa.png" alt="HANHWA 로고"> 
                        </c:if>
                        <c:if test="${gs.away_team_id == 'KIA'}">
                           <img id="teamsymbol" src="../resources/team/kiwoomkiwoom.png" alt="KIA 로고">
                        </c:if> 
                        <c:if test="${gs.away_team_id == 'KT'}">
                           <img id="teamsymbol" src="../resources/team/ktkt.png" alt="KT 로고">
                        </c:if> 
                        <c:if test="${gs.away_team_id == 'NC'}">
                           <img id="teamsymbol" src="../resources/team/ncnc.png" alt="NC로고">
                        </c:if> 
                        <c:if test="${gs.away_team_id == 'SAMSUNG'}">
                           <img id="teamsymbol" src="../resources/team/samsungsamsung.png" alt="SAMSUNG 로고">
                        </c:if> 
                        <c:if test="${gs.away_team_id == 'SSG'}">
                           <img id="teamsymbol" src="../resources/team/ssgssg.png" alt="SSG 로고">
                        </c:if> 
                        <c:if test="${gs.away_team_id == 'LG'}">
                           <img id="teamsymbol" src="../resources/team/lglg.png" alt="LG 로고">
                        </c:if></span>
                     </td>
                     <td>
                        <h6 class="vs"> VS </h6>
                     </td>
                     <td>
                        <span id="team-name"><br> 
                        <c:if test="${gs.home_team_id == 'KIWOOM'}">
                           <img id="teamsymbol" src="../resources/team/kiwoomkiwoom.png" alt="KIWOOM 로고"> 
                        </c:if>
                        <c:if test="${gs.home_team_id == 'LOTTE'}">
                           <img id="teamsymbol" src="../resources/team/lottelotte.png" alt="LOTTE 로고"> 
                        </c:if>
                        <c:if test="${gs.home_team_id == 'DOSAN'}">
                           <img id="teamsymbol" src="../resources/team/dosandosan.png" alt="DOSAN 로고"> 
                        </c:if>
                        <c:if test="${gs.home_team_id == 'HANHWA'}">
                           <img id="teamsymbol" src="../resources/team/hanhwahanhwa.png" alt="HANHWA 로고"> 
                        </c:if>
                        <c:if test="${gs.home_team_id == 'KIA'}">
                           <img id="teamsymbol" src="../resources/team/kiwoomkiwoom.png" alt="KIA 로고">
                        </c:if> 
                        <c:if test="${gs.home_team_id == 'KT'}">
                           <img id="teamsymbol" src="../resources/team/ktkt.png" alt="KT 로고">
                        </c:if> 
                        <c:if test="${gs.home_team_id == 'NC'}">
                           <img id="teamsymbol" src="../resources/team/ncnc.png" alt="NC로고">
                        </c:if> 
                        <c:if test="${gs.home_team_id == 'SAMSUNG'}">
                           <img id="teamsymbol" src="../resources/team/samsungsamsung.png" alt="SAMSUNG 로고">
                        </c:if> 
                        <c:if test="${gs.home_team_id == 'SSG'}">
                           <img id="teamsymbol" src="../resources/team/ssgssg.png" alt="SSG 로고">
                        </c:if> 
                        <c:if test="${gs.home_team_id == 'LG'}">
                           <img id="teamsymbol" src="../resources/team/lglg.png" alt="LG 로고">
                        </c:if></span>
                     </td>
                  </tr>
                  <tr>
                     <th>일시</th>
                     <td><span id="match-date">${gs.game_date} ${gs.game_time} </span></td>
                     <td></td>
                  </tr>
                  
                  <tr>
                     <th>경기장</th>
                     <td><span id="match-stadium"> 
                        <c:if test="${gs.stad_id == 'CW'}">창원 NC 파크</c:if> 
                        <c:if test="${gs.stad_id == 'DG'}">대구 라이온즈파크</c:if> 
                        <c:if test="${gs.stad_id == 'DJ'}">대전 이글스파크</c:if> 
                        <c:if test="${gs.stad_id == 'GC'}">고척 스카이돔</c:if> 
                        <c:if test="${gs.stad_id == 'GJ'}">광주 챔피언스필드</c:if> 
                        <c:if test="${gs.stad_id == 'IC'}">인천 랜더스필드</c:if> 
                        <c:if test="${gs.stad_id == 'JS'}">서울 잠실야구장</c:if> 
                        <c:if test="${gs.stad_id == 'SJ'}">부산 사직야구장</c:if> 
                        <c:if test="${gs.stad_id == 'SW'}">수원 KT위즈파크</c:if>
                        <c:if test="${gs.stad_id == 'LG'}">서울 잠실야구장</c:if> </span>
                     </td>
                     <td></td>
                  </tr>
                  <tr>
                     <th>예매자명</th>
                     <td><c:forEach var="use" items="${user }">${use.user_name}</c:forEach></td>
                     <td></td>
                  </tr>

                  <tr class="selectSeatInfo">
                     <th>선택좌석</th>
                     <td>
                        <%
                        String[] seat_rows = request.getParameterValues("seat_row");
                        String[] seat_nums = request.getParameterValues("seat_num");
                        String[] seat_ids = request.getParameterValues("seat_id");
                        %>
                        <p id="seatInfo"></p>
                     </td>
                     <td></td>
                  </tr>
                  <tr>
                     <th>티켓 금액</th>
                     <td><span id="total-price">0</span>원</td>
                     <td></td>
                  </tr>
                  <tr>
                     <th>예매 수수료 </th>
                     <td>장당 1000원<!-- <span id="booking-fee">0</span> --></td>
                     <td></td>
                  </tr>
                  <tr>
                     <th>취소 수수료</th>
                     <td>티켓 금액의 0 ~ 10%</td>
                     <td><button id="myBtn">상세보기</button>
                        <div id="myModal" class="modal">
                           <div class="modal-content">
                              <span class="close"> &times;</span>
                               <h5> 취소 수수료 상세 보기 </h5>
                              <p>
                              * 예매취소 안내(경기 당일 3시간 전까지 취소 가능)
                              <br>
                              * 예매 당일 취소 = 수수료 부과 없음
                              * 본인이 예매한 다음 날(0시 기준)부터 경기 당일 3시간 전 취소 = 예매 수수료 + 취소 수수료 제외한 나머지 환불 이후 취소 불가 <br>
                              * 예매한 내역의 부분 취소 및 날짜, 좌석변경, 권종변경은 불가합니다.
                              </p>
                           </div>
                        </div>
                     </td>
                  </tr>

                  <tr>
                     <th>결제 금액</th>
                     <td><span id="total-amount">0</span>원</td>
                  </tr>

               </table>
            </c:forEach>
         </div>
      </div>
   </div>
   <div class="reserve_btn">
      <button type="submit" class="btn" onclick="goBack()" style="background-color:transparent; border: 1px solid black;">이전으로</button>      
      <button type="button" class="btn">결제하기</button> <!-- 결제하기 버튼 생성 -->
   </div>
</div>
</section>




    
<script type="text/javascript">

// 총 결제 금액 받아오기 (예매 수수료 포함)
var totalAmount = localStorage.getItem('totalAmount');
document.getElementById('total-amount').textContent = totalAmount;

var totalPrice = localStorage.getItem('totalPrice');
document.getElementById('total-price').textContent = totalPrice;

//JavaScript로 모달 보이기/감추기 및 동작 정의
const modal1 = document.getElementById('termsModal');

// 모달 열기
function openModal1() {
  modal1.style.display = 'block';
}

// 모달 닫기
function closeModal1() {
  modal1.style.display = 'none';
}

const checkbox = document.getElementById('termsCheckbox');
const submitButton = document.getElementById('modalButton');

checkbox.addEventListener('change', function() {
    submitButton.disabled = !this.checked;
});

// 약관 동의 처리
function agreeTerms() {
  // 여기에 동의를 처리하는 로직을 추가할 수 있습니다.
  alert('결제 약관에 동의하셨습니다.');
  closeModal1(); // 동의 후 모달을 닫습니다.
}

window.onload = openModal1;

const currentUrl = window.location.href;

// URL에서 seat_id 추출
const seatIdsIndex = currentUrl.lastIndexOf('&') + 1;
const seatIdsString = currentUrl.substring(seatIdsIndex);
//   const seatRowIndex = currentUrl.

// seat_id 문자열을 쉼표(,)로 분리하여 배열로 생성
const seatIds = seatIdsString.split(',');
//   const 

// 선택된 좌석 수를 계산
let seatCount = seatIds.length;

// 콘솔 출력
console.log(seatCount);

// ****** 예매 수수료 ************
const bookFee = seatCount * 1000;
// document.getElementById('booking-fee').innerText = bookFee;
// ****** 예매 수수료  출력 완료 ************

      
      // 예매 취소 수수료 팝업창
      // 모달 요소
       var modal2 = document.getElementById("myModal");
   
       // 버튼 요소
       var btn = document.getElementById("myBtn");
   
       // 닫기 버튼 요소
       var span = document.getElementsByClassName("close")[0];
   
       // 클릭시 모달 출력
       btn.onclick = function() {
           modal2.style.display = "block";
       }
   
       // 닫기 클릭시 모달 숨김
       span.onclick = function() {
           modal2.style.display = "none";
       }
   
       // 외부 클릭시 모달 숨김
       window.onclick = function(event) {
           if (event.target == modal2) {
               modal2.style.display = "none";
           }
       }
      
    function displayParameters() {
        var params = new URLSearchParams(window.location.search);

        var zoneTypes = params.get("zone_ty").split(",");
        var seatRows = params.get("seat_row").split(",");
        var seatNums = params.get("seat_num").split(",");
        var seatInfo = [];

        for (var i = 0; i < seatRows.length; i++) {
            seatInfo.push(zoneTypes + "구역" + seatRows[i] + "열 " + seatNums[i] + "번");
            
        }

        document.getElementById("seatInfo").innerHTML = seatInfo.join("<br>");
        
    }

    window.addEventListener('load', (event) => {
        displayParameters();
    });
    
    
    
    function goBack() {
        history.back();
    }

    function kakaoPay() {
       //전달할 데이터
       // 구매자명
       // 경기 일정(날짜, 해당 팀, 해당 구장, 경기 일시)
       // 좌석 정보(좌석)
       // 결제 정보 (가격(수수료를 포함한 총액))
       // 취소 가능 일자
       const targetDiv = document.getElementById('paymethod');
        targetDiv.classList.toggle('red-border');
    
    }
//     document.getElementById("paymethod").addEventListener("click", function() {
//         // Replace the URL with the actual payment window URL
        
//     });
    
    
       
    
    </script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>
