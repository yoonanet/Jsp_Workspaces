<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<form action="<%= request.getContextPath() %>/BoardAddAction.bo" name="boardform" method="post" enctype="multipart/form-data"> <%-- 게시판에 대한 기능은 .bo로 처리되도록 서블릿에서 정의를 해뒀기 때문에 이 규칙을 유의해두고 있자. --%>
		<table cellpadding="0" cellspacing="0"> <!-- cellpadding: 셀과 텍스트 사이의 간격 /cellspacing: 셀과 셀 사이의 간격 -->
			<tr align="center" valign="middle"> <!-- valign: 세로에서의 정렬. middle로 지정하면 가운데로 정렬될 것임. -->
				<td colspan="5">MVC 게시판</td>
			</tr>
			<tr>
				<td style="font-family: 돋움; font-size: 12;" height="16">
					<div align="center">글쓴이</div>
				</td>
				<td>
					<input type="text" name="BOARD_NAME" size="10"> <!-- 굳이 셀을 합치지 않더라도 사이즈를 고정시켜놓았기 때문에 남은 영역은 빈영역으로 나타날 것이다. -->
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋움; font-size: 12;" height="16">
					<div align="center">비밀번호</div>
				</td>
				<td>
					<input type="password" name="BOARD_PASS" size="10">
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋움; font-size: 12;" height="16">
					<div align="center">제  목</div>
				</td>
				<td>
					<input type="text" name="BOARD_SUBJECT" size="50"> 
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋움; font-size: 12;">
					<div align="center">내  용</div>
				</td>
				<td>
					<textarea rows="15" cols="70" name="BOARD_CONTENT"></textarea> 
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋움; font-size: 12;" height="16"> 
					<div align="center">파일 첨부</div>
				</td>
				<td>
					<input type="file" name="BOARD_FILE">
				</td>
			</tr>
			<tr bgcolor="#cccccc"> <!-- 테이블에서 행 사이에 밑줄을 긋도록 함!! -->
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