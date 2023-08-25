<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="member.Member" %> <%-- 패키지 이름과 함께 참조자료형을 import --%> 
   
<%  //설정과 관련된 셋팅
	request.setCharacterEncoding("UTF-8"); //브라우저에서 변환되어 해석되어지는 포맷단위를 재지정 (이전버전과의 호환성을 높이기 위함)
	//post방식은 몸체에 담아서 전송을 하기 때문에 UTF-8방식을 꼭 지정해주도록 한다.
%>


<%-- <%
	//회원에 대한 정보를 한번에 인스턴스로 관리하기 위해서 자바빈을 생성함
	Member member = new Member(); //우리가 정의한 Meamber의 메모리 할당
	
	member.setId(request.getParameter("id"));
	member.setPassword(request.getParameter("password"));
	member.setName(request.getParameter("name"));
	member.setAddress(request.getParameter("address"));
	member.setEmail(request.getParameter("email"));
	//↑자바빈 안에 사용자가 입력한 데이터들을 저장함
	
	request.setAttribute("memInfo", member); //데이터는 여러 개이지만 하나의 이름으로 데이터를 관리하도록 한다. => 자바빈때문에 가능한 것임
	//현재 키값으로 보내온 값들을 request에 저장하도록 함
	//request영역에 보관하도록 한다. => 응답을 보내고나면 jsp에 의해서 자동으로 소멸됨
	
	//위 정보를 제외하고도 보관해야할 정보들은 많음
	//정보를 보관할 때 위와 같은 방법을 사용할 때 번거로움. 그때, useBean액션코드를 활용하도록 한다.
%>    --%> 
 
 
 
 <%-- UI가 구성되는 페이지가 아니기 때문에 웹형식은 전부 지워주도록 함. --%>     
<jsp:useBean id="member" class="member.Member" scope="request" /> <!-- scope에 메모리 영역을 지정할 수 있음 -->

<%-- 자바빈을 사용하겠다는 것이고 그에 대한 클래스 대상을 class에 넣어주면 된다.
     또한, 참조변수 이름을 id로 넣어주도록 한다.
     그 생성된 객체를 request메모리에 저장해달라고 요청하는 것임. 
     
     
     
     
     setProperty은 useBean의 자식의 형태로 선언되는 것이 아님
     끝나는 구역에 setProperty가 포함되지 않았기 때문이다. 따라서 완전하게 다른 독자적인 의미이다.
     setId라는 메소드를 member.Member에서 찾으면 된다는 것을 setProperty에게 알려줘야 함.
     그렇기 때문에 name속성에 참조변수를 알려주도록 한다.
     
     setId를 호출하면서 클라이언트가 전송해온 데이터를 저장하고 싶은 것임
     그렇기 때문에 param이라는 속성을 통해서 입력양식태그의 name으로 고유이름을 지어준 이름을 넣어주면 된다.  --%>
	
	<%--
	<jsp:setProperty name="member" property="id" param="id" /> member.setId(request.getParameter("id"));와 동일한 의미
	 여기에서 프로퍼티라는 용어가 나옴 => 자바빈 클래스에서 지정한 필드이름을 프로퍼티랑 동일하게 지정해줬었음
	     set이기 때문에 property를 지정해주면 첫글자를 대문자로 바꿔주고, useBean에 지정했던 클래스에서 프로퍼티를 찾게된다.
	     
	     위에 정의한 액션태그(자바의 기능)들은 웹표준에서 정의되는 태그의 형태로 정의되기 때문에 가독성이 높아짐 
	<jsp:setProperty name="member" property="id" param="id" />
	<jsp:setProperty name="member" property="password" param="password" />
	<jsp:setProperty name="member" property="name" param="name" />
	<jsp:setProperty name="member" property="address" param="address" />
	<jsp:setProperty name="member" property="email" param="email" /> --%>
	
	
	<%-- 만약에 property(자바빈의 필드이름)의 이름과 parameter(입력양식태그에 name에 지정한 이름)의 이름을 똑같이 지정을 해줬다고 한다면
	     setProperty에서 property에 *로 지정해준다면 이 액션태그가 알아서 이름이 같은 것들끼리 찾아서 데이터를 setter메서드를 찾아서 파라미터를 넣어주게 된다.
	     그렇게 되면 일일히 작성할 필요없이 한줄이면 끝남 --%>
	<jsp:setProperty name="member" property="*" /> 
    

<%-- 관리자 모드의 페이지가 별도로 존재를 해야한다. 
     관리자모드에 기반하여 상품등록, 결제사항대응, 관리자만이 볼 수 있는 일매출 등을 볼 수 있는 웹페이지가 있어야 하는 것이다. --%>
<%
	String forwardPage = null;
	String id = member.getId();
	
	if(id.equals("admin")) { //관리자모드로 회원가입을 할 때 관리자페이지로 이동하고자 함.
		forwardPage = "03_adminPage.jsp";	
	} else{
		forwardPage = "04_memberPage.jsp";
	}
	
%>


<jsp:forward page="<%= forwardPage %>" />


