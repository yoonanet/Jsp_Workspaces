<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="trim"%> 
<%@ attribute name="length" type="java.lang.Integer"%>
<%@ attribute name="trail" %>
<%@ attribute name="var" required="true" rtexprvalue="false" type="java.lang.String"%> 
<%-- 타입의 default가 String이지만 가독성을 위해 지정하도록 한다.
	 var속성은 사용자마다 자기가 임의로 값을 넣을 수 있기 때문에 범용적인 속성의 값 설정이 가능해야 한다. (!!변수선언에 대한 속성이기 때문이다!!)
	 변수의 이름은 사용자마다 자신이 기억하기 좋은 이름으로 변수를 전달할 것이고, 그때마다 이름은 바뀔 것이다.
	 따라서 전달된 var의 값에서 지금 여기서 선언한 변수의 이름을 연결을 시켜줘야 하는 것이다.
	 
	 attribute디렉티브에서 rtexprvalue를 false로 지정 : rtexprvalue속성은 지정한 이름으로 찾아가라는 속성인데 (지정한 속성값이 같아야한다는 연결고리를 끊어버리는 것이다.)
	 													(속성 값으로 표현식을 사용할 수 있는지의 여부를 지정, 기본값은 true)
	                                                    false로 지정해주면서 태그 파일 내에서 서로 다른 변수 이름의 연결고리를 생성하는 것이 가능해진다.
	                                                    
	                                                    반드시 처리할 추가적인 속성하나가 연동되어지는 속성에 rtexprvalue의 값을 false로 지정.
	                                                    var속성에 연결되어지는 표현식의 값을 연결을 끊어줘야 별칭이름과 매핑이 되는 것이다.
	                                                    기본값이 true였음. 거기에 정의된 이름과 똑같은 이름만 찾아가라는 의미가 된다. 그 속성을 false로 셋팅하면서
	                                                    var에 대상을 지정해주고 alias속성에 서로 다른 변수의 이름에 연결고리를 생성해주게 되는 것이다.

	                                                    
	 variable디렉티브에서 name-from-attribute: 속성의 값으로 부터 이름을 땡겨올 것인데 var속성으로부터 이름을 땡겨올 것임. 
	                                           선언되어져 있는 여러 속성에서 연동시킬 속성의 이름을 지정해주도록 한다!!
	                      alias: 속성의 값과 연동할 때의 태그 파일 내에서 사용할 고유 별칭을 넣어주도록 한다. 
	                      (어떤 이름을 전송되어져 오던 간에 그 변수 이름을 받아서 지금 이 태그 파일안에서 사용하고자 하는 이름을 정의)
	                      ***사용자가 지정한 변수 이름을 내가 태그 내에서 사용하기 위해 지정한 별칭으로 연동시키도록 하는 것이다.	                       
	                      지금에서는 연동시키는 변수를 태그 이후에 사용하는 상황이기 때문에 scope를 AT_END로 지정해주도록 한다. --%>
<%@ variable name-from-attribute="var" alias="result" variable-class="java.lang.String" scope="AT_END"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:doBody var="content" scope="page"/>

<% 
	String content = (String)jspContext.getAttribute("content"); 
	
	if(trim != null && trim.equals("true")) { 
		content = content.trim(); 

	}

	content = content.replaceAll("<(/)?([A-Za-z]*)(\\s[A-Za-z]*=[^>]*)?>", ""); 
	
			
	
	if(length != null && length.intValue() > 0 && content.length() > length.intValue()){ 
		
		if(trail != null){
			content = content + trail; 
		}
	}
%>

<c:set var="result" value="<%= content %>"/> <%-- content에 담긴 값을 result변수에 담아주게 된다. => result변수는 var에 전달받은 변수의 이름과 연동이 되고 있음. --%>
