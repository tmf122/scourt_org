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
		<button type="button" class="btn btn-primary pull-right mb-2" date-toggle="modal" data-target="#modal-add">추가</button>
		

<!-- Modal -->
<div class="modal fade" id="modal-add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
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
</body>
</html>
