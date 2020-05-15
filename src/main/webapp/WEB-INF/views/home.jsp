<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8" %>

<html>
<head>
	<!-- bootstrap -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
	<link
		href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
	  	<div class="navbar navbar-dark bg-dark shadow-sm">
		    <div class="container d-flex justify-content-between">
		      <a href="#" class="navbar-brand d-flex align-items-center">
		        <i class="fa fa-address-book"></i>
		        <strong class="col-md-3">사법등기국 조직도</strong>
		      </a>
		    </div>
	  </div>
	</header>

	<div class="container">	
		<div class="input-group p-4">
			<div class="input-group-prepend">
				<select class="btn btn-outline-secondary dropdown-toggle">
					<option value="0" selected>이름</option> 
					<option value="1">직급</option> 
					<option value="2">소속</option>
					<option value="3">전화번호</option>			
				</select>
			</div>
	
			<input type="text" class="form-control" placeholder="검색어를 입력해주세요."
				aria-describedby="button-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
		
<div id="content">

<!--  버튼  -->
	<button class="btn btn-primary pull-right"type="button" id="modal_view_open_btn" style=" margin-bottom:8px; margin-left:8px" >보기</button>
	<button class="btn btn-primary pull-right"type="button" id="modal_add_open_btn" style=" margin-bottom:8px; margin-left:8px" >추가</button>
	<button class="btn btn-primary pull-right"type="button" id="modal_modify_open_btn" style=" margin-bottom:8px">수정</button>
	<iframe src="#" name="iframe" style="width:1px; height:1px; border:0; visibility:hidden;"> </iframe>

</div>
		<table class="table table-hover" id=officer_list>
			<thead class="thead-light">
				<tr>
					<th scope="col">No.</th>
					<th scope="col">직위</th>
					<th scope="col">성명</th>
					<th scope="col">소속부서</th>
					<th scope="col">사무실 위치</th>
					<th scope="col">사무실 전화번호</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>전산서기보</td>
					<td>김이슬</td>
					<td>사법등기심의관실</td>
					<td>동관 247호</td>
					<td>02-1234-1234</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>전산서기보</td>
					<td>조영래</td>
					<td>사법등기심의관실</td>
					<td>동관 247호</td>
					<td>02-1234-1234</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>전산서기보</td>
					<td>임광진</td>
					<td>사법등기심의관실</td>
					<td>동관 247호</td>
					<td>02-1234-1234</td>
				</tr>
				<tr>
					<th scope="row">4</th>
					<td>전산서기보</td>
					<td>김강은</td>
					<td>사법등기심의관실</td>
					<td>동관 247호</td>
					<td>02-1234-1234</td>
				</tr>
				<tr>
					<th scope="row">5</th>
					<td>전산서기보</td>
					<td>이채민</td>
					<td>사법등기심의관실</td>
					<td>동관 247호</td>
					<td>02-1234-1234</td>
				</tr>
				<tr>
					<th scope="row">6</th>
					<td>전산사무관</td>
					<td>오창완</td>
					<td>사법등기심의관실</td>
					<td>동관 247호</td>
					<td>02-1234-1234</td>
				</tr>
				<tr>
					<th scope="row">7</th>
					<td>전산사무관</td>
					<td>이만수</td>
					<td>사법등기심의관실</td>
					<td>동관 247호</td>
					<td>02-1234-1234</td>
				</tr>
				<tr>
					<th scope="row">8</th>
					<td>전산주사</td>
					<td>김병모</td>
					<td>사법등기심의관실</td>
					<td>동관 247호</td>
					<td>02-1234-1234</td>
				</tr>
				<tr>
					<th scope="row">9</th>
					<td>전산주사</td>
					<td>정인성</td>
					<td>사법등기심의관실</td>
					<td>동관 247호</td>
					<td>02-1234-1234</td>
				</tr>
				<tr>
					<th scope="row">10</th>
					<td>전산주사</td>
					<td>장연정</td>
					<td>사법등기심의관실</td>
					<td>동관 247호</td>
					<td>02-1234-1234</td>
				</tr>
		</table>
