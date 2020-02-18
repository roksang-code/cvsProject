<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<head>


</head>

<body id="page-top">

				<div class="container">
				
				
						<table class="table">
						  <thead class="thead-light">
						    <tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일자</th>
								<th>조회수</th>
							</tr>
						  </thead>
						  <tfoot>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일자</th>
								<th>조회수</th>
							</tr>
							<tr>
								<td colspan="6"><a href="register">글쓰기</a></td>
							</tr>
						  </tfoot>
						  <tbody>
						      <c:forEach var="boardVO" items="${list}">
								<tr>
									<td>${boardVO.no}</td>
									<td><a href="detail?no=${boardVO.no}&pageNum=${pageMaker.cri.pageNum}&keyword=${pageMaker.cri.keyword}">${boardVO.subject}</a></td>
									<td>${boardVO.writer}</td>
									<td>${boardVO.write_date}</td>
									<td>${boardVO.cnt}</td>
								</tr>
 							 </c:forEach>
						    </tbody>
						</table>	
					<div class="w3-bar">
						<c:if test="${pageMaker.prev}">
							<a class="w3-button" href="list?pageNum=${pageMaker.startPage-1}&keyword=${pageMaker.cri.keyword}">&laquo;</a>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<a class="w3-button" href="list?pageNum=${idx}&keyword=${pageMaker.cri.keyword}">${idx}</a>

						</c:forEach>

						<c:if test="${page.next}">
							<a class="w3-button" href="list?pageNum=${pageMaker.endPage +1}&keyword=${pageMaker.cri.keyword}">&raquo;</a>
						</c:if>
					</div>
					
				</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>

</html>

