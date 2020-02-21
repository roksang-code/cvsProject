<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script	src="../resources/js/Loginpage.js?v=<%=System.currentTimeMillis()%>"></script>

</head>
<body>
<div class="container-fluid  my-3">
		<div class="col-md-4 offset-md-4">
		<form action="LoginpagePost" method="post">
	
			<h1 align="center" style="padding-top: 25%; padding-bottom: 5%">POS시스템 로그인</h1>
			<div class="row"> 
				<div class="col input-group input-group-lg">
					<input  class="form-control" placeholder="아이디" aria-label="아이디" type="text" name="id">
				</div>
			</div>
			
			<div class="row my-2"> 
				<div class="col input-group input-group-lg">
					<input class="form-control" placeholder="비밀번호" aria-label="비밀번호" type="password" name="pw">
				</div>
			</div>
			<div class="my-1">
					<button  class="btn btn-dark btn-lg btn-block" type="submit" style=" padding-right: 1%;">로그인</button>
			</div>
	</form>
			<div>
				<button  class="btn btn-light btn-lg btn-block" id="join">회원가입</button>
			</div>
			<div>
				<a href="mainPage"  class="btn btn-light btn-lg btn-block">메인페이지</a>
			</div>
		</div>
</div>	
	<script type="text/javascript">
	
	</script>
	

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>