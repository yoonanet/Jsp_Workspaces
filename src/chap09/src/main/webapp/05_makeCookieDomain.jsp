<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie cookie1 = new Cookie("only", "onlycookie"); //쿠키 생성
	response.addCookie(cookie1); //위에 만든 쿠키를 클라이언트 브라우저로 전송 (응답에 담아준다.)
	//별도의 지정없이 생성하여 정보를 보내주게 되면 쿠키정보를 받은 브라우저는 
	//추가로 지정한 쿠키 정보도 관리하지만 도메인이름(blog.somehost.com)도 같이 관리하게 된다. -> 쿠키가 생성된 도메인에 그대로 요청이 되게끔 지정이 됨
	//위 도메인으로 요청된 정보에 한해서만 전송되어진다. 그래서 www.somehost.com으로 요청을 하면 쿠키 정보가 보여지지 않는 것임
	//디폴트는 요청을 하는 url에서 최초로 쿠키를 생성해주는 것이다. (!!요청한 자체의 도메인이 디폴트로 지정됨!!)
	
	Cookie cookie2 = new Cookie("id", "hong"); 
	cookie2.setDomain("somehost.com"); //setDomain: 등록한 도메인의 URL을 넣어주도록 한다.(정보를 추가 전달) => 앞에 www나 blog는 생략하여 넣도록 함 
	response.addCookie(cookie2);
	//쿠키가 브라우저에 전송된 다음에 그 후에 액션이 어떻게 일어날지 확인
	//위와 같이 쿠키정보를 전달하게 된다면 생성한 쿠키 정보와 함께 지정한 도메인을 관리하게 된다.
	//somehost.com은 www나 blog는 생략했다는 것은 어떤 요청이든 상관없이 그 뒤에오는 somehost.com의 도메인만 일치하면 전송해주게 되는 것이다. 
	//(확장을 시킨 개념으로 현재 웹사이트에서 모든 메뉴에 범용적으로 클라이언트와 서버의 상태를 체크해야하는 기능에 구성하도록 한다.)
	
	
	//나쁜 의도를 가진 쿠키 생성
	//-> 현재 요청한 도메인에서 somehost.com(원래부터 잘 운영되던 페이지)을 의도적으로 다른 도메인(sometest.com)으로 등록하여 쿠키정보를 빼내려고 하는 것
	Cookie cookie3 = new Cookie("invalid", "invalidcookie"); 
	cookie3.setDomain("otherdomain.com"); //위 쿠키는 지정한 url을 호출할 때 보내주겠다는 의미
	response.addCookie(cookie3); //완전히 다른 도메인을 쿠키로 지정해준다고 하면 쿠키를 아예 생성해주지 않는 것이다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
</head>
<body>

	<h3>생성 쿠키 정보 : </h3> <%-- 우리가 만든 도메인으로 요청가능 -> http://www.somehost.com:8090/chap09/05_makeCookieDomain.jsp(http가 자동으로 붙음) --%>
	
	<%= cookie1.getName() %> : <%= cookie1.getValue() %>
	[<%= cookie1.getDomain() %>]<br><br> <%-- 도메인의 반환값을 확인하도록 한다. --%>
	
	<%= cookie2.getName() %> : <%= cookie2.getValue() %>
	[<%= cookie2.getDomain() %>]<br><br>
	
	<%--cookie1에는 도메인값을 지정안했기 때문에 null로 출력이 되고 cookie3는 도메인을 지정했기 때문에 somehost.com로 출력됨 
		02_viewCookies.jsp을 파일을 설정한 도메인으로 접속하게 되면 쿠키 목록에 생성된 쿠키들이 전달된 것을 확인할 수 있음
		1. http://blog.somehost.com:8090/chap09/02_viewCookies.jsp => cookie1과 cookie2가 보임
		2. http://www.somehost.com:8090/chap09/02_viewCookies.jsp => cookie2만 보임 --%>
	
	<%= cookie3.getName() %> : <%= cookie3.getValue() %>
	[<%= cookie3.getDomain() %>]<br><br>
	<!-- 도메인이 다르기 때문에 위처럼 요청을 하면 전송이 되어지지 않는다는 것은 당연함.
		 도메인의 등록에서 앞에 www.이 붙어있지 않음.
	     http://otherdomain.com:8090/chap09/02_viewCookies.jsp로 요청 -> 결과를 보면 만들어놓은 쿠키가 전달되지 않고 있음
	     전달되지 않는 것이 당연하다 -> 나의 정보를 다 빼갈 수 있기 때문이다.
	     
	     네이버로 접속해서 정보를 얻어온 것인데 자기 도메인의 쿠키를 집어넣은 것임
	     그렇게 해서 등록했다고 하더라도 도메인 이름이 다르니까 지금 현재 쿠키정보가 털릴 수 있음
	     도메인은 쿠키정보를 생성해서 보낼 때 요청하는 원래 페이지가 있으면 그 페이지는 도메인을 somehost.com으로 가짐
	     누군가가 중간에 somehost.com url을 캐치하고 jsp페이지를 만들어서 중간에 쿠키를 전혀 다른 도메인으로 악성코드처럼 쿠키를 생성할 수 있음
	     지금 요청한 도메인과 등록한 도메인이 서로 다르다고 할 때에는 응답으로 보내준다고 하더라도 브라우저는 쿠키를 저장하지 않는다.
	     쿠키가 중간에 털릴 수 있기 때문에 기능으로 차단을 해버리는 것이다.
	     
	     전달받은 도메인과 요청이오는 도메인의 정보가 다르면 차단되는 것이다. (도메인이 벗어난 쿠키는 저장하지 않음) -->
	
	
	
