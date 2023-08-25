<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.board.db.BoardVO" %>

<%
BoardVO board=(BoardVO)request.getAttribute("boardData");
%>

<!DOCTYPE html>
<html>
<head>
<title>MVC 게시판</title>

<script language="javascript">
	function replyboard(){
		boardform.submit();
	}
</script>

</head>
<body>

<!-- 게시판 답변: 댓글도 게시글이기 때문에 DB에 저장해줘야 한다.(DB와의 연동이 일어나는 요청임) -->
<form action="./BoardReplyAction.bo" method="post" name="boardform"> <!-- 비밀번호의 노출이 되면 안되기 때문에 post방식으로 처리함 -->
<input type="hidden" name="boardNum" value="<%=board.getBoardNum() %>"> <!-- 요청이오면 서버로 값을 감춰서 값을 보내주고 있는 것임. (지금 현재 게시물에 대한 일련번호를 보내고 있음) -->

<!-- 입력양식태그에서 type의 속성이 hidden: 화면상에 아무 것도 보이지 않도록하는 속성이다.
     => 눈에는 보이지 않게끔 화면을 구성했지만 댓글에 대한 등록버튼을 누르면 댓글 관련되어 기존에 있던 정보가 다시 서버로 전송이 되어지게 할 목적인 것이다. -->
<input type="hidden" name="boardReplyRef" value="<%=board.getBoardReplyRef() %>">
<input type="hidden" name="boardReplyLev" value="<%=board.getBoardReplyLev() %>">
<input type="hidden" name="boardReplySeq" value="<%=board.getBoardReplySeq() %>">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="2">MVC 게시판</td> 
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">작성자</div>
		</td>
		<td>
			<input name="boardName" type="text"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="boardSubject" type="text" size="50" 
				maxlength="100" value="Re: <%=board.getBoardSubject() %>"/> <!-- value속성은 입력양식태그 text타입에서 디폴트로 작성됨(작성된 내용을 바꿀 수 있음) -->
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="boardContent" cols="67" rows="15"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">비밀번호</div> <!-- 답변 수정 작업에서 본인확인을 하기 위해서 비밀번호 작성란을 만듦. -->
		</td>
		<td>
			<input name="boardPass" type="password">
		</td>
	</tr>
	
	<tr bgcolor="#cccccc">
		<td colspan="2" style="height:1px;"> 
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr> <!-- 한줄 띄어쓰기 -->
	
	<tr align="center" valign="middle">
		<td colspan="2">
		<a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 답변 -->

</body>
</html>