</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination pagination-sm justify-content-center">
	    	<li class="page-item">
	    		<a class="page-link" href="#" aria-label="Previous">
	        		<span aria-hidden="true">&laquo;</span>
	        		<span class="sr-only">Previous</span>
	      		</a>
	    	</li>
	    	<li class="page-item"><a class="page-link" href="#">1</a></li>
	    	<li class="page-item"><a class="page-link" href="#">2</a></li>
	    	<li class="page-item"><a class="page-link" href="#">3</a></li>
	    	<li class="page-item">
	    		<a class="page-link" href="#" aria-label="Next">
	        		<span aria-hidden="true">&raquo;</span>
	        		<span class="sr-only">Next</span>
	        	</a>
	    	</li>
	    </ul>
	</nav>
	
<!-- ---------------------------------- -->
<!-- -----------직원 추가----------------- -->
<!-- ---------------------------------- -->	
	
<div id="modal_add" class="container" style="display:none; position:relative; width:100%; height:100%; top:0; left:0; z-index:1;">
    <div class="modal_add_content" style="position:fixed; width:30%; min-width:420px;left:50%; transform:translate(-50%, -100%); padding:20px 10px; background:#fff; border:2px solid #666;">
       <div class="modal_add_header"><button type="button" class="close" onclick="close_add_layout()">×</button></div>
       <h3 align="center">사법등기국 조직도::직원 추가</h3><br>
       <form action="/ScourtOrg/sorg" method="post" id="add_form" target="iframe">
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
					<td> <input type="text" class="form-control" name="office_number" maxlength="20"> </td>
				</tr>
				
				<tr>
					<td align="center" style="vertical-align:middle">핸드폰 전화번호</td>
					<td> <input type="text" class="form-control" name="phone_number" maxlength="20"> </td>
				</tr>
			</table>
				<input type="text" name="a" value="add" style="display:none">
		</form>
		<button type="button" class = "btn btn-default pull-right" id="modal_add_close_btn" onclick="close_add_layout()" style="display:inline-block; margin-left:10px; width:100px;">취소</button> 
		<button type="button" class = "btn btn-default pull-right" id="modal_add_apply_btn" style="display:inline-block; width:100px;">추가</button>
        
    </div>
    <div class="modal_layer" style="position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5); z-index:-1;"></div>
</div>

<!-- ---------------------------------- -->
<!-- -----------직원 추가 끝--------------- -->
<!-- ---------------------------------- -->	

<!-- ---------------------------------------- -->
<!-- -----------직원 수정 ---------------------- -->
<!-- ---------------------------------------- -->	
<div id="modal_modify" style="display:none; position:relative; width:100%; height:100%; top:0; left:0; z-index:1;">
    <div class="modal_modify_content" style="position:fixed; width:30%; min-width:420px;left:50%; transform:translate(-50%, -100%); padding:20px 10px; background:#fff; border:2px solid #666;">
       <div class="modal_modify_header"><button type="button" class="close" onclick="close_modify_layout()">×</button></div>
       <h3 align="center">사법등기국 조직도::직원 수정</h3><br>
       <form action="/ScourtOrg/sorg" method="post" id="modify_form" target="iframe">
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
				<td> <input type="text" class="form-control" name="office_number" maxlength="20" id="modify_input_officenum"></td>
			</tr>
			
			<tr>
				<td align="center" style="vertical-align:middle">핸드폰 전화번호</td>
				<td> <input type="text" class="form-control" name="phone_number" maxlength="20" id="modify_input_phonenum"></td>
			</tr>
		</table>
			<input type="text" name="a" value="modify" style="display:none">
			<input type="text" name="id" id=modify_vo_id style="display:none">
		</form>
		<button type="button" class = "btn btn-default pull-right" id="modal_modify_close_btn" onclick="close_modify_layout()"style="display:inline-block; margin-left:10px; width:100px;">취소</button> 
		<button type="button" class = "btn btn-default pull-right" id="modal_modify_apply_btn" style="display:inline-block; width:100px;">수정</button>        
        
    </div>
    <div class="modal_add_layer" style="position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5); z-index:-1;"></div>
</div>

<!-- ---------------------------------------- -->
<!-- -----------직원 수정 끝--------------------- -->
<!-- ---------------------------------------- -->	

<!-- ------------------------------------------- -->
<!-- -----------직원 보기-------------------------- -->
<!-- ------------------------------------------- -->	
<div id="modal_view" style="display:none; position:relative; width:100%; height:100%; top:0; left:0; z-index:1;">
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
</div>
<!-- ------------------------------------------- -->
<!-- -----------직원 보기 끝------------------------ -->
<!-- ------------------------------------------- -->	

