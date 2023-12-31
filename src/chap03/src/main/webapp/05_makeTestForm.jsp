<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼생성</title>
</head>
<body>
<%-- request객체에서의 핵심 포인트로써 웹서비스를 하는데 있어서 반드시 구현되어야 하는 기능을 살펴볼 예정 (웹 서비스에서 필수적인 기능임) --%>
	
	<%-- 입력양식태그를 구성할 때 폼으로 감싸줘야하는데 여기서는 폼이 핵심이다. 
	     또한, 폼으로 감싸준 입력양식태그에는 submit타입을 꼭 포함시키도록 해야한다.
	     submit의 기본 기능은 서버에서 클라이언트로부터 입력된 값을 전달해주는 기능이다.
	     => 폼안에 감싸져 있는 입력양식태그의 정보를 submit버튼을 누르면 사용자가 입력한 데이터를 가지고 서버에 전송을 해주는 기능인 것이다.
	        브라우저입장에서는 다시 서버쪽으로 데이터 저장 요청을 해야 하는 것임!
	     
	     클라이언트가 서버에 요청을 할 때는 항상 서버의 이름과 포트번호를 요청하면서 특정프로젝트의 특정파일로써 요구를 하고 있었음 
	                                         => 웹페이지에 대한 정보를 요청을 하게 되는 것임. (나한테 보여줄 화면을 요청하는 개념임)

	정보를 사용자가 입력하고, 전송버튼을 눌렀을 때 어떠한 화면을 클라이언트한테 보여줘야할지에 대한 구조를 개발자가 정의해야 한다!!
	전송버튼을 눌렀을 때 보여줄 웹페이지를 서버에 요청을 할 수 있어야 한다.
	그것을 from태그의 action 속성에 정보를 넣어주면 되는 것이다. => action속성은 submit버튼을 눌렀을 때 실행되는 속성인 것이다.
	전송버튼을 눌렀을 때 브라우저가 폼태그 안에 액션에 담아둔 페이지를 다시 요청 하게 되는 개념이다.
	
	***화면을 구성한 다음에 구성하면서 반드시 염두해야할 것은 사용자가 데이터를 입력하면 다음 액션이 이루어졌을 때
	어떤 페이지를 서비스할 것인지가 이 화면 안에 먼저 정의가 되어져 있어야 다음 액션이 진행되는 것이다. (=> 미리 페이지를 연결시켜줘야 함)
	 --%>
	 
	 
	<h3>폼에 데이터를 입력한 후 '전송' 버튼을 클릭하세요.</h3>
	<form action="05_viewParameter.jsp"> <%-- 폼에 지정한 다음 페이지로 해당사용자가 입력한 값들과 같이 전송을 함 --%>
		이름 : <input type="text" name="name" size="20"><br>
		주소 : <input type="text" name="address" size="30"><br>
		좋아하는 동물 : 
			<input type="checkbox" name="pet" value="dog">강아지 <!-- checkbox같은 경우 name속성의 이름을 동일하게 하여 그룹으로 지정해주도록 한다.
			                                                      사용자입력에서는 다양한 경우의 수가 발생 -> 서버에서는 어떻게 데이터를 꺼내와야 할까?
			                                                      서버에 전달되는 값을 보면 파일명 옆에 ?name=홍길동&address=서울시+종로구&pet=on&pet=on로 지정이 되어져 있음 (get이라고 하는 요청방식임_요청페이지와 함께 사용자의 입력값을 같이 전송하는 방식)
			                                                      체크박스는 name값이 다 동일하기 때문에 값이 구별이 되어야 한다. 따라서 체크박스의 값을 구별할 수 있는 고유값을 value에 입력하도록 한다.
			                                                      value속성은 항목에서 각각의 구별되는 고유의 이름을 지정해주는 개념인 것임 -> 그렇게 선택이 되어지면 고유하게 구별된 value값이 서버에 전송되어진다. -->
			<input type="checkbox" name="pet" value="cat">고양이
			<input type="checkbox" name="pet" value="hamster">햄스터<br>
		<input type="submit" value="전송">
		
		
		<%-- UI를 구성한다는 것은 사용자와 소통을 한다는 것, 여기서는 사용자로부터 데이터를 입력받겠다는 것임!!
		     -> 이 페이지를 클라이언트가 요청을 해왔다면 페이지 그대로 브라우저에게 응답을 보내게 된다.
		     
		     클라이언트 입장에서는 전송버튼을 누르면 해당 서버컴퓨터로 데이터가 전송이돼서 저장을 하는 것을 기대함
		     개발자가 처리해야할 백엔드의 핵심기술은 클라이언트가 보내온 데이터를 전달받아서 저장소공간에 보관을 해야하는 것이다.
		     즉, 클라이언트 페이지 요청 -> 페이지를 응답 -> 사용자가 데이터 입력 -> 서버에 전달되어 DB에 보관하는 구조임
		     (데이터베이스 보관하는 것은 뒤에서 배울 예정)
		     
		     !!먼저, 데이터를 어떻게 전송을 할 수 있는지 부터 체크를 해야함!! --%>
	</form>




</body>
</html>