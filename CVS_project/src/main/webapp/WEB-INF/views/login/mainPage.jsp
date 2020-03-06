<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script	src="../resources/js/mainPage.js?v=<%=System.currentTimeMillis()%>"></script>
</head>
<body style="background : #6CC0FF;">

<div class="container" style="margin-top: 5%;">
	 
	<div class="row justify-content-md-center">
			 <img src="../resources/img/logo.png" style="margin-right: 20px;"></img><a style="color: white; text-align: center; font-size: 150px;"> WEB_POS</a>
	</div>
	<div class="row" style=" margin-top: 8%;">
		<div class="col-4">
			<button type="button" class="btn btn-primary btn-lg" id="pospage" style="width: 300px;height: 300px;">
			<img src="../resources/img/payment.png" style="width: 150px; height: 150px;"><p style="margin-top: 25px;">상품판매</p></button>
		
		</div>		
		<div class="col-4">
			<button type="button" class="btn btn-primary btn-lg" id="order" style="width: 300px;height: 300px;">
			<img src="../resources/img/order.png" style="width: 150px; height: 150px;"><p style="margin-top: 25px;">상품발주</p></button>
		
		</div>		
		<div class="col-4">
			<button type="button" class="btn btn-primary btn-lg" id="logout" style="width: 300px;height: 300px">
			<img src="../resources/img/login.png" style="width: 150px; height: 150px;">
			
				<p style="margin-top: 25px;">
				<c:if test="${login.member_name ==null}">
					<c:out value="로그인"></c:out>		
				</c:if>
				<c:if test="${login.member_name !=null}">
					<c:out value="로그아웃"></c:out>		
				</c:if>
				</p>
				
			</button>
		
		</div>		
	</div>
		
		
			
</div>
<script type="text/javascript">
	
	
	$("#join").on("mouseenter", function(){
		$("#email").val($("#emtext1").val()+"@"+$("#emtext2").val());
		$("#age").val($("#age1").val()+"-"+$("#age2").val());
	});
</script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>