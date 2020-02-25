<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<head>


</head>
<body id="page-top">

				<div class="container">
				<h1 style="padding-top: 30px; padding-bottom: 20px;">공지사항</h1>
				
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
				
						  </tfoot>
						  <tbody>
						      <c:forEach var="boardVO" items="${list}">
								<tr>
									<td>${boardVO.no}</td>
									<td><a href="detail?no=${boardVO.no}&pageNum=${pageMaker.cri.pageNum}&keyword=${pageMaker.cri.keyword}&type=detail">${boardVO.subject}</a></td>
									<td>${boardVO.writer}</td>
									<td>${boardVO.write_date}</td>
									<td>${boardVO.cnt}</td>
								</tr>
 							 </c:forEach>
						    </tbody>
						</table>
					<div class="row">	
						<div class="col-9">	
							<a class="btn btn-primary btn active" role="button" aria-pressed="true" href="register?no=${boardVO.no}&pageNum=${pageMaker.cri.pageNum}&keyword=${pageMaker.cri.keyword}&type=write">글쓰기</a>
						</div>
						<div class="col-3">	
						
						<form action="list_page" method="get"
							class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
							<div class="input-group-append" style="padding-bottom: 20px;">
								<input type="text" name="keyword" class="form-control">
								<div class="input-group-append">
									<input type="submit" value="검색">
								</div>
							</div>
						</form>
						</div>
					</div>
					
					<div class="pagination">
						<c:if test="${pageMaker.prev}">
							<a class="page-link" href="list_page?pageNum=${pageMaker.startPage-1}&keyword=${pageMaker.cri.keyword}">&laquo;</a>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<a class="page-link" href="list_page?pageNum=${idx}&keyword=${pageMaker.cri.keyword}">${idx}</a>

						</c:forEach>

						<c:if test="${page.next}">
							<a class="page-link" href="list_page?pageNum=${pageMaker.endPage +1}&keyword=${pageMaker.cri.keyword}">&raquo;</a>
						</c:if>
					</div>
					
				</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>

</html>

