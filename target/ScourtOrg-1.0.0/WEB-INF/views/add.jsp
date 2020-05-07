<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-bordered table-hover id="addtable">
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
</body>
</html>