<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- ------------------------------------------- -->
<!-- -----------직원 보기-------------------------- -->
<!-- ------------------------------------------- -->	
    <div class="modal_view_content" style="position:fixed; width:30%; min-width:420px;left:50%; transform:translate(-50%, -100%); padding:20px 10px; background:#fff; border:2px solid #666;">
       <div class="modal_view_header"><button type="button" class="close" onclick="close_view_layout()">×</button></div>
       <h3 align="center">사법등기국 조직도::직원 보기</h3><br>
       <table class="table table-bordered" id=view_table>
			<tr>
				<td align="center" style="vertical-align:middle">성명</td>
				<td align="center"> </td>
			</tr>
			
			<tr>
				<td align="center" style="vertical-align:middle">생년월일</td>
				<td align="center"> </td>
			</tr>
			
			<tr>
				<td align="center" style="vertical-align:middle">현부서 임용일</td>
				<td align="center"> </td>
			</tr>
			
			<tr>
				<td align="center" style="vertical-align:middle">직위(직급)</td>
				<td align="center"> </td>
			</tr>
			
			<tr>
				<td align="center" style="vertical-align:middle">소속부서</td>
				<td align="center"> </td>
			</tr>
		
			<tr>
				<td align="center" style="vertical-align:middle">사무실 위치</td>
				<td align="center"> </td>
			</tr>
		
			<tr>
				<td align="center" style="vertical-align:middle">사무실 전화번호</td>
				<td align="center"> </td>
			</tr>
			
			<tr>
				<td align="center" style="vertical-align:middle">핸드폰 전화번호</td>
				<td align="center"> </td>
			</tr>
			
			<tr style="display:none">
				<td id=view_id_td></td>
				<td>
					<form action="/ScourtOrg/sorg" method="post" id="view_form" target="iframe" >
						<input type="text" name="a" style="display:none" value="delete">
						<input type="text" name="id" id="view_vo_id" style="display:none">
					</form>
				</td>
			</tr>
		</table>
		
		<button type="button" class = "btn btn-default pull-right" id="modal_view_delete_btn" style="display:inline-block; margin-left:10px; width:100px;">삭제</button> 
		<button type="button" class = "btn btn-default pull-right" id="modal_view_modify_btn" style="display:inline-block; width:100px;">수정</button>        
        
    </div>
    <div class="modal_add_layer" style="position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5); z-index:-1;"></div>
<!-- ------------------------------------------- -->
<!-- -----------직원 보기 끝------------------------ -->
<!-- ------------------------------------------- -->	

<script>
	//상세보기에서 삭제버튼 클릭
	document.getElementById("modal_view_delete_btn").onclick = function() {		
		if (confirm("삭제하시겠습니까?") == true){
			//삭제 이벤트 실행
			document.getElementById("view_form").submit();
			//삭제 이벤트 이후 레이아웃 닫기
			close_view_layout();
		}		
	}
		
	//수정 화면에 값 입력
	function input_modify(){
		view_table=document.getElementById("view_table");
		document.getElementById("modify_input_name").value="";
		document.getElementById("modify_input_birthday").value="";
		document.getElementById("modify_input_initday").value="";
		document.getElementById("modify_input_rank").value="";
		document.getElementById("modify_input_location").value="";
		document.getElementById('modify_select').value="0";
		document.getElementById("modify_input_officenum").value="";
		document.getElementById("modify_input_phonenum").value="";
		document.getElementById("modify_vo_id").value="";
	}
	
	//직원 상세보기 화면 닫기
	function close_view_layout(){
		document.getElementById("modal_view").style.display="none";
	}
	
	//상세보기에 값 입력
	function input_view(){
		table=document.getElementById("view_table");
				
		table.rows[0].cells[1].innerText="조영래";
		table.rows[1].cells[1].innerText="1992-10-19";
		table.rows[2].cells[1].innerText="2020-04-01";
		table.rows[3].cells[1].innerText="전산서기보";
		table.rows[4].cells[1].innerText="대법원 동관 245호";
		table.rows[5].cells[1].innerText="사법등기심의관실";
		table.rows[6].cells[1].innerText="02-3480-7664";
		table.rows[7].cells[1].innerText="010-2993-7291";
		document.getElementById("view_vo_id").value="124";
	}
	
	//상세보기에서 수정버튼 클릭
	document.getElementById("modal_view_modify_btn").onclick = function() {		
		close_view_layout();
		input_modify();
		document.getElementById("modal_modify").style.display="block";		
		document.getElementById("modify_input_name").focus();
	}
</script>
</body>
</html>