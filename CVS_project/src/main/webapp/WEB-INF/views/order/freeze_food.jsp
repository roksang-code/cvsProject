<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet"	href="../resources/css/freeze_food.css?v=<%=System.currentTimeMillis()%>"> -->
<link rel="stylesheet"	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css?v=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js?v=<%=System.currentTimeMillis()%>"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?v=<%=System.currentTimeMillis()%>"></script>
<script	src="../resources/js/freeze_food.js?v=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="input-group-append">

			<div class="row no-gutters" style="padding-bottom: 1%">
			
				<div class="col-4">			
					<select class="custom-select" id="inputGroupSelect04"  aria-describedby="mdname">
						<option value ="" selected>전체</option>
						<option value="아이스크림">아이스크림</option>
						<option value="즉석식품">즉석식품</option>
					</select>
				</div>
				<div class="col-7">			
				  
				  <input type="text" class="form-control" placeholder="상품을 입력해주세요" id="mdname" aria-describedby="mdsearch">
				
				</div>
				
				<div class="col-1">			
				
				  <button class="btn btn-outline-secondary" type="button" id="mdsearch">검색</button>
		
				</div>
				  
			</div>
		</div>
		
		<div class="row" style="width:100%; height: 80%;">
			<div class="col-11">
				<div id="tableLayer" style="overflow-x:hidden; overflow-y:scroll; height:2000%;">
		
					<table border="1" id="detailtypetable" style="width: 100%">
						<tr>
							<th width=25%>바코드번호</th>
							<th width=15%>상품타입</th>
							<th width=15%>제조사</th>
							<th width=20%>상품명</th>
							<th width=15%>유통기한</th>
							<th width=10%>발주 수량</th>
						</tr>
						
					</table>
				</div>
			</div>		
			<div class="col-1">
			</div>
		</div>
		<div class="row" style="width:100%; height: 10%;">
			
			<div class="col-8">
			</div>
			<div class="col-2">
			
				<button class="btn btn-outline-secondary" type="button" id="order_button">적용</button>
		
			</div>
		</div>
	</div>
</body>
</html>