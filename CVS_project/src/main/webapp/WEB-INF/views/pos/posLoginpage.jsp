<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/posLoginpage.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="../resources/js/posLoginpage.js?v=<%=System.currentTimeMillis()%>"></script>

</head>
<body>
<form action="posLoginpage" method="post">
	ID : <input type="text" name="id"></br>
	PW : <input type="text" name="pw"></br>
	<input type="submit" value="로그인"></form><button id="join">회원가입</button>
	
	
	


</body>
</html>