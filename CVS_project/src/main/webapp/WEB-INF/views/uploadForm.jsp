<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	iframe {
	width: 0px;
	height: 0px;
	border: 0px
}
</style>
</head>
<body>

	<form id="form1" action="uploadForm" method="post"
		enctype="multipart/form-data">
		<input type="file" name="file"> 
		<input type="submit" value="업로드">
	</form>
	<div name="zeroFrame"></div>
	<script type="text/javascript">
		function addFilePath(msg) {
			alert(msg);
			document.getElemetById("form1").reset();
		}
	</script>
</body>
</html>