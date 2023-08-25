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
			alert("비밀번호를 확인해주세요!");
			javascript:history.go(-1);
		</script>	
<%
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>

<script type="text/javascript">
	function addboard() { 
		boardform.submit(); 
	}
</script>
</head>
<body>
	
	<form action="<%= request.getContextPath() %>/BoardUpdateAction.bo" name="boardform" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="<%= board.getBoardNum() %>">
		
		<table cellpadding="0" cellspacing="0"> 
			<tr align="center" valign="middle"> 
				<td colspan="5">MVC 게시판</td>
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
				<td style="font-family:돋움; font-size:12">
					<div align="center">비밀번호</div> 
				</td>
				<td>
					<input name="boardPass" type="password">
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋움; font-size: 12;" height="16">
					<div align="center">제  목</div>
				</td>
				<td>
					<input name="boardSubject" type="text" size="50" 
				maxlength="100" value="<%=board.getBoardSubject() %>"/>                     
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋움; font-size: 12;">
					<div align="center">내  용</div>
				</td>
				<td>
					<textarea rows="15" cols="70" name="boardContent"></textarea> 
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋움; font-size: 12;" height="16"> 
					<div align="center">파일 첨부</div>
				</td>
				<td>
					<input type="file" name="BoardFile">
				</td>
			</tr>
			<tr bgcolor="#cccccc"> 
				<td colspan="2" style="height: 1px"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td> 
			</tr>
			<tr align="center" valign="middle">
				<td colspan="5"> 
					<a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp; 
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>