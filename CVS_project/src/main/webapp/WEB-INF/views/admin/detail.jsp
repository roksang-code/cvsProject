<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<form id="detailForm" method="post" action="update" enctype="multipart/form-data">
		<div class="container">
			
			<input type="hidden" name="no" id = "no" value="${boardVO.no}">
			<input type="hidden" name="pageNum" id="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="keyword" id="keyword" value="${cri.keyword}">
			
			<h1 style="padding-top: 5%; padding-bottom: 3%;">글수정</h1>
			<table class="table table-hover" style="width: 100%;">
			 <thead>
				<tr>
					<td style="width: 10%;">글번호</td> <td id="board_no">${boardVO.no}</td>
				</tr>
			 </thead>
				<tr>
				 	<td>제목 </td>	<td><input class="form-control" type="text" name="subject" value="${boardVO.subject}" size="137px;"></td>
				</tr>
				<tr>
				 	<td>내용</td>	
				 	<td>
				 		<div class="form-control" id="writeTextarea" style="width: 100%; height: 300px"></div>
							<input type='hidden' name='content' id='content' />
					</td>
				</tr>
				<tr>
					<td>작성자 </td> <td> ${boardVO.writer}</td>
				</tr>	
				<tr> 
					<td>파일</td> 
					<td>
						<input id ="files" class="form-control" type="file" name="filename"> 
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
				
			<a class="btn btn-secondary"  href="adminMain?no=${boardVO.no}&pageNum=${cri.pageNum}&keyword=${cri.keyword}&type=list">목록</a>
			<input class="btn btn-secondary" type="submit" value="글수정"> 
			<button class="btn btn-secondary" type="button" id="delete_board">글삭제</button>
		</div>	
	</form>
<script>

	$('#writeTextarea').attr('contentEditable', 'true');

	var ctent = '${boardVO.content}';
	console.log(ctent);
	$("#writeTextarea").html(ctent);

	$("#delete_board").on("click", function name(){
		
		var no = $("#board_no").html();
		var pageNum =  $("#pageNum").val();
		var keyword =  $("#keyword").val();
		
		$.ajax({

			type : "DELETE",
			url : "delete/"+no,
			success : function(data) {
				$(location).attr('href', "adminMain?pageNum="+pageNum+"&keyword="+keyword+"&type=list");
			},
			error : function(err) {
				alert("등록에 실패했습니다.");
			}
   

		});
		
		
	});
	
</script>