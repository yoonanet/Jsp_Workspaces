<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Enumeration" %> <%-- 패키지와 함께 자료형을 명명해주면 참조자료형을 이름만으로 접근 가능! --%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 파라미터 초기화 정보 읽기</title>
</head>
<body>

<%-- 
[기본 객체중에 application: 초기화 파라미터 설정으로 메서드를 제공해주고 있음, 자원의 접근 메서드 제공]
핸드폰에 설정의 기능을 제공함. => 설정에 의해 셋팅을 하면 보는 화면이 바뀌게 된다.
                                  설정은 전체 메뉴에 적용이 되어지는 글로벌한 셋팅값이 된다.
application은 그 설정에 관련된 같은 의미로 처리할 수 있게끔 기능을 제공해주는 객체이다.

현재 프로젝트가 설정에 값을 읽어와서 동작이 이루어져야한다면 그때는 application객체를 활용

web.xml파일 => 서버(톰캣)을 start해줄 때 서버가 구동되게끔 초기화하는 작업을 한다. (설정에 셋팅된 값을 읽어오는 것)
               -> 운영체제는 살아나더라도 프로그램이 온전하게 구동하기 위한 체크하는 작업이 진행된다.
                  서버도 운영체제와 동일하게 살아나는 시간이 필요함. 그리고 서버도 운영체제가 탑제되어 있음
               설정정보를 톰캣에게 알려주고 싶을 수 있다. 톰캣이 마지막으로 읽어가는 파일이 web.xml파일이 된다. (즉, 톰캣에게 알릴 설정에 관련된 셋팅을 하면 됨)
               사용자가 톰캣에게 알려주는 정보들이 없는지를 톰캣이 체크하게 되는 것이다.
               
               web-app가 web.xml의 영역이다. 
               <welcome-file-list>은 자동으로 설정해준 값들이 된다. 그 아래에서부터 작업하도록 한다. 
               <context-param>가 뭔가의 값을 셋팅해줄 수 있게끔 제공해주는 앨리먼트인 것임 => map의 형태로 담아서 설정의 값을 입력할 수 있음(param-name 키, param-value 벨류값)
               살아나면서 톰캣은 logEnable => true값과 debugLevel => 5레벨을 기억하게 될 것이고, 이 정보들을 잘 보관할 것이다. (임의의 값을 설정한 것임.)
               
               설정에서 셋팅한 정보들을 이 jsp페이지에서 참조하여 값에 따라 구동되어져야하는 동작이 있다고 한다면
               어떻게 값들을 읽어올 수 있을지에서 그 값을 관리하는 객체가 application객체가 되는 것이다.
 --%>
 
	<h3>초기화 파라미터 목록 : </h3>
	<ul> <%-- 별도의 인스턴스 생성없이 다이렉트로 application 기본객체를 사용
	          반드시 필수적으로 알고 있어야 하는 객체가 request, response, out임(어떤 정보를 셋팅해주고, 기능들을 제공해주는지 꼭 기억)
	          
	          web.xml(우리가 톰캣에게 알려준 설정정보)를 톰캣이 application에다가 알려줌.
	          web.xml 파일(우리가 tomcat에 알려준 설정 정보)에 param을 관리하는 객체 = application
	          application(web.xml에 등록했던 값들을 읽어올 수 있도록 관리해주는 주체임)도 필수적으로 체크해야할 기능이 있음.
	          먼저 제공 메소드 중에 getInitParameterNames()메소드가 있음 -> 반환자료형이 Enumeration제너릭 참조자료형의 형태로 반환
	          (참조자료형으로 반환을 해주는 것은 메소드 안에 클래스가 있는 것이고, 그 클래스를 new하여 할당 메모리에 시작주소값을 반환해주는데 
	          그때의 자료형이 Enumeration으로 선언되어져 있는 인터페이스가 되는 것임.) -> 변수에 메소드를 통해 반환받은 주소값을 잘 담아주도록 한다.
	          - Enumeration도 데이터를 읽어올 때, Iterator이랑 같은 방식으로 데이터를 체크하도록 한다. --%>
	<% 
		Enumeration<String> initParam = application.getInitParameterNames(); 
		//getInitParameterNames를 통해 여러 개의 키값을 반환받아올 수 있음 (설정파일들을 반환받아올 수 있는 것임)
	
		while(initParam.hasMoreElements()) { //데이터의 존재유무를 먼저 체크
			String initParamName = initParam.nextElement(); //데이터가 존재하면 데이터를 읽어옴
			
			out.write("<li>"+initParamName+" : ");
			out.write(application.getInitParameter(initParamName)+"</li>");
			//out이라는 객체는 스트림이 브라우저와 연동이 되어 출력하도록 해주는 객체였음.
			//write메소드를 활용하면 입력값이 브라우저에 전송이 되어질 것이다.
			//initParamName에 담긴 값은 키값이 된다. / getInitParameter()메소드는 현재의 키값을 넣어주면 넣어준 키값의 value를 반환해준다.
		} 
		//우리가 셋팅한 값이 브라우저상에 출력되는 것을 볼 수 있음
	%>
	</ul>
 
 
 
 
</body>
</html>