<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../resources/css/freeze_food.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"
	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="../resources/js/freeze_food.js?v=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<div class="row">

		<div class="col-5">
		<div class="input-group mb-3">

		<div class="col-3">			
		<div class="input-group-append">
		  
			<select class="custom-select" id="inputGroupSelect04">
				<option selected>전체</option>
				<option value="1">아이스크림</option>
				<option value="2">즉석식품</option>
			</select>
		</div>
		</div>
		<div class="input-group-append">
		  
		  <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
		</div>
		  <div class="input-group-append">
		    <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
		  </div>
		</div>
		</div>
	</div>
</body>
</html>