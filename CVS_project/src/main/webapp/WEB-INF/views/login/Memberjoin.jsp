<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script	src="../resources/js/Memberjoin.js?v=<%=System.currentTimeMillis()%>"></script>

</head>
<body>
	<div class="container-fluid  my-3">
		<div class="col-md-6 offset-md-3">
			<form action="Memberjoin" method="post">
			
			<h1 align="center" style="padding-top: 10%; padding-bottom: 5%;">회원가입</h1>
					<table class="table">
						<tr>
							<td class="b">이름(필수)</td>
							<td><input class="form-control" type="text" id="nmtext" name="member_name" size="15px" required/></td>
						</tr>
						<tr>
							<td class="b">아이디(필수)</td>
							<td><input class="form-control" type="text" id="idtext" name="id" size="15px" onkeyup="idch()" required/><a id="idtext2"></a></td>
						</tr>
						<tr>
							<td class="b">비밀번호(필수)</td>
							<td><input class="form-control" type="password" id="pwtext" name="pw" size="15px" onkeyup="pwch()" required/><a id="pwtext2"></a></td>
						</tr>
						<tr>
							<td class="b">비밀번호확인(필수)</td>
							<td><input class="form-control" type="password" id="pwtext3" size="15px" onkeyup="pwch2()" required/><a id="pwtext4"></a></td>
						</tr>
						
							<tr>
								<td class="b">이메일(필수)</td>
								<td class="input-group input-group-sm">
									<input class="form-control" type="text" name="email1" id="emtext1" size="30%" required/>@
									<input class="form-control" type="text" name="email2" id="emtext2" size="30%" required/>
									<input class="form-control" type="hidden" id="email" name="email">		
									<select class="custom-select-sm" id="selectemail">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="daum.net">daum.net</option>
									</select>
									
								</td>
								
							</tr>
							
							<tr>
								<td class="b">성별(필수)</td>
								<td>
										<div class="custom-control custom-radio custom-control-inline">
											<input class="custom-control-input"  id="customRadioInline1" type="radio" name="gender" value="남자" required/>
											<label class="custom-control-label" for="customRadioInline1">남자</label>
										</div>
										<div class="custom-control custom-radio custom-control-inline">
											<input class="custom-control-input"  id="customRadioInline2" type="radio" name="gender" value="여자"/>
											<label class="custom-control-label" for="customRadioInline2">여자</label>
										</div>
										
								</td>
							</tr>
							
							<tr>
								<td class="b">주민등록번호(필수)</td>
								<td class="input-group input-group-sm">
								  <input class="form-control" type="text" id="age1" required/>-<input class="form-control" type="password" id="age2" required/>
								  <input type="hidden" id="age" name="age"/>
								</td>
							</tr>
						<tr>
							<td colspan="2">
							
									<input class="btn btn-secondary btn-lg btn-block my-1" type="submit" value="회원가입" id ="join">
									<a href="LoginpageGet" class="btn btn-light btn-lg btn-block">로그인페이지</a>
							
							</td>
							
						</tr>
						
						
				
					</table>
				
			</form>
		</div>
	</div>
	
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
</body>
</html>