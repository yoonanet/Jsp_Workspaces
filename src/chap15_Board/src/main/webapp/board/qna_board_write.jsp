<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<%-- 글을 쓸 수 있는 양식의 UI화면을 구성할 목적의 페이지

모델2는 jsp페이지를 요청하는 것이 아니라 서블릿에 의해서 페이지의 요청을 처리할 예정 => 이 jsp파일을 클라이언트한테 어떻게 전달할지가 관건 --%>

<script type="text/javascript">
	function addboard() { //등록버튼을 눌렀을 때 함수가 호출되도록 함
		boardform.submit(); //폼태그에 접근해서 submit()을 호출하도록 한다. 앵커를 눌렀는데 submit을 눌려진 것처럼 처리하도록 함
		//이렇게 처리를 해주면 form태그의 action속성에 어떤 서비스의 응답을 해줄지에 대해서 화면상에 지정을 해줄 수 있다. 
		//톰캣은 등록버튼이 눌리면 사용자가 입력한 값을 같이 가지고 요청 -> request을 통해 보내온 데이터를 DB에 보관(jdbc기술을 웹표준에서 그대로 적용시키도록 한다.)
	}
</script>
</head>
<body>
	<!-- 게시판 등록 폼 (실질적으로 클라이언트한테 보여주는 화면)
	     요청 처리에 대한 방식들은 크게 보면 두 가지로 나뉜다.
	     요청을 보내면 다이렉트 처리와 요청이 오면 폼을 보내면 폼을 통해서 데이터를 전달받으면서 처리
	     (두 프로세서가 처리되어야 함/폼을 보낼 때는 get방식, 데이터를 전달받을 때는 post방식으로 처리)로 나뉨 
	     
	     클라이언트가 파일첨부를 하면 파일이 서버쪽으로 전달되어져야 한다. 지금 현재의 처리방식은 선택만 될 뿐, 서버쪽으로 파일이 전달되지 않는다. 
		 그래서 선택한 파일을 서버쪽으로 전달할 수 있도록 설정을 셋팅해줘야 한다.
		 
		 UI상에 파일첨부의 기능이 추가된다면 기존에 form태그 처리 셋팅에서 유의를 해주도록 한다. 
		 => form태그에 enctype="application/x-www-form-urlencoded"를 추가하도록 하자!!
		 기본적으로 파라미터를 서버쪽으로 전송하면 파라미터의 이름이 담겨서 전송이 된다. 그럴때 url에 쿼리문을 전달하면 자동으로 인코딩하여 서버에 전달하고 톰캣은 그 인코딩한 데이터를 디코딩을 하면서 파라미터값으로 꺼내오게 됨.
		 네트워크를 텍스트들을 주고받을 때는 자동으로 인코딩, 디코딩 되어지게끔 http프로토콜이 처리해주도록 한다.
		 
		 디폴트인 application/x-www-form-urlencoded로는 파일첨부의 동작이 처리되지 않는다. => 따라서 multipart/form-data의 옵션으로 처리해주도록 한다.
		 파일이 첨부돼서 전송이 되어질 때는 인코딩을 하여 보내면 안된다.
		 ***반드시 ui상에 파일 첨부의 기능이 추가되면 "multipart/form-data"의 인코딩 타입으로 요청을 해야만 파일 첨부되어진 것도 서버로 정상적으로 전달이 되어진다!!
		 파일이 첨부돼서 전송이 되어지면 기존과 같은 방법으로 인코딩되어 전송이 되어지지 않기 때문에 request.getparameter라는 단순 호출로 데이터를 꺼내올 수 없을 뿐만 아니라 첨부된 파일 또한, 꺼내오는 기능을 request객체가 제공해주고 있지 않다.
		 => 첨부되어져 온 파일을 서버에서 꺼내올 수 있도록 별도의 기능으로 자바개발자들이 나중에 이 기능을 구현해서 서블릿기반으로 처리되어지는 기술을 라이브러리 형태로 제공을 해주고 있다.
		    서블릿제단에 공식 사이트의 cos폴더 안에 http://servlets.com/cos/의 url로 제공을 해주고 있음
		    
		    cos.jar라이브러리를 WEB-INF -> lib에 포함시키도록 한다. (웹은 이 안에 라이브러리를 넣어주면 프로젝트 내에 자동 포함시켜줌) 
		    이 라이브러리 압축 파일은 파일을 첨부했을 때 서버에서 그 첨부된 파일에 대한 처리에 기능을 구현해서 제공해주는 라이브러리인 것이다.
		    (파일을 서버로 전달하기 위해서는 서버에서 파일에 대한 처리가 가능해야한다. 따라서 그에 대한 기능의 라이브러리를 포함시켜주도록 한 것이다.)    
	     -->
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
				<td colspan="2">&nbsp;</td> <!-- 브라우저상에서는 공백을 무시한다. 이때, 브라우저상에서 공백을 주고싶다면? &nbsp;(스페이스바 한번의 공간만큼 띄워줌)
				                                 이러한 형식으로 행의 여백을 처리하면서 좀 더 UI를 보기 좋게 구성하도록 한다. -->
			</tr>
			<tr align="center" valign="middle">
				<td colspan="5"> 
				<!-- 원래는 등록 버튼은 submit으로 처리를 해줘야 서버에 전송을 해줄 수 있음. 
				     지금 현재의 ui를 보면 버튼모양이 아닌 글자 형식으로 되어져 있음.  -->
					<a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp; 
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</td><!-- 클라이언트는 등록버튼을 눌렀을 때 서버쪽으로 전송해서 목록에 작성한 게시물이 추가되는 것을 생각할 수 있다.
				          문제점은 등록버튼이 submit으로 구성이 되어있지 않아서 서버에 사용자 작성 내용이 전송되지 않을 것이다.
				          그럼 이 부분에서 어떻게 서버로 전송하게끔 처리할 수 있을까? href에 원래는 경로를 지정하면 이동해가는 효과임
				          하지만 href에 javascript에 함수로 등록을 해주고 스크립트에 addboard()라는 함수를 정의하도록 한다. -->
			</tr>
		</table>
	</form>
	
</body>
</html>