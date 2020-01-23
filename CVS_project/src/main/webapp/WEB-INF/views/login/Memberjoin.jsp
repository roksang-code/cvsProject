<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../resources/css/Memberjoin.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="../resources/js/Memberjoin.js?v=<%=System.currentTimeMillis()%>"></script>

</head>
<body>
	<form action="Memberjoin" method="post">
	<center> <h1>회원가입</h1></center>

	<table>
		<tr>
			<td class="b">이름(필수)</td>
			<td><input type="text" id="nmtext" name="member_name" size="15px" required="required"></td>
		</tr>
		<tr>
			<td class="b">아이디(필수)</td>
			<td><input type="text" id="idtext" name="id" size="15px" required="required" onkeyup="idch()"><a id="idtext2"></a></td>
		</tr>
		<tr>
			<td class="b">비밀번호(필수)</td>
			<td><input type="password" id="pwtext" name="pw" size="15px" required="required" onkeyup="pwch()"><a id="pwtext2"></a></td>
		</tr>
		<tr>
			<td class="b">비밀번호확인(필수)</td>
			<td><input type="password" id="pwtext3" size="15px" required="required" onkeyup="pwch2()"><a id="pwtext4"></a></td>
		</tr>
		<tr>
			<td class="b">이메일</td>
			<td><input type="text" name="email1" id="emtext1" size="15px">@
				<input type="text" name="email2" id="emtext2" size="15px">
				<input type="hidden" id="email" name="email">		
				<select id="selectemail">
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
			<td><input type="radio" id="sexc" name="gender" value="남자">남자
			<input type="radio" id="sexc" name="gender" value="여자">여자</td>
		</tr>
		
		<tr>
			<td class="b">생년월일</td>
			<td>
			  <input type="text" id="age1">-<input type="password" id="age2">
			  <input type="hidden" id="age" name="age">
			</td>
		</tr>
		<tr>
			<td colspan="2" class="b"><input type="submit" value="회원가입" id ="join"> </td>
		</tr>
		
		

	</table>


	</form>
</body>
</html>