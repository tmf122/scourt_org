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
		
<button class="btn btn-default" data-target="#layerpop1" data-toggle="modal">모달출력버튼</button><br/>
<div class="modal fade" id="layerpop1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">Header</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            Body
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<button type="button" class="btn btn-default pull-right" data-target="#layerpop" data-toggle="modal">추가</button>  	
<div class="modal fade" id="layerpop">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-title">사법등기국 조직도::직원 추가</div>
			<div class="modal-body">
				<table class="table table-bordered" id="addtable">
					<tr>
						<td>성명</td>
						<td> <input type="text" name="name" maxlength="10"> </td>
					</tr>
					
					<tr>
						<td>생년월일</td>
						<td> <input type="date" name="birthday"> </td>
					</tr>
					
					<tr>
						<td>현부서 임용일</td>
						<td> <input type="date" name="initday"> </td>
					</tr>
					
					<tr>
						<td>직위(직급)</td>
						<td> <input type="text" name="rank"> </td>
					</tr>
					
					<tr>
						<td>소속부서</td>
						<td>
							<select name="department">
								<option value="0" selected>사법등기심의관실</option>
								<option value="1">가족관계등록과</option>
								<option value="2">부동산등기과</option>
								<option value="3">재외국민가족관계과</option>
							</select>
						</td>
					</tr>
				
					<tr>
						<td>사무실 위치</td>
						<td> <input type="text" name="location" maxlength="20"> </td>
					</tr>
				
					<tr>
						<td>사무실 전화번호</td>
						<td> <input type="text" name="office_number" maxlength="20"> </td>
					</tr>
					
					<tr>
						<td>핸드폰 전화번호</td>
						<td> <input type="text" name="phone_number" maxlength="20"> </td>
					</tr>
				</table> 
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary pull-right mb-2" date-toggle="modal" data-target="#exampleModal" onclick="alertAdd();"> 추가</button>
				<button type="button" class="btn btn-default" date-dismiss="modal">취소</button>
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
	
	
		
	
</body>
</html>
