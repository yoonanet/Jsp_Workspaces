<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<!-- [JSP 페이지에 대한 설정(인폼) 정보 (***페이지디렉티브*** 이번실습에 대한 주요 문법)]
     텍스트 기반으로 html형식 문법을 사용하고 있고 html은 UTF-8(인코딩)로 작성되어져 있다는 의미이다.
     톰캣이 텍스트로 보낼 때 UTF-8로 작성되었다는 것을 브라우저한테 알려줌 
     -> 브라우저는 UTF-8포맷으로 출력을 해주는 것이다.
     
     pageEncoding은 읽어갈 문법사항들의 포맷을 우리가 톰캣에게 알려주는 것이다. ("자바코드를 읽어갈 때 UTF-8로 읽어가면 돼!")
     톰캣이 자바 코드를 만나면 UTF-8로 하여금 읽어갈 수 있는 것이다.
     ==> 생략이 가능하다 (톰캣은 charset에 정보를 pageEncoding으로 처리하는 것임)
         브라우저한테 UTF-8포맷 정보를 전달하고 그 정보로써 톰캣도 포맷타입을 인지한다.
     또한, 문서 타입에 대한 포맷 정보는 대소문자를 구분하지 않는다.
         
    charset과 pageEncoding의 정보는 달라도 된다. 
    (처음 환경설정을 생각하면 Web과 자바의 인코딩을 따로 설정했었음 -> 이 부분의 정보를 보고 이클립스가 포맷 정보를 땡겨오는 것임)
    하지만 서로 다른 표준으로 처리가 되면 혼란이 야기될 수 있다. 
    
    지금의 브라우저들은 전세계의 표준을 UTF-8로 이제서야 지정을 했기(1-2년 밖에 안됨) 때문에 
    그 전에 작업된 프로젝트들을 봤을 때 다르게 지정되어 있을 수 있어서 포맷 방식이 달라도 문제가 되지 않음
    (이전에는 EUC-KR이였음. 한글이 다 지원되지 않아서 표준이 달라짐) --> 

<%@ page import="java.util.Date"  %> <!-- page의 속성중에 import를 활용하여 jsp에 생성할 문서의 타입을 지정하도록 한다. -->

<!-- 실제 전송되어지는 코드는 빈여백만이 보여지고 있음 또한, 톰캣이 알아듣는 코드는 현재 소스코드에서 전송이 되어지고 있지 않음
	 자바의 코드와 관련된 내용들은 브라우저에 서비스되는 기능이 아니고, 톰캣에 적용되는 기능들이기 때문에 웹브라우저에 전송되지 않는 것임
	 이때 브라우저는 빈여백만 온 것에 대한 의문이 생길 수 있다.  -->
<%@ page trimDirectiveWhitespaces="true" %> <!-- trim의 이름이 붙으면 모든 프로그래밍에서 여백 제거에 관련된 기능이다. 
                                                 즉, 자바의 코드들이 있다고 하더라도 그 코드들만큼의 여백이 보내지는데 그 여백이 없이 보내질 수 있도록하는 속성인 것이다.
                                                 default는 false임 그래서 여백이 보여짐!! --> 


    
<% /* import를 해두면 자료형의 이름으로 메모리를 할당하여 사용할 수 있음. */
	Date now = new Date(); /* 현재 시간을 DosCommend창에서 나타내기 위해서 변수에 담음 */
	System.out.println(now); /* 콘솔창에 명령을 출력 */
%> <!-- jsp에서 자바문법을 사용하고 싶을 때 < % 기호를 활용  -->  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 시간</title>
</head>
<body>
	
	<!-- 
	JSP코드의 작성부분을 JSP스크립트라고 표현
	JSP문법요소: 디렉티브(Directive) - < % @ 를 디렉티브라고 부른다. 이 디렉티브는 종류가 3가지가 있음
	                                    => 3가지 중에 페이지 디렉티브가 먼저 소개가 되고 있음
	                                       페이지 디렉티브, 태그라이브러리, include가 있음 => 하나만 올 수 있는 것이 아니라 별도로 추가적으로 올 수 있음
	                                       페이지 디렉티브: jsp페이지를 만들면 현재 jsp설정정보를 알려주는 역할을 하는 문법구문이다. -> 톰캣에게 알릴 용도로 정보를 셋팅함.
	                                                        톰캣이 요청한 페이지를 찾는데 그 페이지에서 위에서 아래로 읽어간다는 것을 생각
	                                                        -> 어떤 속성이 있는지는 03 PPT 6페이지 참고 (이해하는 것에 초점맞추기)                                      
	-->
	
	<%= now %> <!-- jsp에서 자바의 값을 브라우저에 지정한 위치로 출력해주는 기호 < %= 이자리에 출력해달라는 표현식임 (자바 문법의 연속선상임.) -->
	
	
	
</body>
</html>