<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

	$(document).on("click", "#check_list_table tr td button", function(){//상세승인
	
		var check_barcode_no = $(this).attr("id");
		
				$.ajax({
					
					type : "get",
					url : "check_md?barcode_no="+check_barcode_no+"&member_no="+member_no,
					contentType : "application/json;charset=utf-8",
					dataType : "text",
					success : function(data) {

						check_list(member_no);
			
					},
					error : function(err) {
			
						alert("등록에 실패했습니다.");
					}
			
			
				});
	
	
	});
</script>

<div class="container">
	
		<div style=" height: 800px; overflow-x:hidden; overflow-y:scroll ">
	
			<table class='table table-bordered' id='check_list_table'>
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