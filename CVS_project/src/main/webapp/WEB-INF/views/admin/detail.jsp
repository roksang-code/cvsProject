<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<form method="post">
		<div class="container">
			
			<input type="hidden" name="no" value="${boardVO.no}">
			<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
			
			<h1 style="padding-top: 5%; padding-bottom: 3%;">글수정</h1>
			<table class="table table-hover" style="width: 100%;">
			 <thead>
				<tr>
					<td style="width: 10%;">글번호</td> <td> ${boardVO.no}</td>
				</tr>
			 </thead>
				<tr>
				 	<td>제목 </td>	<td><input class="form-control" type="text" name="subject" value="${boardVO.subject}" size="137px;"></td>
				</tr>
				<tr>
				 	<td>내용</td>	<td><textarea class="form-control" rows="15" cols="40" name="content">${boardVO.content}</textarea></td>
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
				
			<input class="btn btn-secondary" type="submit" value="목록" formaction="detail?no=${boardVO.no}&pageNum=${cri.pageNum}&keyword=${cri.keyword}&type=list" formmethod="get">
			<input class="btn btn-secondary" type="submit" value="글수정" formaction="update"> 
			<input class="btn btn-secondary" type="submit" value="글삭제" formaction="delete">
		</div>	
	</form>
