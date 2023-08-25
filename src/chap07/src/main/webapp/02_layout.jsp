<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Page</title>
</head>
<body>

	<%-- 현재 웹페이지에서는 시멘틱태그로 레이아웃을 구성하는 것이 기본적인 형태이다.
	     cellpadding: 셀안에 텍스트간에 간격 / cellspacing: 셀과 셀간에 간격 --%>
	<table border="1" width="400" cellpadding="0" cellspacing="0" ><!-- align="center" 테이블이 중앙 정렬됨 -->>
		<tr>
			<td colspan="2">
				<jsp:include page="./module/header.jsp" flush="false" /> 
				<%-- jsp:include액션태그(레이아웃을 고려한 구조가 아님, 이동을 해서 실행되는 구조임)에서 flush(디폴트가 false임)의 속성
				     : 브라우저에 넘길 내용이 있다고 한다면 먼저 출력버퍼에 쌓이고 액션태그를 만났을 때, 
				       flush속성이 true로 되어있다면 출력버퍼를 깨끗하게 비운 상태에서 실행을 하게 됨.
				       즉, 이전에 쌓였던 출력버퍼를 비운 상태에서 넣어줄 것인지 아니면 기존의 내용에 추가해서 보낼 것인지 결정해주는 속성
				       jsp:include액션태그는 동작의 특성상 레이아웃을 구성할 때 응용을 할 수 있었고, 레이아웃 구성시에는 한번에 보내는 것이 화면의 깜빡임을 없앨 수 있음
				       따라서 flush속성을 false로 지정하는 것이 서비스적으로 퀄리티가 높게 제공할 수 있게됨
				       
				       또한, 텍스트와 텍스트 노드 사이에 별도로 넣을 내용이 없을 때는 단일태그처럼 작성을 해줘도 된다.  --%>
			</td>
		</tr>
		<tr height="300">
			<td width="100" valign="top"> <!-- valign: 테이블 행의 정렬 속성 -->
				<jsp:include page="./module/subMenu.jsp" />
			</td>
			<td>
				contents<br><br><br><br>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="./module/footer.jsp" />
			</td>
		</tr>
	</table>



</body>
</html>