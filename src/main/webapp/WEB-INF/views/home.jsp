<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.scourt.iros.service.OfficerVO"%>
<html>
<head>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<header>
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container d-flex justify-content-between">
				<a href="#" class="navbar-brand d-flex align-items-center"> <i
					class="fa fa-address-book"></i> <strong class="col-md-3">사법등기국
						조직도</strong>
				</a>
			</div>
		</div>
	</header>

	<div class="container">
		<form action="/ScourtOrg/search" id="search_form" target="iframe">
			<div class="input-group p-4">
				<div class="input-group-prepend">
					<select class="btn btn-outline-secondary dropdown-toggle"
						name="option" id="search_select">
						<option value="name" selected>이름</option>
						<option value="rank">직급</option>
						<option value="department">소속</option>
						<option value="number">전화번호</option>
					</select>
				</div>


				<input type="text" class="form-control" placeholder="검색어를 입력해주세요."
					aria-describedby="button-addon2" name="keyword" id="keyword">
				<input type="text" name="page" style="display: none" id=search_page>

				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"
						id="search_btn" onclick="searchClick()">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>

		</form>


		<div id="content">
			<!--  버튼  -->
			<button class="btn btn-primary pull-right" type="button"
				id="modal_add_open_btn" style="margin-bottom: 8px; margin-left: 8px">추가</button>
			<iframe src="#" name="iframe"
				style="width: 1px; height: 1px; border: 0; visibility: hidden;">
			</iframe>
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

				<c:forEach var="result" items="${resultList}">
					<tr id="resultList">
						<td class="listtd"><c:out value="${result.id}" /></td>
						<td class="listtd"><c:out value="${result.rank}" /></td>
						<td class="listtd"><c:out value="${result.name}" /></td>
						<td class="listtd"><c:out value="${result.departmentName}" /></td>
						<td class="listtd"><c:out value="${result.location}" /></td>
						<td class="listtd"><c:out value="${result.officeNum}" /></td>
						<td style="display: none"><c:out value="${result.id}" /></td>
						<td style="display: none"><c:out value="${result.birthday}" /></td>
						<td style="display: none"><c:out value="${result.initday}" /></td>
						<td style="display: none"><c:out value="${result.phoneNum}" /></td>
					</tr>
				</c:forEach>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination pagination-sm justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
					class="sr-only">Previous</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
					class="sr-only">Next</span>
			</a></li>
		</ul>
	</nav>

	<!-- 직원 추가 -->
	<div id="modal_add" class="container"
		style="display: none; position: relative; width: 100%; height: 100%; top: 0; left: 0; z-index: 1;">
		<%@ include file="add.jsp"%>
	</div>

	<!-- 직원 수정 -->
	<div id="modal_modify" class="container"
		style="display: none; position: relative; width: 100%; height: 100%; top: 0; left: 0; z-index: 1;">
		<%@ include file="modify.jsp"%>
	</div>

	<!-- 직원 상세보기 -->
	<div id="modal_view" class="container"
		style="display: none; position: relative; width: 100%; height: 100%; top: 0; left: 0; z-index: 1;">
		<%@ include file="view.jsp"%>
	</div>

	<script>
	
	//메인화면에서 추가 버튼 클릭
	document.getElementById("modal_add_open_btn").onclick = function() {
		document.getElementById("modal_add").style.display="block";
		document.getElementById("add_input_name").focus();
	}

	function searchClick() {
		//document.getElementById('search_page').value="1";
		document.getElementById("search_form").submit();
		setTimeout(function(){
		    window.location.reload();
		},100)
	}
			
	//검색목록 테이블 클릭 이벤트
	//document.getElementById("officer_list").onclick= function(){
	$("#officer_list tr").click(function(){
		var tdArr = new Array();		
		var td = $(this).children();
		
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});
		table=document.getElementById("view_table");
		//0-이름, 1-생일, 2-임용일, 3-직급, 4-위치, 5-부서, 6-사무실, 7-핸드폰
		table.rows[0].cells[1].innerText=tdArr[2];
		table.rows[1].cells[1].innerText=tdArr[7];
		table.rows[2].cells[1].innerText=tdArr[8];
		table.rows[3].cells[1].innerText=tdArr[1];
		table.rows[4].cells[1].innerText=tdArr[4];
		table.rows[5].cells[1].innerText=tdArr[3];
		table.rows[6].cells[1].innerText=tdArr[5];
		table.rows[7].cells[1].innerText=tdArr[9];
		//alert(""+tdArr[2]);
		document.getElementById("view_vo_id").value=tdArr[6];
		document.getElementById("modal_view").style.display="block";
	});
		

</script>



</body>
</html>
