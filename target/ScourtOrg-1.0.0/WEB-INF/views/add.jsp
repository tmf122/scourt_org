<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<!-- ---------------------------------- -->
<!-- -----------직원 추가----------------- -->
<!-- ---------------------------------- -->	
	
    <div class="modal_add_content" style="position:fixed; width:30%; min-width:420px; left:50%; margin-left: -15%; top:50%; margin-top:-320px; padding:20px 10px; background:#fff; border:2px solid #666;">
       <div class="modal_add_header"><button type="button" class="close" onclick="close_add_layout()">×</button></div>
       <h3 align="center">사법등기국 조직도::직원 추가</h3><br>
       <form action="/ScourtOrg/sorgAdd" method="post" id="add_form" target="iframe">
	       <table class="table table-bordered">
				<tr>
					<td align="center" style="vertical-align:middle">성명</td>
					<td> <input type="text" class="form-control" name="name" maxlength="10" id=add_input_name> </td>
				</tr>
				
				<tr>
					<td align="center" style="vertical-align:middle">생년월일</td>
					<td> <input type="date" class="form-control" name="birthday"> </td>
				</tr>
				
				<tr>
					<td align="center" style="vertical-align:middle">현부서 임용일</td>
					<td> <input type="date" class="form-control" name="initday"> </td>
				</tr>
				
				<tr>
					<td align="center" style="vertical-align:middle">직위(직급)</td>
					<td> <input type="text" class="form-control" name="rank"> </td>
				</tr>
				
				<tr>
					<td align="center" style="vertical-align:middle">소속부서</td>
					<td>
						<select name="department" class="form-control" id="add_select">
							<option value="0" selected>사법등기심의관실</option>
							<option value="1">가족관계등록과</option>
							<option value="2">부동산등기과</option>
							<option value="3">재외국민가족관계과</option>
						</select>
					</td>
				</tr>
			
				<tr>
					<td align="center" style="vertical-align:middle">사무실 위치</td>
					<td> <input type="text" class="form-control" name="location" maxlength="20"> </td>
				</tr>
			
				<tr>
					<td align="center" style="vertical-align:middle">사무실 전화번호</td>
					<td> <input type="text" class="form-control" name="officeNum" maxlength="20"> </td>
				</tr>
				
				<tr>
					<td align="center" style="vertical-align:middle">핸드폰 전화번호</td>
					<td> <input type="text" class="form-control" name="phoneNum" maxlength="20"> </td>
				</tr>
			</table>
		</form>
		<button type="button" class = "btn btn-default pull-right" id="modal_add_close_btn" onclick="close_add_layout()" style="display:inline-block; margin-left:10px; width:100px;">취소</button> 
		<button type="button" class = "btn btn-default pull-right" id="modal_add_apply_btn" style="display:inline-block; width:100px;">추가</button>
        
    </div>
    <div class="modal_layer" style="position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5); z-index:-1;"></div>

<!-- ---------------------------------- -->
<!-- -----------직원 추가 끝--------------- -->
<!-- ---------------------------------- -->	
<script>
	//추가화면에서 추가 버튼 클릭
	document.getElementById("modal_add_apply_btn").onclick = function() {		
		if (confirm("추가하시겠습니까?") == false){
			return;
		}
		//추가 이벤트 실행
		document.getElementById("add_form").submit();
		setTimeout(function(){
		    window.location.reload();
		},100);
		//추가 이벤트 이후 레이아웃 닫기
		close_add_layout();
	}
		
	//직원 추가 화면 닫기
	function close_add_layout(){
		document.getElementById("modal_add").style.display="none";
		clear_input_add();
	}
	
	//입력된 내용 초기화
	function clear_input_add(){
		var el = document.getElementsByClassName('form-control');
		for(var i=0; i<el.length; i++){
			el[i].value = '';
		}
		document.getElementById('add_select').value='0';
	}
	
</script>
	
</body>
</html>