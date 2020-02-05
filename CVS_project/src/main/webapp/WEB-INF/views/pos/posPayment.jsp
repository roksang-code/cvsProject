<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../resources/css/posPayment.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript"
	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script
	src="../resources/js/posPayment.js?v=<%=System.currentTimeMillis()%>"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<header>
		${login.member_name}님 환영합니다.
		<button class="logout">로그아웃</button>
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
							<td width=15%>바코드</td>
							<!-- 바코드 -->
							<td width=30%>상품명</td>
							<!-- 상품명 -->
							<td width=5%>판매가</td>
							<!-- 가격 -->
							<td width=4%>수량</td>
							<!-- 수량 -->
							<td width=5%>할인</td>
							<!-- 할인 -->
							<td width=7%>합계</td>
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


			<div class="input">
				<input type="text" name="barcode_no" id="barcode_no"
					class="barcode_no">
				<button id=md_update>상품등록</button>
			</div>
		</div>

		<div id="modalLayer">
			<div class="modalContent">
				<div>
					<input type="text" class="md_search_data"><input
						type="submit" value="검색" class="md_search">
				</div>
				<div class="search_info"></div>
				<button type="button" class="close">X</button>
			</div>
		</div>
		<div class="bottom">
			<div class="functionkey">

				<!-- 간편키 -->
				<table class="functiontable" border="1" width=250px>
					
					<c:forEach var="Functionkey_infoVO" items="${functionkeyList}" varStatus="no">
						
						<c:if test="${no.index%4 == 0 && no.index!=0}">
							</tr>
						</c:if>
						<c:if test="${no.index%4 == 0 || no.index==0}">
							<tr>
						</c:if>
	
							   <td width=25% id="${Functionkey_infoVO.key_no}"	class="fk${Functionkey_infoVO.barcode_no}">${Functionkey_infoVO.md_name}</td>
	
						<c:if test="${no.index == 15}">
							</tr>
						</c:if>
					
					</c:forEach>
										
					<tr class="igkey">
						<td class="leftbutton">〈</td>
						<td class="rightbutton">〉</td>
						<td colspan="2">키설정</td>

					</tr>
				</table>

			</div>

			<div class="printprice">
				<!-- 가격출력창 -->
				<table border="1">
					<tr>
						<td width=30%>합계</td>
						<td width=70% class="prnum"><a class="listTotalPr">0</a></td>
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
						<td class="prnum"><input type="text" class="listInputPr"
							id="listInputPr" size="20px"></td>
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
						<td class="num">7</td>
						<td class="num">8</td>
						<td class="num">9</td>
						<td class="numright">전체선택</td>
					</tr>
					<tr>
						<td class="num">4</td>
						<td class="num">5</td>
						<td class="num">6</td>
						<td class="numright">금액할인</td>
					</tr>
					<tr>
						<td class="num">1</td>
						<td class="num">2</td>
						<td class="num">3</td>
						<td class="numright">(%)할인</td>
					</tr>
					<tr>
						<td class="num">0</td>
						<td class="num">00</td>
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

	<script type="text/javascript">
		var cnt = 1; //리스트 등록 카운트
		var ea = 1; //첫 등록제품 수
		var sale = 0; //할인
		var bar = 0; //바코드번호 초기화
		var price = 0; //가격 초기화
		var ead = 0; //같은 상품 1개 증가
		var totalpr = 0; //가격 *수량
		var totalsale = 0;
		var eaid = ""; //수량 id
		var tpid = ""; //합계 id
		var eav = ""; //수량 값
		var tpv = ""; //합계 값
		var barcode_no = "";
		var key_no = "";
		var pageNum ="";
		var trid="";
		var prea=0;
		var prc="";
		var minus_sale=0;
		var ea_price = 0;
		var sale_switch = false;




		
		
		
		function appendMD(barcode_no) {//상품등록

				var str = "";
				var ealist = new Array();

				$.getJSON("posList?barcode_no=" + barcode_no, function(data) {
								console.log(data);
					
								
								
								
						$(data).each(function() {
									bar = $("." + barcode_no+ "").html();
								
									
									if(isNaN(parseInt(this.pr_type)) == false ){//n+m 증정행사
										prc = this.promotion_no;
								
										console.log("prc1 = "+prc);
											
										for(i=1;i<cnt;i++){
										
											trid = $("#no"+i).attr("id");
									
											console.log("trid = "+trid);

											console.log("prc2 = "+$("#"+trid).find("#pr_no"+prc).text());
												
											if($("#"+trid).find("#pr_no"+prc).text() == this.pr_content){
												
												console.log(parseInt($("#"+trid).find(".sale").text()));
												
												minus_sale += parseInt($("#"+trid).find(".sale").text());																
												console.log("minus_ea = "+minus_sale);

												prea += parseInt(($("#"+trid).find(".md_ea")).text());
												
												
												
													if((prea+1)%this.pr_ea==0){
														sale = (((prea+1)/this.pr_ea)*this.price) - minus_sale;
														console.log("sale = "+sale);	
														
													}
													
													
												
													
											}
												
													
										}
										
										prea=0;
										prc=null;
										trid="";	
									}else if(this.pr_type == "묶음행사" ){//묶음행사
										prc = this.promotion_no;
										
										console.log("prc1 = "+prc);
									
										 var ealist = new Array();
										for(var j=1;j<cnt;j++){
											
										        
											trid = $("#no"+j).attr("id");
									
											console.log("trid = "+trid);

											console.log("prc2 = "+$("#"+trid).find("#pr_no"+prc).text()+"=="+this.pr_content);
												
											if($("#"+trid).find("#pr_no"+prc).text() == this.pr_content){
												
												console.log(parseInt($("#"+trid).find(".sale").text()));
												
												minus_sale += parseInt($("#"+trid).find(".sale").text());																

												prea += parseInt(($("#"+trid).find(".md_ea")).text());
												
												
												       
												        ealist.push(parseInt($("#"+trid).find(".md_ea").text()));
												      	
												      
														function sumOfValues(x, y) {
															return x + y;
														}
												        
												        var ealength = parseInt(ealist.reduce(sumOfValues)); 
												        
												        console.log("list = "+(ealength+1));    
														
												        if((ealength+1)%4==0){
													        console.log("cnt" + cnt);    

															console.log("ealist.length = "+ealist.length);
															
															
															for(var i=0;i<cnt-1;i++){
													        	trid = $("#no"+(i+1)).attr("id");
																
																if($("#"+trid).find(".pr_no").text()==this.pr_content){	
																	if($("#"+trid).attr("id") != null){
															        	console.log("for문");    
															        	var tr_p =parseInt($("#"+trid).find(".price").text());
														    			var tr_ea = parseInt($("#"+trid).find(".md_ea").text());
														    		
															        	var pr_sale = tr_p*tr_ea - 2500*tr_ea;
															        	
														    			$("#"+trid).find(".sale").text(parseInt($("#"+trid).find(".sale").text()+pr_sale));	//할인가격
														    			$("#"+trid).find(".trtotal_price").text(2500*tr_ea);	//총가격													    		
														    		
	
																		console.log("totalpr = "+totalpr);
																		console.log("totalsale = "+totalsale);
																	
																		console.log("trid = "+$("#"+trid).attr("id"));


																	
																	}else{
															        	console.log("else문");    
	
																		
														    			$("#"+this.barcode_no+"sale").text(this.price-2500);	//할인가격
														    			$("."+this.barcode_no+"total").text(2500);	//총가격													    		
																		
																	}
																}
															}
															
															
															
												        }
												  		
												  
													
											}
												
													
										}
										
										prea=0;
										prc=null;
										trid="";	
									}			
									
									
									
								if (bar == barcode_no) { //바코드번호가 같을 때
									
										
										var after_sale = parseInt($("#"+ barcode_no + "sale").html());
										if(sale>0){
										
											$("#"+ barcode_no + "sale").html(after_sale+sale);
										
										}
										ead = parseInt($("."+ barcode_no+ "ea").html()) + 1;
										
										pricet = parseInt($("."+ barcode_no + "pr").html()) * ead;
											$("."+ barcode_no + "ea").html(ead);//수량
											
											$("."+ barcode_no + "total").html(pricet-(after_sale+sale));//합계
										
											totalpr += parseInt($("."+ barcode_no+ "pr").html());
											totalsale +=  sale;
										
								}else {	//바코드번호가 다를 때

									
											str += "<tr id='no"+cnt+"'>";
											str += "<td id=cnt"+cnt+" class = cnt> "+ cnt + "</td>";
											str += "<td> <a id=bar"+cnt+" class="+this.barcode_no+">"+ this.barcode_no+ "</a></td>";
											str += "<td> <a class="+this.md_name+">"+ this.md_name+"</a>";
											if(this.pr_subject != null && this.pr_content != null){
												str += "<label style='color: red'>"+"&nbsp;&nbsp;"+this.pr_subject+"&nbsp;&nbsp;<a class='pr_no' id='pr_no"+(this.promotion_no)+"'>"+this.pr_content+"</a></label>";
											}
											str += "</td>";
											str += "<td class='price'> <a class="+this.barcode_no+"pr>"+ this.price+ "</a></td>";
											str += "<td class='md_ea' id=tdea"+cnt+"> <a id=ea"+cnt+" class="+this.barcode_no+"ea>"+ ea+ "</a></td>";
											str += "<td> <a id="+this.barcode_no+"sale class='sale'>"+sale+"</a></td>";
										
											str += "<td id=ea"+cnt+"xPrice class='trtotal_price'> <a class="+this.barcode_no+"total>"+ (this.price*ea-sale) +"</a></td>";
											
											str += "</tr>";

												cnt++;
												totalpr += parseInt(this.price);
								
								
								
								
										        console.log("str문");    

								}
								
							
							       
							        
							        
									$(".listTotalPr").html(totalpr); //리스트 총합계
									$(".listSalePr").html(totalsale); //할인금액
									$(".listPaymentPr").html(totalpr - totalsale); //합계-할인금액

									var inputPr = parseInt($(".listInputPr").val());
									var totalPr = parseInt($(".listTotalPr").html());

									if (inputPr < totalPr) {
											$(".listOutputPr").html(0); //받은돈 - 합계
									}
							
						});
						
						console.log("append minus_ea = "+minus_sale);

						sale=0;
						minus_sale=0;
						$(".listtable").append(str);
				});

		}
		
		function functionkey(pageNum, color) {//단축키 페이징
			
		
			$.getJSON("functionButton?pageNum="+pageNum,function(data) {
				

				 var str = "<table class='functiontable' border='1' width=250px>";
				if(color==null){
					color="rgba(0, 0, 0, 0)";
				}
				$(data).each(function(index,data) {
					//index는 객체 키, data는 객체 값

				if(index%4 == 0 && index!=0){
					str+="</tr>";
				}if(index%4 == 0 && index==0){
					str+="<tr>";
				}
					str += "<td width=25% style='background-color: "+color+"' id="+data.key_no+" class='fk"+data.barcode_no+"'>"+data.md_name+"</td>";
				if(index==15){
						str+="</tr>";
				}
				});
				str += "<tr class='igkey'>";
				str += "<td class='leftbutton'>〈</td>";
				str += "<td class='rightbutton'>〉</td>";
				str += "<td colspan='2'>키설정</td></tr>";
				str += "</table>";
				
				
				$(".functiontable").html(str);
				
			});
		

			
		}
	</script>




</body>
</html>