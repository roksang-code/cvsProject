<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form id="registerForm" method="post" enctype="multipart/form-data">
	
	<div class="container">
				<h1 style="padding-top: 5%; padding-bottom: 3%;">글쓰기</h1>
			<table class="table table-hover" style="width: 100%;">
					
					<tr>
					 	<td>제목 </td><td><input class="form-control" type="text" name="subject" size="137px;"></td>
					</tr>
					<tr>
					 	<td>내용</td>	<td><textarea class="form-control" rows="15" cols="40" name="content"></textarea></td>
					</tr>
					<tr>
						<td>작성자 </td> <td> <input class="form-control" type="text" name="writer"></td>
					</tr>	
					<tr> 
						<td>파일</td> <td><input class="form-control" type="file" name="files"></td>
					</tr>
			</table>
		
		<a class="btn btn-secondary btn-sm" tabindex="-3" role="button" href="register?no=${boardVO.no}&pageNum=${cri.pageNum}&keyword=${cri.keyword}&type=list">목록</a>
		
		

		
				<input style="float: right;" class="btn btn-secondary" type="submit" formaction="register" value="글쓰기">
	
	<div class="fileDrop"></div>
	<div class="upLoadedList"></div> 
	</div>
</form>
	