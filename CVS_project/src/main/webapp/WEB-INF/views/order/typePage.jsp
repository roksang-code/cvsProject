<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet"	href="../resources/css/typePage.css?v=<%=System.currentTimeMillis()%>"> -->
<link rel="stylesheet"	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css?v=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js?v=<%=System.currentTimeMillis()%>"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?v=<%=System.currentTimeMillis()%>"></script>
<script	src="../resources/js/typePage.js?v=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
<script type="text/javascript">
$("#button-addon2").on("click",function(){

	alert(type);
});	

</script>
	<div class="container-fluid">
		<div class="input-group-append">

			<div class="row no-gutters" style="padding-bottom: 1%; padding-top: 2%;">
			
				<div class="col-4">			
					<a class="a"></a>
					
				</div>
				<div class="col-7">			
				  
				  <input type="text" class="form-control" placeholder="상품을 입력해주세요" id="mdname" aria-describedby="mdsearch">
				
				</div>
				
				<div class="col-1">			
				
				  <button class="btn btn-outline-secondary" type="button" id="mdsearch">검색</button>
		
				</div>
		
			</div>
		</div>

		<div class="row no-gutters border" style="width:100%; height: 600px; overflow-x:hidden; overflow-y:scroll; ">
			<div class="col-12">
					<table class="table table-bordered align-middle" id="detailtypetable" style="width: 100%;">
  					<thead class="thead-light">
						<tr>
							<th width=25%>바코드번호</th>
							<th width=15%>상품타입</th>
							<th width=15%>제조사</th>
							<th width=20%>상품명</th>
							<th width=15%>유통기한</th>
							<th width=10%>발주 수량</th>
						</tr>
						
					</thead>	
					</table>
			</div>		
		</div>
		<div class="align-div-bottom" style="float: right; padding-top: 2px;">
		
			<div class="row" style="width:100%; height: 10%;">
				
				<div class="col-12">
				
					<button class="btn btn-outline-secondary" type="button" id="order_button">적용</button>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>