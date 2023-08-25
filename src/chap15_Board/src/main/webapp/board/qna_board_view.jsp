<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.board.db.BoardVO" %>

<% 
	BoardVO board = (BoardVO)request.getAttribute("boardData");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>

</head>
<body><%-- shift + tab => 앞으로 땡겨지는 단축키 --%>
	<!-- 게시판 상세 화면 --> 
	<table cellpadding="0" cellspacing="0"> 
		<tr align="center" valign="middle"> 
			<td colspan="2">MVC 게시판</td>
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
			<td colspan="2" style="height:1px"></td> <!-- 중간에 일직선 긋기 -->
		</tr>
		<tr>
			<td style="font-family: 돋움; font-size: 12;">
				<div align="center">내  용</div>
			</td>
			<td style="font-family: 돋움; font-size: 12;">
				<table width="490" height="250" style="table-layout:fixed"> <!-- table-layout:fixed => 테이블을 고정시킴 : 간단하게 테이블 안에 테이블을 만듦 -->
					<tr>
						<td valign="Top" style="font-family: 돋움; font-size: 12;">
							<%= board.getBoardContent() %>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height:1px"></td> <!-- 중간에 일직선 긋기 -->
		</tr>
		<tr>
			<td style="font-family: 돋움; font-size: 12;" height="16"> 
				<div align="center">첨부파일&nbsp;</div>
			</td>
			<td style="font-family: 돋움; font-size: 12;" height="16">
				
				<% if(board.getBoardFile() != null){ %>
					<a href="./BoardDownload.bo?path=<%= board.getBoardFile() %>">		
						<%= board.getBoardFile() %> <%-- 파일의 제목을 출력 => 클릭 시 다운로드되도록 연결시켜줘야함(다시 서버에 요청하면 됨 -> 그 요청은 앵커로 처리) --%>
					</a>	
				<%		
					}
				%>
				
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
					<a href="./BoardReplyView.bo?num=<%= board.getBoardNum() %>">[답변]</a>&nbsp;&nbsp; 
					<!-- 댓글을 달게 되면 순차적으로 저장이 되지만 그것을 리스트화면으로 출력할 때의 부분이 댓글에서의 포인트임.(DB에서의 저장순서랑 다름.)
					     ***댓글의 화면은 최소의 정보로 하여금 꾸며주도록 한다. -->
					<a href="./BoardUpdateView.bo?num=<%= board.getBoardNum() %>">[수정]</a>&nbsp;&nbsp;
					<a href="./BoardDeleteView.bo?num=<%= board.getBoardNum() %>">[삭제]</a>&nbsp;&nbsp;
					<a href="./BoardList.bo">[목록]</a>
				</font>
			</td>
		</tr>
	</table>

</body>
</html>