<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script src ="../resources/js/reply.js?v=<%=System.currentTimeMillis() %>"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	
	<h2>Ajax Test Page</h2>

	<div>
		<div>
			게시판 번호 : <input type="text" name="bno" id="newBno"> 
		</div>
		<div>
			댓글 작성자 : <input type="text" name="replyer" id="newReplyWiter">
		</div>
		<div>
			댓글 내용 : <textarea rows="5" cols="30" name="replytext" id="newReplyText"></textarea>
		</div>
		<input type="button" id="replyAddBtn" value="댓글추가">
	</div>
		<ul id="replies"></ul>
	<div id="modDiv">
		<div class="modal-title"></div>
		<div><input type="text" id="replytext"> </div>
		<div>
			<button type="button" id="replyModBtn">수정</button>
			<button type="button" id="replyDelBtn">삭제</button>
	 		<button type="button" id="replyCloseBtn">닫기</button>
		</div>
		
	</div>
	

</body>
</html>