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
				 	<td>내용</td>	<td>
		 		 		<div class="form-control" id="writeTextarea" style="width: 1020px; height: 300px"></div>
						<input type='hidden' name='content' id='content' />
	
				 	</td>
				</tr>
				<tr>
					<td>작성자 </td> <td> ${boardVO.writer}</td>
				</tr>	
				<tr> 
					<td>파일</td> 
					<td>	
						<c:choose>
							<c:when test="${files != null}">
								<a href="../displayFile?fileName=${files}">${files}</a>		
							</c:when>
						</c:choose>	
						<div class="upLoadedList"></div> 						
										
					</td>
				</tr>
				<tr> 
					<td>조회수</td> <td>${boardVO.cnt}</td>
				</tr>
			</table>
			
			<a class="btn btn-secondary btn-sm" tabindex="-3" role="button" href="OrderMain?no=${boardVO.no}&pageNum=${cri.pageNum}&keyword=${cri.keyword}&type=list">목록</a>
			
		</div>	
		
<script>


	var ctent = '${boardVO.content}';
	console.log(ctent);
	$("#writeTextarea").html(ctent);

	
	
</script>