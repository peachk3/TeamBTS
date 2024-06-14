<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 홈페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="../resources/css/index.css" rel="stylesheet">
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
          <a class="nav-link active" aria-current="page" href="/admin/adminSchedule">경기일정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/adminMember">회원</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/adminNotice">고객센터</a>
        </li>
      </ul>
      
      <hr>

	<button type="button" class="community"
		onclick="location.href='/admin/adminNotice'">공지사항</button>
	<br>
	<button type="button" class="community"
		onclick="location.href='/admin/adminBulletin'">문의 게시판</button>
	<br>

	<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th style="width: 10px">BNO</th>
					<th>TILE</th>
					<th>WRITER</th>
					<th>REGDATE</th>
					<th style="width: 40px">VIEWCNT</th>
				</tr>
				<c:forEach var="dto" items="${nBoardList}">
					<tr>
						<td>${dto.notice_sub}</td>
						<td>${dto.notice_sub}</td>
						<td>${dto.admin_id}</td>
						<td><fmt:formatDate value="${dto.notice_cre_date}"
								pattern="yyyy-MM-dd" /></td>
						<td><span class="badge bg-purple">${dto.notice_view}</span></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>




	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<button onclick="location.href='/admin/adminNoticeWrite'">글쓰기</button>



















</body>
</html>