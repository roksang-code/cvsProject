<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


		<div class="container-fluid">
			
			<input type="hidden" name="no" value="${boardVO.no}">
			<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
			
			<h1 style="padding-top: 2%; padding-bottom: 3%;">공지사항</h1>
			<table class="table table-hover" style="width: 90%;">
			 <thead>
				<tr>
					<td style="width: 10%;">글번호</td> <td> ${boardVO.no}</td>
				</tr>
			 </thead>
				<tr>
				 	<td>제목 </td> <td><input class="form-control" type="text" name="subject" value="${boardVO.subject}" size="137px;"></td>
				</tr>
				<tr>
				 	<td>내용</td>	<td><textarea class="form-control" rows="10" cols="40" name="content">${boardVO.content}</textarea></td>
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
			
			<a class="btn btn-secondary btn-sm" tabindex="-3" role="button" href="notice_detail?no=${boardVO.no}&pageNum=${cri.pageNum}&keyword=${cri.keyword}&type=list">목록</a>
			
		</div>	
