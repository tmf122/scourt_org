<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
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
				<button class="btn btn-outline-secondary dropdown-toggle"
					type="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Dropdown</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">이름</a> 
					<a class="dropdown-item" href="#">직급</a> 
					<a class="dropdown-item" href="#">소속</a>
					<a class="dropdown-item" href="#">전화번호</a>
					<div role="separator" class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Separated link</a>
				</div>
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
	<button class="btn btn-default pull-right"type="button" id="modal_opne_btn" style="width:80px">추가</button>
</div>

		<table class="table table-hover">
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
	
<div id="modal" style="display:none; position:relative; width:100%; height:100%; top:0; left:0; z-index:1;">
    <div class="modal_content" style="position:fixed; width:30%; min-width:400px;left:50%; transform:translate(-50%, -100%); padding:20px 10px; background:#fff; border:2px solid #666;">
       <h3 align="center">사법등기국 조직도::직원 추가</h3><br>
       <table class="table table-bordered">
			<tr>
				<td align="center" style="vertical-align:middle">성명</td>
				<td> <input type="text" class="form-control" name="name" maxlength="10"> </td>
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
		<button type="button" class = "btn btn-default pull-right" id="modal_close_btn" style="display:inline-block; margin-left:10px; width:100px;">취소</button> 
		<button type="button" class = "btn btn-default pull-right" id="modal_add_btn" style="display:inline-block; width:100px;">추가</button>        
        
    </div>
    <div class="modal_layer" style="position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5); z-index:-1;"></div>
</div>

<!-- ---------------------------------- -->
<!-- -----------직원 추가 끝--------------- -->
<!-- ---------------------------------- -->	

<script>
	document.getElementById("modal_opne_btn").onclick = function() {
		document.getElementById("modal").style.display="block";
	}
	document.getElementById("modal_close_btn").onclick = function() {
		close_layout();
	}
	document.getElementById("modal_add_btn").onclick = function() {		
		if (confirm("추가하시겠습니까?") == true){
			<!-- 추가 이벤트 실행-->
			
			<!-- 추가이벤트 이후 레이아웃 닫기-->
			close_layout();
		}		
	}
	
	function clear_input(){
		var el = document.getElementsByClassName('form-control');
		for(var i=0; i<el.length; i++){
			el[i].value = '';
		}
		document.getElementById('add_select').value='0';
	}
	
	function close_layout(){
		document.getElementById("modal").style.display="none";
		clear_input();
	}
</script>
			
		
	
</body>
</html>
