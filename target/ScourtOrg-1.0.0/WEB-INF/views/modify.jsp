<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- ---------------------------------------- -->
<!-- -----------직원 수정 ---------------------- -->
<!-- ---------------------------------------- -->	
    <div class="modal_modify_content" style="position:fixed; width:30%; min-width:420px; left:50%; margin-left: -15%; top:50%; margin-top: -320px; padding:20px 10px; background:#fff; border:2px solid #666;">
       <div class="modal_modify_header"><button type="button" class="close" onclick="close_modify_layout()">×</button></div>
       <h3 align="center">사법등기국 조직도::직원 수정</h3><br>
       <form action="/ScourtOrg/sorgModify" method="post" id="modify_form" target="iframe">
       <table class="table table-bordered">
			<tr>
				<td align="center" style="vertical-align:middle">성명</td>
				<td> <input type="text" class="form-control" name="name" maxlength="10" id="modify_input_name"> </td>
			</tr>
			
			<tr>
				<td align="center" style="vertical-align:middle">생년월일</td>
				<td> <input type="date" class="form-control" name="birthday" id="modify_input_birthday"></td>
			</tr>
			
			<tr>
				<td align="center" style="vertical-align:middle">현부서 임용일</td>
				<td> <input type="date" class="form-control" name="initday" id="modify_input_initday"></td>
			</tr>
			
			<tr>
				<td align="center" style="vertical-align:middle">직위(직급)</td>
				<td> <input type="text" class="form-control" name="rank" id="modify_input_rank"></td>
			</tr>
			
			<tr>
				<td align="center" style="vertical-align:middle">소속부서</td>
				<td>
					<select name="department" class="form-control" id=modify_select>
						<option value="0" selected>사법등기심의관실</option>
						<option value="1">가족관계등록과</option>
						<option value="2">부동산등기과</option>
						<option value="3">재외국민가족관계과</option>
					</select>
				</td>
			</tr>
		
			<tr>
				<td align="center" style="vertical-align:middle">사무실 위치</td>
				<td> <input type="text" class="form-control" name="location" maxlength="20" id="modify_input_location"></td>
			</tr>
		
			<tr>
				<td align="center" style="vertical-align:middle">사무실 전화번호</td>
				<td> <input type="text" class="form-control" name="officeNum" maxlength="20" id="modify_input_officenum"></td>
			</tr>
			
			<tr>
				<td align="center" style="vertical-align:middle">핸드폰 전화번호</td>
				<td> <input type="text" class="form-control" name="phoneNum" maxlength="20" id="modify_input_phonenum"></td>
			</tr>
		</table>
			<input type="text" name="id" id=modify_vo_id style="display:none">
		</form>
		<button type="button" class = "btn btn-default pull-right" id="modal_modify_close_btn" onclick="close_modify_layout()"style="display:inline-block; margin-left:10px; width:100px;">취소</button> 
		<button type="button" class = "btn btn-default pull-right" id="modal_modify_apply_btn" style="display:inline-block; width:100px;">수정</button>        
        
    </div>
    <div class="modal_add_layer" style="position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5); z-index:-1;"></div>

<!-- ---------------------------------------- -->
<!-- -----------직원 수정 끝--------------------- -->
<!-- ---------------------------------------- -->	

<script>
	//수정화면에서 수정 버튼 클릭
	document.getElementById("modal_modify_apply_btn").onclick = function() {		
		if (confirm("수정하시겠습니까?") == false){
			return;
		}
		//수정 이벤트 실행
		document.getElementById("modify_form").submit();
		setTimeout(function(){
		    window.location.reload();
		},100);
		//수정 이벤트 이후 레이아웃 닫기
		close_modify_layout();		
	}
	
	//직원 수정 화면 닫기
	function close_modify_layout(){
		document.getElementById("modal_modify").style.display="none";
		clear_input_modify();
	}
	
	//입력된 내용 초기화
	function clear_input_modify(){
		var el = document.getElementsByClassName('form-control');
		for(var i=0; i<el.length; i++){
			el[i].value = '';
		}
		document.getElementById('modify_select').value='0';
	}
</script>

</body>
</html>