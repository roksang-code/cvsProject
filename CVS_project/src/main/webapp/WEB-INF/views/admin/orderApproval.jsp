<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container-fluid">
	<div class="row">
		<div class="col1" style="width:45%; height: 600px; overflow-x:hidden; overflow-y:scroll ">
	
			<table class='table table-bordered' id='approval_list_table'>
				<thead class='thead-light'>
					<tr>
						<th>매장번호</th>
						<th>수량</th>
						<th>원가 합계</th>
						<th>정가 합계</th>
						<th>전체 승인</th>
					</tr>
				</thead>
			</table>
			
		</div>
		<div class="col2" style="width:45%; height: 600px; padding-left:40px; overflow-x:hidden;  overflow-y:scroll ">
	
			<table class='table table-bordered' id='approval_detail_list_table'>
				<thead class='thead-light'>
					<tr>
						<th>바코드번호</th>
						<th>상품명</th>
						<th>원가</th>
						<th>정가</th>
						<th>수량</th>		
						<th>발주승인</th>				
					</tr>
				</thead>	
			</table>
			
		</div>
	</div>	
</div>