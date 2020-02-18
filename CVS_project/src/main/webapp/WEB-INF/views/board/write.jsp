<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/upload.css?v=<%=System.currentTimeMillis() %>">
</head>
<body>
<form id="registerForm" method="post" enctype="multipart/form-data">
<h1> 글쓰기를 하기 위한 폼입니다. </h1>

제목 : <input type="text" name="subject"></br>
내용 : <textarea rows="10" cols="20" name="content"></textarea></br>
작성자 : <input type="text" name="writer"></br>
파일 : <input type="file" name="filename">
<input type="submit" value="글쓰기" formaction="register">

<div class="fileDrop"></div>
<div class="upLoadedList"></div> 
</form>

<script type="text/javascript" src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script src ="../resources/js/uploadwrite.js?v=<%=System.currentTimeMillis() %>"></script>

</body>
</html>