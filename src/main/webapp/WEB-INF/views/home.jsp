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
	
<!-- 직원 추가 -->	
<div id="modal_add" class="container" style="display:none; position:relative; width:100%; height:100%; top:0; left:0; z-index:1;">   
    <%@ include file ="add.jsp"%>
</div>

<!-- 직원 수정 -->
<div id="modal_modify" class="container" style="display:none; position:relative; width:100%; height:100%; top:0; left:0; z-index:1;">
     <%@ include file ="modify.jsp"%>
</div>

<!-- 직원 상세보기 -->
<div id="modal_view" class="container" style="display:none; position:relative; width:100%; height:100%; top:0; left:0; z-index:1;">
 	 <%@ include file ="view.jsp"%>
</div>

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
		

</script>
			
		
	
</body>
</html>
