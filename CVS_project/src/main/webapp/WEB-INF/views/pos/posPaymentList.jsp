<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/posPaymentList.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="../resources/js/posPaymentList.js?v=<%=System.currentTimeMillis()%>"></script>

</head>
<body>
<header class="paymentdate">
	
  <div class="datepicker">  <input type="text" id="paymentdate"></div>
  <div class="pospage"><form action="posPayment" method="get">
			<button>포스화면</button></form></div>
</header>
	<div class="totaltable">
		<div>
			<table border="1" class="mainlisttable">
				<tr>
					<th>거래번호</th>
					<th>거래시간</th>
					<th>상품수</th>
					<th>매출</th>
				</tr>
				<c:forEach var="Pos_boardVO" items="${PaymentList}">
					<tr class="mainlist">
						<td class="list_no">${Pos_boardVO.list_no}</td>
						<td>${Pos_boardVO.sale_time}</td>
						<td>${Pos_boardVO.list_md_ea}</td>
						<td>${Pos_boardVO.total_price}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div>

			<table border="1" class="detaillisttable">
				<tr>
					<th>상품명</th>
					<th>수량</th>
					<th>금액</th>
					<th>할인</th>
				</tr>
				<tr class="detaillist">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>

		</div>

	</div>

</body>
</html>