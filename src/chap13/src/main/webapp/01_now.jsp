<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 일반적으로 사용자가 정의한 태그는 tf의 접두어를 사용한다. / tagdir => 태그의 디렉토리 정보를 넣어주도록 한다. --%>    
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>now 태그</title>
</head>
<body>
<%-- [커스텀 태그] 
: 기존 제공 기능들은 한정적이기 때문에 반복적으로 필요한 특정 기능을 내가 태그로 정의해서 사용하고자 할 때 jsp에서 제공하는 기능을 통해 구현하는 방법을 실습할 예정
이전에는 자바코드로 구현하는 방법이 있었고, 그 후에 태그 파일 형식으로 정의해서 좀 더 쉽게 사용할 수 있도록 기능들로 업그레이드 되어짐.
일부 교재에서 언급을 안하는 이유(우리 교재에도 설명 없음)? 모델2기반에서는 이 태그를 사용할 일이 적다는 의견 때문임

WEB-INF파일 안에 사용자가 정의한 태그를 위치시키는 것이 일반적이다.
바로 파일을 만들 수도 있지만 폴더 안에 만들도록 한다.(폴더 안에 만들어서 관리할 의도)
other에서 JSP Tag를 선택하여 파일을 만들도록 한다.(.tag가 확장자임) 

전송되어진 코드를 보면 now태그를 찾아가서 톰캣에게 알려주는 코드의 여백만큼이 공백으로 나타내주고 있는 것이다. --%>

	오늘은 <b><tf:now/></b>입니다. 


</body>
</html>