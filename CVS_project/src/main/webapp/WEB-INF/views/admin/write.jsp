<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form id="registerForm" action="register" method="post" enctype="multipart/form-data">
	
	<div class="container">
				<h1 style="padding-top: 5%; padding-bottom: 3%;">글쓰기</h1>
			<table class="table table-hover" style="width: 100%;">
					
					<tr>
					 	<td>제목 </td><td><input class="form-control" type="text" name="subject" size="137px;"></td>
					</tr>
					<tr>
					 	<td>내용</td>
					 		<td>
								<div class="form-control" id="writeTextarea" style="width: 1020px; height: 300px"></div>
								<input type='hidden' name='content' id='content' />
							</td>
					</tr>
					<tr>
						<td>작성자</td> <td> <input class="form-control" type="text" name="writer"></td>
					</tr>	
					<tr> 
						<td>파일</td> <td><input id ="files" class="form-control" type="file" name="filename"> 
							<div class="upLoadedList"></div> 						
						</td>
						
					</tr>
			</table>
	
		<a class="btn btn-secondary btn-sm" tabindex="-3" role="button" href="register?no=${boardVO.no}&pageNum=${cri.pageNum}&keyword=${cri.keyword}&type=list">목록</a>
		
		

		
				<input style="float: right;" class="btn btn-secondary" type="submit" value="글쓰기">
	
	</div>
</form>
	