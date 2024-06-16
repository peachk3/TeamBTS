<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>

	
	
	
	
	
	
	

	<!--begin::Card-->
	<div class="card card-custom gutter-b example example-compact">
		<div class="card-header">
			<h3 class="card-title">경기 일정 수정</h3>
			<div class="card-toolbar">
				<div class="example-tools justify-content-center">
					<span class="example-toggle" data-toggle="tooltip"
						title="View code"></span> <span class="example-copy"
						data-toggle="tooltip" title="Copy code"></span>
				</div>
			</div>
		</div>
		<!--begin::Form-->
		<form class="form">
			<div class="card-body">
				<div class="form-group">
					<label>홈팀 <select name="home_team_id" id="hometeam"
						class="form-control form-control-solid">
							<option value="NC">nc 다이노스</option>
							<option value="LOTTE">롯데 자이언츠</option>
							<option value="LG">LG 트윈스</option>
							<option value="KT">KT 위즈</option>
							<option value="DOSAN">두산 베어스</option>
							<option value="SAMSUNG">삼성 라이온즈</option>
							<option value="HANHWA">한화 이글스</option>
							<option value="KIA">기아 타이거즈</option>
							<option value="KIWOOM">키움 히어로즈</option>
							<option value="SSG">SSG 랜더스</option>
					</select></label>
				</div>
				<div class="form-group">
					<label>원정팀 <select name="away_team_id" id="awayteam"
						class="form-control form-control-solid">
							<option value="NC">nc 다이노스</option>
							<option value="LOTTE">롯데 자이언츠</option>
							<option value="LG">LG 트윈스</option>
							<option value="KT">KT 위즈</option>
							<option value="DOSAN">두산 베어스</option>
							<option value="SAMSUNG">삼성 라이온즈</option>
							<option value="HANHWA">한화 이글스</option>
							<option value="KIA">기아 타이거즈</option>
							<option value="KIWOOM">키움 히어로즈</option>
							<option value="SSG">SSG 랜더스</option>
					</select></label>
				</div>

				<div class="form-group">
					<label>날짜 <input type="date" id="date" max="2077-06-20"
						min="2000-01-01" name="game_date"
						class="form-control form-control-solid">
					</label>
				</div>

				<div class="form-group">
					<label>시간 <input type="time" id="date" min="14:00:00"
						max="19:00:00" value="18:30:00" name="game_time"
						class="form-control form-control-solid">
					</label>
				</div>

			</div>
			<div class="card-footer">
				<button type="submit" class="btn btn-primary mr-2">Submit</button>
				<button type="button" class="btn btn-secondary" onclick="location.href = '/admin/adminSchedule'">Cancel</button>
				
			</div>
		</form>
		<!--end::Form-->
	</div>
	<!--end::Card-->
</body>
</html>