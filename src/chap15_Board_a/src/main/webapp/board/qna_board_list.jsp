<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%@ page import="net.board.db.BoardVO" %>  
    
<%
	List boardList = (List)request.getAttribute("boardlist");

	//[페이징 처리를 위한 데이터]
	int nowpage = ((Integer)request.getAttribute("page")).intValue(); //현재 보여줄 페이지에 대한 정보임
	//intValue메소드를 활용하여 메서드 체이닝 방식으로 int형으로 반환할 수 있게끔 바로 꺼내오도록 한다.
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int listCount = ((Integer)request.getAttribute("listCount")).intValue(); //데이터의 총 갯수
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
</head>
<body>
	<!-- 게시판의 리스트 화면 -->	
	<table align="center" width="80%" cellpadding="0" cellspacing="0"> 
		<tr align="center" valign="middle">
			<td colspan="4">MVC 게시판</td>
			<td align="right"><font size="2">글 개수 : ${ listCount }</font></td>
		</tr>
		<tr align="center" valign="middle">
			<td style="font-family:Tahoma; font-size:8pt;" width="8%" >
				<div align="center">번호</div>
			</td>
			<td style="font-family:Tahoma; font-size:8pt;" width="50%" >
				<div align="center">제  목</div>
			</td>
			<td style="font-family:Tahoma; font-size:8pt;" width="14%" >
				<div align="center">작성자</div>
			</td>
			<td style="font-family:Tahoma; font-size:8pt;" width="17%" >
				<div align="center">날짜</div>
			</td>
			<td style="font-family:Tahoma; font-size:8pt;" width="11%" >
				<div align="center">조회수</div>
			</td>
		</tr>
		
		<%-- 데이터의 갯수만큼 행을 추가해가면서 리스트 항목들을 반복 출력을 해주도록 한다. jstl의 foreach문으로 반복시켜도 됨.
		     리스트는 저장순서를 유지하다보니 get메소드를 통해 데이터를 꺼내올 수 있었음 --%>
		<%
			for(int i=0; i < boardList.size(); i++) { 
				BoardVO bl = (BoardVO)boardList.get(i);
		%>
		
		<tr align="center" valign="middle"> 
			<td style="font-family:Tahoma; font-size:10pt;" height="23">
				<%= bl.getBoardNum() %>
			</td>
			<td style="font-family:Tahoma; font-size:10pt;">
				<div align="left">
				<!-- 댓글에 레벨에 대한 들여쓰기를 하기 위해 조건문을 추가하도록 한다. 
				     => 원글에 관한 것이면 0, 원글에 대한 댓글은 1, 대댓글이라면 2가 반환될 것임 -->
				<%  if(bl.getBoardReplyLev() != 0) { //원글이 아니라면
						for(int j=0; j <= bl.getBoardReplyLev()*2; j++){ //레벨에 담겨진 값에서 *2로 하여 반복하는 횟수만큼 여백을 주도록 하는 것임.
							out.println("&nbsp;"); 
						}
						out.println("▶");
					}else{
						out.println("▶");
					}
				%>
					<a href="./BoardDetailAction.bo?num=<%= bl.getBoardNum() %>"><%-- ?다음으로 이름을 넣어주면 입력양식태그에서 name을 작성한 것과 동일한 효과 --%>
						<%= bl.getBoardSubject() %> <%-- ***게시물의 제목이 클릭할 때마다 조회수가 증가되어 갯수는 보관되어야 할 것이다. --%>
					</a>
				</div>
			</td>
			<td align="center" style="font-family:Tahoma; font-size:10pt;">
				<%= bl.getBoardName() %>
			</td>
			<td align="center" style="font-family:Tahoma; font-size:10pt;">
				<%= bl.getBoardDate() %>
			</td>
			<td align="center" style="font-family:Tahoma; font-size:10pt;">
				<%= bl.getBoardReadCount() %>
			</td>
		</tr>
		
		<%	
			}
		%>
		
		<tr align="center" height="20" style="font-family:Tahoma; font-size:10pt;">
			<!-- 페이징에 대한 기능을 추가. (페이징에서 클릭된 번호를 다시 전송하는 방식으로 화면을 구현해줘야함) -->
			<td colspan="5">
				
				<!-- 이전페이지 처리: 1번페이지일 때는 아무런 이벤트도 발생되지 않도록 해야한다. 2번 이후 페이지부터 활성화하도록 한다. -->
				<%  if(nowpage <= 1){ //현재 페이지가 1이하라면
						out.println("[이전]&nbsp;"); //별도의 링크없이 텍스트형태로만 출력을 해주게끔 처리
					}else{ //2페이지 이상이라면, 이전이기 때문에 하나 적은 값으로 요청하도록 한다.
				%>
						<a href="./BoardList.bo?page=<%= nowpage - 1 %>">[이전]</a>		
				<%	} %>
				
				
				<!-- 페이징처리된 번호를 보여줘야 함: 현재 페이지는 텍스트로 처리하고, 눌리지 않은 페이지들은 화면과 링크를 연결시켜주면서 눌린 페이지로 정보가 바뀌도록 함. -->
				<%
					for(int i=startPage; i <= endPage; i++) { //페이지에 대한 정보가 i변수에 담긴 것임.
						if(i == nowpage){ //눌린 화면이 현재 페이지랑 같으면.
							out.println("[" + i + "]");
						}else{ //만약에 현재 페이지가 아니라면 => 링크를 걸어서 이동할 수 있도록 처리를 해야함.
				%>
				
							<a href="./BoardList.bo?page=<%= i %>">[<%= i %>]</a>&nbsp;
							
				<%			
						}
					}
				%>
				
				
				<!-- 다음페이지 처리: 이전페이지와 처리로직은 동일 -->
				<% 
					if(nowpage >= endPage){
						out.println("[다음]");
					}else{
				%>
						<a href="./BoardList.bo?page=<%= nowpage + 1 %>">[다음]</a>	
				<%	} %>
				
			</td>
		</tr>
		<tr align="right">
			<td colspan="5">
				<a href="./BoardWrite.bo">[글쓰기]</a>
			</td>
		</tr>
	</table>
		
</body>
</html>