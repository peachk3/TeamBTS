<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
    
	<h1>MY 게시글</h1>
<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">질문글</h3>
	</div>
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">번 호</label> 
				<input type="text" name="title" class="form-control" 
						id="exampleInputEmail1" value="${Question_boardDTO.quest_id }" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">제 목</label> 
				<input type="text" name="title" class="form-control" 
						id="exampleInputEmail1" value="${Question_boardDTO.quest_sub }" readonly="readonly">
			</div>
			<div class="form-group">
				<label>내 용</label>
				<textarea class="form-control" name="content" rows="3" 
							 readonly="readonly">${Question_boardDTO.quest_con }</textarea>
			</div>
		</div>
		<div class="box-footer">
			<button type="submit" class="btn btn-primary">리스트</button>
										<!-- 선택자 -->
		</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		
		// '리스트' 버튼 클릭 시 리스트 페이지로 이동
		$(".btn-primary").click(function(){
			// '.' : 선택자 사용 시 선택자 앞에 .
			// alert("클릭!");
			location.href='/mypage/questionBoardList';
			
		});
		
	});
</script>
</body>
</html>

