<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/posPayment.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript" src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script	src="../resources/js/posPayment.js?v=<%=System.currentTimeMillis()%>"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<header>
	${login.member_name}님 환영합니다.<button class="logout">로그아웃</button>
	</header>
	<div>
		<div class="middle">
			<div class="mdlist">
				<table class="listtable" border="1" width=750px>
					<!-- 상품리스트 -->
					<thead>
					<tr class="thead-dark">
						<td width=2%>NO</td>
						<!-- 번호 -->
						<td width=20%>바코드</td>
						<!-- 바코드 -->
						<td width=20%>상품명</td>
						<!-- 상품명 -->
						<td width=5%>판매가</td>
						<!-- 가격 -->
						<td width=3%>수량</td>
						<!-- 수량 -->
						<td width=10%>할인</td>
						<!-- 할인 -->
						<td width=10%>합계</td>
						<!-- 합계 -->
					</tr>
					</thead>
					<tbody>
					
					
					</tbody>
				</table>
				<div class="listbutton">
					<button class="eaplus">수량</button>
					</br>
					<button class="deletemd">삭제</button>
					</br>
				</div>
			</div>

			
			<div class = "input">
				<input type="text" name="barcode_no" id="barcode_no"
					class="barcode_no">
				<button id=md_update>상품등록</button>
			</div>
		</div>
		<div class="bottom">
			<div class="functionkey">
				<!-- 간편키 -->
				<table class="functiontable" border="1" width=250px>
					<tr>
						<td width=25%>종량제</td>
						<td width=25%>비닐</td>
						<td width=25%>라이터</td>
						<td width=25%>복권</td>
					</tr>
					<tr>
						<td>비닐</td>
						<td>88010430</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>라이터</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>복권</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>신문</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>

			</div>

			<div class="printprice">
				<!-- 가격출력창 -->
				<table border="1">
					<tr >
						<td width = 30%>합계</td>
						<td width = 70% class="prnum"><a class="listTotalPr">0</a></td>
					</tr>
					<tr>
						<td>할인금액</td>
						<td class="prnum"><a class="listSalePr">0</a></td>
					</tr>
					<tr>
						<td>받을금액</td>
						<td class="prnum"><a class="listPaymentPr">0</a></td>
					</tr>
					<tr>
						<td>받은금액</td>
						<td class="prnum"><input type="text" class="listInputPr" id="listInputPr"
							size="20px"></td>
					</tr>
					<tr>
						<td>거스름돈</td>
						<td class="prnum"><a class="listOutputPr">0</a></td>
					</tr>
				</table>
			</div>
			
			
			<div class="numbotton">
				<!-- 숫자 및 결제버튼 -->
				<table border="1" class="numkey">
					<tr>
						<td class = "num">7</td>
						<td class = "num">8</td>
						<td class = "num">9</td>
						<td class="numright">전체선택</td>
					</tr>
					<tr>
						<td class = "num">4</td>
						<td class = "num">5</td>
						<td class = "num">6</td>
						<td class="numright">금액할인</td>
					</tr>
					<tr>
						<td class = "num">1</td>
						<td class = "num">2</td>
						<td class = "num">3</td>
						<td class="numright">(%)할인</td>
					</tr>
					<tr>
						<td class = "num">0</td>
						<td class = "num">00</td>
						<td>취소</td>
						<td class="changeEA">수량변경</td>
					</tr>
					<tr>
						<td>천원</td>
						<td>오천원</td>
						<td>만원</td>
						<td class="paymentList">판매내역</td>
					</tr>
					<tr class="payment">
						<td colspan="2">현금</td>
						<td colspan="2">카드</td>
					</tr>


				</table>
				<a class="keyview"></a>
			</div>
		</div>
	</div>


</body>
</html>