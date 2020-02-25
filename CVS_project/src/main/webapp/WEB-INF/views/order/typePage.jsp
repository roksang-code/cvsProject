<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>




	<div class="container-fluid">
		<div class="input-group-append">

			<div class="row no-gutters" style="padding-bottom: 1%; padding-top: 2%;">
			
				<div class="col-4">			
					<a class="a"> </a>
					
				</div>
				<div class="col-7">			
				
				  <input type="text" class="form-control" placeholder="상품을 입력해주세요" id="mdname" aria-describedby="mdsearch">
				
				</div>
				
				<div class="col-1">			
				
				  <button class="btn btn-outline-secondary" type="button" id="mdsearch">검색</button>
		
				</div>
		
			</div>
		</div>
		
		<input id="member_no" type="hidden" value="${login.member_no}">
		<div class="row no-gutters border" style="width:100%; height: 600px; overflow-x:hidden; overflow-y:scroll; ">
			<div class="col-12 ">
					<table class="table table-bordered text-center" id="detailtypetable" style="width: 100%; text-align: center;">
  					<thead class="thead-light">
						<tr>
							<th width=15%>바코드번호</th>
							<th width=30%>사진</th>
							<th width=10%>상품타입</th>
							<th width=10%>제조사</th>
							<th width=15%>상품명</th>
							<th width=10%>원가</th>
							<th width=10%>정가</th>
							<th width=10%>유통기한</th>
							<th width=10%>예정수량</th>
							<th width=10%>발주 수량</th>
						</tr>		
					</thead>	
					</table>
			</div>		
		</div>
		<div class="align-div-bottom" style="float: right; padding-top: 2px;">
		
			<div class="row" style="width:100%; height: 10%;">
				
				<div class="col-12">
				
					<button class="btn btn-outline-secondary" type="button" id="order_button">적용</button>
				</div>
			</div>
		</div>
		
	</div>
