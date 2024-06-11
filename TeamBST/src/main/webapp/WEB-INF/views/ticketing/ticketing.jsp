<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>메인페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="../../resources/css/index.css" rel="stylesheet">
  </head>
  
  <body>
    <nav>
      <a href="/main/main"><h1>개바리조</h1></a>
      
      <h6>
        <a href="/login/login">로그인/</a>
        <a href="/mypage/mypage">마이페이지/</a>
        <a href="/admin/admin">관리자페이지/</a>
        			로그인시간 ( 58: 00 ) 
      </h6>
    </nav>
    
    
    <ul class="nav">
      <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="/ticketing/ticketing">예매</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/community/community">거래</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/announcement/announcement">고객센터</a>
      </li>
    </ul>
    
    <hr>


	<form action="/ticketing/ticketing" method="post">
		<select name="stad_id" id="stad_id">
			<option value="">전체 구장</option>
			<option value="GC">고척 스카이돔</option>
			<option value="GJ">광주 챔피언스 필드</option>
			<option value="DG">대구 라이온즈파크</option>
			<option value="DJ">대전 이글스파크</option>
			<option value="SJ">부산 사직야구장</option>
			<option value="JS">서울 잠실야구장</option>
			<option value="SW">수원 KT위즈파크</option>
			<option value="IC">인천 랜더스필드</option>
			<option value="CW">창원 NC파크</option>
		</select> <input type="submit" value="검색">
	</form>

	<table border="1">
		<tr>
			<td>경기번호</td>
			<td>경기일자</td>
			<td>경기시작시간</td>
			<td>구장</td>
			<td>어웨이팀</td>
			<td>홈팀</td>
			<td>예매하기</td>
		</tr>



		<c:forEach var="vo" items="${TeamScheduleList}">
			<tr>
				<td>${vo.game_id }</td>
				<td>${vo.game_date }</td>
				<td>${vo.game_time}</td>
				<td>${vo.stad_id }</td>
				<td>${vo.away_team_id}</td>
				<td>${vo.home_team_id }</td>
			<td><a href="#">예매하기</a></td>
			</tr>
		</c:forEach>

	</table>
        


</body>
</html>