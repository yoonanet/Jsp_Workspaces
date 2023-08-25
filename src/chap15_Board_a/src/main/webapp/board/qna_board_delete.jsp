<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.board.db.BoardVO" %>

<% 
	BoardVO board = (BoardVO)request.getAttribute("boardData");
%>

<%
	String chack = request.getParameter("msg");

	if(chack == null){
			
	} else {
%>
		<script>
			alert("게시물 삭제에 실패하였습니다. 비밀번호를 확인해주세요!");
			javascript:history.go(-1);
		</script>	
<%
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script language="javascript">
	function replyboard(){
		boardform.submit();
	}
</script>
</head>
<body>

<form action="./BoardDeleteAction.bo?num=<%= board.getBoardNum() %>" method="post" name="boardform">
	<table cellpadding="0" cellspacing="0"> 
		<tr align="center" valign="middle"> 
			<td colspan="2">게시물을 삭제하시겠습니까? </td>
		</tr>
		<tr>
			<td style="font-family: 돋움; font-size: 12;" height="16">
				<div align="center">작성자</div>
			</td>
			<td>
				<%= board.getBoardName() %>
			</td>
		</tr>
		<tr>
			<td style="font-family: 돋움; font-size: 12;" height="16">
				<div align="center">제  목</div>
			</td>
			<td>
				<%= board.getBoardSubject() %>
			</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height:1px"></td> 
		</tr>
		<tr>
			<td style="font-family: 돋움; font-size: 12;">
				<div align="center">내  용</div>
			</td>
			<td style="font-family: 돋움; font-size: 12;">
				<table width="490" height="250" style="table-layout:fixed"> 
					<tr>
						<td valign="Top" style="font-family: 돋움; font-size: 12;">
							<%= board.getBoardContent() %>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height:1px"></td> 
		</tr>

		<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">비밀번호</div> 
		</td>
		<td>
			<input name="boardPass" type="password">
		</td>
		</tr>
		
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height:1px"></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td> 
		</tr>
		<tr align="center" valign="middle">
			<td colspan="2"> 
				<font size="2">
					<a href="javascript:replyboard()">[삭제]</a>&nbsp;&nbsp;
					<a href="./BoardList.bo">[취소]</a>
				</font>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>