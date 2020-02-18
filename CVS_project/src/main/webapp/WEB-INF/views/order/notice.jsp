<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  	
  		<div class="container-fluid">
				
				
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
									<td><a href="notice_detail?no=${boardVO.no}&pageNum=${pageMaker.cri.pageNum}&keyword=${pageMaker.cri.keyword}">${boardVO.subject}</a></td>
									<td>${boardVO.writer}</td>
									<td>${boardVO.write_date}</td>
									<td>${boardVO.cnt}</td>
								</tr>
 							 </c:forEach>
						    </tbody>
						</table>	
					<div class="w3-bar">
						<c:if test="${pageMaker.prev}">
							<a href="#" class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="notice?pageNum=${pageMaker.startPage-1}&keyword=${pageMaker.cri.keyword}">&laquo;</a>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<a href="#" class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="notice?pageNum=${idx}&keyword=${pageMaker.cri.keyword}">${idx}</a>

						</c:forEach>

						<c:if test="${page.next}">
							<a href="#" class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="notice?pageNum=${pageMaker.endPage +1}&keyword=${pageMaker.cri.keyword}">&raquo;</a>
						</c:if>
					</div>
					
				</div>