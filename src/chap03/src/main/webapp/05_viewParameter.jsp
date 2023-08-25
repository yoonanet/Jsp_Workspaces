<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라메터 출력</title>
</head>
<body>
<%-- 화면을 구성해서 클라이언트에게 보내줄 목적의 파일. (기획에서 컨셉회의에 따른 결정이될 것임)
     데이터를 전달받아서 화면상으로 전송할 페이지를 만드는 것이다.
     
    개발자 입장에서는 최초 처음 만나는 페이지가 됨.
	이 페이지가 호출될때 호출되기 직전에 new하여 클라이언트의 요청사항에 대한 모든 정보를 메모리에 보관해두는데
	이때, 사용자가 입력한 데이터도 같이 전송이 되어져 오는 것임!!
	***이 페이지를 호출하면서 사용자가 입력한 정보가 같이 전송되어져 온다는 것을 알고 있어야 한다.
	
	이 페이지에서 가장 먼저해야할 작업은 사용자가 입력한 정보를 먼저 꺼내와야 한다. 그래야 데이터베이스에 저장을 하든 기능을 정의하든 할 수 있음
	회원가입에 대한 정보는 반드시 꺼내와서 데이터베이스에 보관을 해야하는 것이다!! --%>
	
	<b>request.getParameter() 메소드 사용</b><br>
	
	<!-- 데이터를 꺼내올 때 getParameter()메소드는 input태그로 UI가 구성이 됐을 때 속성중에 name이라는 속성을 사용할 수 있다.
	     name의 속성은 서버에서 이용할 속성으로 고유 이름을 붙여줄 수 있다.
	     
	     꺼내오고 싶은 데이터에서 고유하게 붙여줬던 name을 입력으로 큰따옴표로 감싸서 지정해주도록 하면 사용자의 입력값을 반환해준다. -->
	     
	이름(name) : <%= request.getParameter("name") %><br> <!-- 고유이름을 알려주면 고유이름으로 전송되어진 사용자의 입력값을 이 getParameter메소드가 반환을 해주는 개념이다. -->
	주소(address) : <%= request.getParameter("address") %><br>
	<!-- 나중에는 꺼내온 데이터를 변수에 담아주고 변수에 담아준 값을 jdbc를 이용해서 DB에 보관하면 되는 것임. -->
	
	
	
	<!-- 체크박스는 다양한 경우의 수가 나오는데 getParameter메소드는 name의 값을 넣음.
	     getParameterValues는 value인데 복수의 개념으로 뒤에 s가 붙어있음. 
	     이 메소드에 name을 지정해주게 되면 value의 값은 여러 개일 수 있기 때문에 문자배열로 반환을 해주게 된다.
	     그렇게 되면 선택되어진 value의 값들을 배열의 형태로 반환해주게 되는 것임. 하지만 하나도 선택을 하지 않을 수 있음 그렇게 되면 null값을 반환해주게 됨
	     
	     value값이 null아닐 때만 꺼내오도록 해야한다. => length: 체크된 갯수를 반환함
	     for문의 값을 브라우저상에 출력하도록 하려면 scriptlet을 끊어가면서 코드를 구성하도록 한다. -->
	좋아하는 동물 선택 내용:
	<%
		String[] values = request.getParameterValues("pet");
	
		if(values != null) {
			for(int i=0; i < values.length; i++) { 
	%>
				<%= values[i] %> <!-- 자바변수에 담긴 값을 이자리에 출력하도록 함. -->
				
	<%		}
		}
	%>
	<!-- value에서 한글을 넣는 것을 지양하도록 한다.(권고사항은 아니다.), 되도록 자바코드에 작성하도록 한다!!  -->

</body>
</html>