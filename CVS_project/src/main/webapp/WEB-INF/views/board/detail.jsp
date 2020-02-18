<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post">
		<input type="hidden" name="no" value="${boardVO.no}">
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		
		<h1>글수정</h1>
		<table class="table table-bordered">
			<tr>
				<td style="width: 10%">글번호</td> <td  style="width: 10%"> ${boardVO.no}</td>
			</tr>
			<tr>
			 	<td>제목 </td>	<td><input type="text" name="subject" value="${boardVO.subject}"></td>
			</tr>
			<tr>
			 	<td>내용</td>	<td><textarea rows="10" cols="20" name="content">${boardVO.content}</textarea></td>
			</tr>
			<tr>
				<td>작성자 </td> <td> ${boardVO.writer}</td>
			</tr>	
			<tr> 
				<td>파일</td> <td>${boardVO.files}</td>
			</tr>
			<tr> 
				<td>조회수</td> <td>${boardVO.cnt}</td>
			</tr>
		</table>
		
		<input type="submit" value="목록" formaction="list" formmethod="get">
		<input type="submit" value="글수정" formaction="update"> 
		<input type="submit" value="글삭제" formaction="delete">

	</form>
</body>
</html>