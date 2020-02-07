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
		<a id="membername">${login.member_name}님 환영합니다.</a>
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

		<div id="modalLayer">	<!-- 단축키 검색 모달창 -->
			<div class="modalContent">
				<div>
					<input type="text" class="md_search_data"><input
						type="submit" value="검색" class="md_search">
				</div>
				<div class="search_info"></div>
				
				<div class="modalclose"><button type="button" class="close">X</button></div>
			</div>
		</div>

		
		<div id="point_save_modal">	<!-- 포인트 적립 모달창 -->
			<div class="save_modalContent">
				<div>
					<input type="text" class="point_save_data"><input
						type="submit" value="조회" class="member_no_search">
				</div>
				<div class="member_no_info"></div>
				<div class="modalclose">
					<button type="button" class="close">X</button>
				</div>
			</div>
		</div>
		
		<div id="tel_dis_modal">	<!-- 통신사 할인 모달창 -->
			<div class="tel_modalContent">
				<div>
					<select class="tel_com" name="tel_com">
					   	<option value="">통신사</option>
					   	<option value="SKT">SKT</option>
					   	<option value="KT">KT</option>
					   	<option value="LG">LG</option>
					</select>
					<input type="text" class="tel_membership_no_data"><input
						type="submit" value="조회" class="tel_search">
				</div>
				<div class="tel_membership_info"></div>
				
				<div class="modalclose">
					<button type="button" class="close">X</button>
				</div>
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
				<input type="hidden" id ="ignore_sale">
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
						<td class="numright" id="point_save">포인트 적립</td>
					</tr>
					<tr>
						<td class="num">1</td>
						<td class="num">2</td>
						<td class="num">3</td>
						<td class="numright" id="tel_discount">통신사 할인</td>
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
		var pr_ea_list = new Array();
		var parent = new Array();
		var children = new Array();
		var idname="";
		var ignore_sale=0;

		
		
		
		function appendMD(barcode_no) {//상품등록

				var str = "";
				var ealist = new Array();

				$.getJSON("posList?barcode_no=" + barcode_no, function(data) {
								console.log(data);
					
								
								
								
						$(data).each(function() {
									bar = $("." + barcode_no+ "").text();
								
									
									if(isNaN(parseInt(this.pr_type)) == false ){//n+m 증정행사
										

										console.log("this.promotion_no = "+this.promotion_no);
										pr_ea_list.push(this.promotion_no);
										
								      
										var pr_ea_list_length = pr_ea_list.filter(pr_ea_list => pr_ea_list == this.promotion_no).length;
										
											console.log("pr_ea_list_length = "+pr_ea_list_length);	
											
										  
										if(pr_ea_list_length%this.pr_ea==0){
											
											sale = (this.price) - minus_sale;
											minus_sale += sale;																
											ignore_sale += (sale*this.pr_ea);
											console.log("sale = "+sale);	
													
										}
										
										prea=0;
										prc=null;
										trid="";	
										
									
										
									}else if(this.pr_type == "세트할인"){	//세트할인
										
										console.log("this.pr_family = "+this.pr_family);

										console.log("this.promotion_no = "+this.promotion_no);
										if(this.pr_family == "parent"){
											parent.push(this.promotion_no);
										}else if(this.pr_family == "children"){
											children.push(this.promotion_no);
										}
										console.log("parent = "+parent[0]);
										

								      
										var parent_length = parent.filter(parent => parent == this.promotion_no).length;
										var children_length = children.filter(children => children == this.promotion_no).length;
										
											console.log("parent_length = "+parent_length);	
											console.log("children_length = "+children_length);	
											console.log("family_length = "+(parent_length+children_length));	
											if((parent_length - children_length) > 0){
												var tosale = "parent";
											}else{
												var tosale = "children";
											}
										if( parent_length == children_length || tosale != this.pr_family){
											
											sale = this.pr_price - minus_sale;
											minus_sale += sale;																
											ignore_sale += (sale*this.pr_ea);
											console.log("sale = "+sale);	
													
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
												
											       
												        ealist.push(parseInt($("#"+trid).find(".md_ea").text()));
													      	
												      
														function sumOfValues(x, y) {
															return x + y;
														}
												        
												        var ealength = parseInt(ealist.reduce(sumOfValues)); 
												        
												        console.log("list = "+(ealength+1));    
											}
										}	
												  if((ealength+1)%this.pr_ea==0){
													        console.log("cnt" + cnt);    

															console.log("ealist.length = "+ealist.length);
															
															
															for(var i=0;i<cnt-1;i++){
													        	trid = $("#no"+(i+1)).attr("id");
																
																if($("#"+trid).find(".pr_no").text()==this.pr_content){
																	
																	if($("#"+trid).attr("id") != null){
															        	console.log("for문");    
															        	var tr_p =parseInt($("#"+trid).find(".price").text());//리스트 정가
														    			var tr_ea = parseInt($("#"+trid).find(".md_ea").text());//리스트 수량

															        	var afterpr_sale= parseInt($("#"+trid).find(".sale").text());
													    				
														    			if(this.barcode_no==$("#"+trid).find("."+this.barcode_no).text()){
														    				tr_ea++;
														    			}
															        	var pr_sale = parseInt((tr_p - this.pr_price)*tr_ea); //현재 할인된 가격
														    			$("#"+trid).find(".sale").text((tr_p-parseInt(this.pr_price))*tr_ea);	//할인가격
														    			$("#"+trid).find(".a_trtotal_price").text(parseInt(this.pr_price)*tr_ea);	//총가격													    		
														    		
	
																		console.log("totalpr = "+(tr_p-parseInt(this.pr_price))*tr_ea);
																		console.log("totalsale = "+parseInt(this.pr_price)*tr_ea);
																	
																		console.log("trid = "+$("#"+trid).attr("id"));

																		totalsale += pr_sale-afterpr_sale;
																		ignore_sale += tr_p*tr_ea;		
																	}														
																	
																}
															
															
												 	       }
														
															
													
											}
										
										
									
										prea=0;
										prc=null;
										trid="";	
								}	
									
									
								if (bar == barcode_no) { //바코드번호가 같을 때
									console.log("이전 가격 = "+$("#"+ barcode_no + "total").text());
									
										
										var after_sale = parseInt($("#"+ barcode_no + "sale").text());
										if(sale>0){
										
											$("#"+ barcode_no + "sale").text(after_sale+sale);
										
										}
										ead = parseInt($("."+ barcode_no+ "ea").text()) + 1; //수량 +1
										
										pricet = parseInt($("."+ barcode_no + "pr").text()) * ead;
											$("."+ barcode_no + "ea").text(ead);//수량
										if(this.pr_type == "묶음행사" && (ealength+1)%4!=0){	
											console.log("이전 가격 = "+$("#"+ barcode_no + "total").text());
											$("#"+ barcode_no + "total").text(parseInt($("#"+ barcode_no + "total").text())+this.price);//합계
										
										}else{
											$("#"+ barcode_no + "total").text(pricet-(after_sale+sale));//합계		
										}
											
											totalpr += parseInt($("."+ barcode_no+ "pr").text());
											totalsale +=  sale;
										
								}else {	//바코드번호가 다를 때

									
											str += "<tr id='no"+cnt+"'>";
											str += "<td id=cnt"+cnt+" class = cnt> "+ cnt + "</td>";
											str += "<td> <a id=bar"+cnt+" class='"+this.barcode_no+"'>"+ this.barcode_no+ "</a></td>";
											str += "<td> <a class="+this.md_name+">"+ this.md_name+"</a>";
										if(this.pr_subject != null && this.pr_content != null){
												str += "<label style='color: red'>"+"&nbsp;&nbsp;"+this.pr_subject+"&nbsp;&nbsp;<a class='pr_no' id='pr_no"+(this.promotion_no)+"'>"+this.pr_content+"</a></label>";
											}
											str += "</td>";
											str += "<td class='price'> <a class="+this.barcode_no+"pr>"+ this.price+ "</a></td>";
											str += "<td class='md_ea' id=tdea"+cnt+"> <a id=ea"+cnt+" class="+this.barcode_no+"ea>"+ ea+ "</a></td>";
								        if(this.pr_type == "묶음행사" && (ealength+1)%4==0){

											str += "<td> <a id="+this.barcode_no+"sale class='sale'>"+parseInt(this.price-this.pr_price)+"</a></td>";
											str += "<td id=ea"+cnt+"xPrice class='trtotal_price'> <a id="+this.barcode_no+"total class ='a_trtotal_price'>"+ this.pr_price +"</a></td>";
											
											totalsale += parseInt(this.price-this.pr_price);

											ignore_sale += this.price;		

								        }else{
								    		str += "<td> <a id="+this.barcode_no+"sale class='sale'>"+sale+"</a></td>";
								    		str += "<td id=ea"+cnt+"xPrice class='trtotal_price'> <a id='"+this.barcode_no+"total' class ='a_trtotal_price'>"+ (this.price*ea-sale) +"</a></td>";
											        	
								        }							
														
											str += "</tr>";

												cnt++;
												totalpr += parseInt(this.price);
												totalsale +=  sale;

								
								
								
										        console.log("str문");    

								}
								
							
							       
							        
							        
									$(".listTotalPr").text(totalpr); //리스트 총합계
									$(".listSalePr").text(totalsale); //할인금액
									$(".listPaymentPr").text(totalpr - totalsale); //합계-할인금액

									var inputPr = parseInt($(".listInputPr").val());
									var totalPr = parseInt($(".listTotalPr").text());

									if (inputPr < totalPr) {
											$(".listOutputPr").text(0); //받은돈 - 합계
									}
							
						});
						
						console.log("append minus_ea = "+minus_sale);

						sale=0;
						minus_sale=0;
						$(".listtable").append(str);
						$("#ignore_sale").val(ignore_sale);
						
						
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