</body>
</html>

<%-- 
  [쿠키의 도메인과 경로]
  
  브라우저를 통해서 URL도메인을 통해 오라클의 index.jsp페이지 요청 -> 네트워크에 연결된 오라클 서버가 index.jsp를 응답으로 보냄
  (쿠키에 대한 승인여부 메시지가 출력되도록 index.jsp가 구성됨 -> 승인을 누르면 클라이언트의 쿠키정보들을 저장하려고 하는 것임)
  
  오라클사가 만든 쿠키정보가 내 쿠키 저장소에 저장을 하게됨. (클라이언트와 정보를 공유하기 위함 -> 오라클에서는 자신의 서버와의 통신만을 원하는 것)
  그렇게 되면 어떠한 화면을 누르던지 누름과 동시에 브라우저에 요청을 다시 서버로 보내게 됨 => 쿠키정보도 같이 전송되는 것임
  
  필요한 정보를 얻은 상태에서 naver웹페이지를 요청. 그렇게 되면 네트워크에 연결된 naver웹페이지 브라우저를 찾아가게 됨
  이때, 오라클사가 보내온 쿠키정보를 naver서버에 전달되면 안됨
  (바뀐 URL로써 이전에 받은 쿠키정보를 확인하고 다르다면 쿠키정보를 전달하기 않게 되는 것이다.)
  
  그래서 브라우저는 쿠키를 보냈다고 무조건 서버에 보내는 것이 아니라
  쿠키를 보낼 때는 쿠키에 대한 도메인의 정보를 같이 가지고 있는 것이다.
  그래서 응답을 받으면 클라이언트가 요청한 URL이 있을 것이고, 그 URL의 정보를 쿠키와 함께 브라우저는 관리하고 있다가
  동일한 URL에서 새로운 요청을 해서 보내게될 때 전달받았던 쿠키를 같이 보내게 됨
  
  새로운 URL을 요청한다면 브라우저는 자신의 쿠키를 뒤져서 
  새로운 URL에서 받았던 쿠키가 있는지를 검색함. 있을 경우에만 쿠키정보를 보내주게 되는 것이다.
  
  같은 URL이라고 하더라도 어떤 경우에는 자신이 만든 쿠키를 어떤경우에는 자신이 만든 쿠키를 보내고, 어떤경우에는 보내지 않는 차등을 둘 수 있다.
  naver를 들어가서 같은 URL의 블로그에 들어갔을 때 앞에 section이 앞에 붙는 URL로 바뀜. 별도의 URL을 가지고 있음
  같은 웹사이트라고 하더라도 www의 url, section/cafe의 url등으로 나뉨
  
  => 같은 url 정보에서도 쿠키에 대한 정보를 구별짓는 컨트롤이 가능해진다.
  왜이렇게 쿠키정보를 구별짓게끔 처리를 해주는 것일까? 필요할때만 사용하기 위해서임.
  로그인 여부에 따라서 서비스가 달라짐. -> 서버입장에서는 로그인여부를 선행적으로 체크해서 화면을 보여줘야함
  메뉴들마다 url을 달리지정을 해서 그 url일 때만 쿠키를 만들어서 보내게 되면 체크해야하는 메뉴에서만 전달해주게끔 처리를 해줄 수 있게된다.
  홍보성 페이지나 메뉴는 로그인에 대한 쿠키를 보내올 필요가 없는 것이다.
  
  쿠키에 대한 처리를 할 때는 도메인을 보고 보낼지말지에 대한 기능을 추가적으로 제공해주고 있는 것임
  +) 또는 경로로도 체크할 수 있음  
  
  서로 다른 url이 있어야 실습 가능. -> 서비스를 신청해서 별도로 할당을 받아야함 -> 실습상황에서는 불가
  우회적방법: windows에게 여러 url을 등록을 시켜서 실습 환경 구축
  => C:\Windows\System32\drivers\etc 경로로 파일 들어가기 
     메모장 관리자 권한으로 열기 ->  파일에서 열기로 해서 위 경로를 통해 hosts(윈도우즈가 관리하고 있는 파일이기 때문에 관리자권한으로 열어야 수정가능)를 열기
     학원에서 127.0.0.1: 현재 내컴퓨터를 의미. 실제 내 IP(192.168.0.48)를 의미하는 것임
     
     아래의 텍스트들을 hosts에 적도록 하자. (원래는 서로다른 번호로 신청을 하여 처리가 됨.)
     127.0.0.1	www.somehost.com 네이버 생각
	 127.0.0.1	blog.somehost.com
	 127.0.0.1	otherdomain.com 완전히 다른 도메인으로 생각
     
     => localhost의 요청을 위에 지정한 도메인으로 처리하는 효과를 받을 수 있음
  	
--%>