<script>
	//메인화면에서 추가 버튼 클릭
	document.getElementById("modal_add_open_btn").onclick = function() {
		document.getElementById("modal_add").style.display="block";
		document.getElementById("add_input_name").focus();
	}
	//메인화면에서 수정 버튼 클릭
	document.getElementById("modal_modify_open_btn").onclick = function() {
		document.getElementById("modal_modify").style.display="block";
		input_modify();
		document.getElementById("modify_vo_id").value="125";
		document.getElementById("modify_input_name").focus();
	}
	//메인화면에서 보기 버튼 클릭
	document.getElementById("modal_view_open_btn").onclick = function() {
		document.getElementById("modal_view").style.display="block";
		input_view();
	}
	//추가화면에서 추가 버튼 클릭
	document.getElementById("modal_add_apply_btn").onclick = function() {		
		if (confirm("추가하시겠습니까?") == true){
			//추가 이벤트 실행
			document.getElementById("add_form").submit();
			//추가 이벤트 이후 레이아웃 닫기
			close_add_layout();
		}		
	}
	
	//수정화면에서 수정 버튼 클릭
	document.getElementById("modal_modify_apply_btn").onclick = function() {		
		if (confirm("수정하시겠습니까?") == true){
			//수정 이벤트 실행
			document.getElementById("modify_form").submit();
			//수정 이벤트 이후 레이아웃 닫기
			close_modify_layout();
		}		
	}
	
	//상세보기에서 삭제버튼 클릭
	document.getElementById("modal_view_delete_btn").onclick = function() {		
		if (confirm("삭제하시겠습니까?") == true){
			//삭제 이벤트 실행
			document.getElementById("view_form").submit();
			//삭제 이벤트 이후 레이아웃 닫기
			close_view_layout();
		}		
	}
	
	//상세보기에서 수정버튼 클릭
	document.getElementById("modal_view_modify_btn").onclick = function() {		
		close_view_layout();
		input_modify();
		document.getElementById("modal_modify").style.display="block";		
		document.getElementById("modify_input_name").focus();
	}
	
	//수정 화면에 값 입력
	function input_modify(){
		view_table=document.getElementById("view_table");
		document.getElementById("modify_input_name").value=view_table.rows[0].cells[1].innerText;
		document.getElementById("modify_input_birthday").value=view_table.rows[1].cells[1].innerText;
		document.getElementById("modify_input_initday").value=view_table.rows[2].cells[1].innerText;
		document.getElementById("modify_input_rank").value=view_table.rows[3].cells[1].innerText;
		document.getElementById("modify_input_location").value=view_table.rows[4].cells[1].innerText;
		var selected_num="0";
		switch(view_table.rows[5].cells[1].innerText){
			case "사법등기심의관실": 	selected_num="0"; break; 
			case "가족관계등록과":		selected_num="1"; break;
			case "부동산등기과":		selected_num="2"; break;
			case "재외국민가족관계과":	selected_num="3"; break;		
		}
		document.getElementById('modify_select').value=selected_num;
		document.getElementById("modify_input_officenum").value=view_table.rows[6].cells[1].innerText;
		document.getElementById("modify_input_phonenum").value=view_table.rows[7].cells[1].innerText;
		document.getElementById("modify_vo_id").value=document.getElementById("view_vo_id").value;
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
	
	//검색목록 테이블 클릭 이벤트
	//document.getElementById("officer_list").onclick= function(){
	$("#officer_list tr").click(function(){
		var tdArr = new Array();		
		var td = $(this).children();
		
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});
		alert(tdArr[2]);
	});
	
	
	//입력된 내용 초기화
	function clear_input(){
		var el = document.getElementsByClassName('form-control');
		for(var i=0; i<el.length; i++){
			el[i].value = '';
		}
		document.getElementById('add_select').value='0';
		document.getElementById('modify_select').value='0';
	}
	
	//직원 추가 화면 닫기
	function close_add_layout(){
		document.getElementById("modal_add").style.display="none";
		clear_input();
	}
	
	//직원 수정 화면 닫기
	function close_modify_layout(){
		document.getElementById("modal_modify").style.display="none";
		clear_input();
	}
	
	//직원 상세보기 화면 닫기
	function close_view_layout(){
		document.getElementById("modal_view").style.display="none";
		clear_input();
	}

</script>
			
		
	
</body>
</html>
