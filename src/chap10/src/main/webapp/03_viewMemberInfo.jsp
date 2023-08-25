<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보 조회</title>
</head>
<body>

	<%  //[세션의 영역의 데이터를 읽어오는 방법↓]
		//getAttributeNames메소드: 세션에 저장된 모든 키값을 읽어오도록 한다, 세션에는 여러 정보가 저장될 수 있기 때문에 s로 복수형의 형태로 메소드 이름이 제공되고 있음
		Enumeration<String> key = session.getAttributeNames(); 
	
		//Enumeration의 특징 반복문을 돌면서 데이터의 존재유무를 먼저 체크해야한다. 
		while(key.hasMoreElements()) { //읽어온 데이터들의 존재유무를 체크
			String name = key.nextElement(); //데이터가 존재한다면 꺼내오는 메소드
			
			//맵형태의 이름을 반환받아오고 브라우저상에서 하나하나씩 확인
			out.println(name + ":" + session.getAttribute(name)+ "<br>"); //getAttribute현재 키값을 입력으로 넣어주게 되면 value값을 확인할 수 있음
		}
		//세션에 저장되어져 있는 데이터들을 전부 출력을 하고자 코드를 구성한 것임 (02를 실행하면서 저장했던 정보가 03에서 읽어와봤을 때 세션 영역에서 읽혀져 오고 있는 것을 확인할 수 있음.) 
		//톰캣이 자기가 고유번호를 부여해서 관리하고 있는 이 클라이언트의 해당영역에 정보들을 잘 구분지어서 관리한다는 것을 확인할 수 있다.
		//쿠키는 암호화를 시키지 않는 이상 정보에 취약하기 때문에 실질적으로는 로그인에 대한 정보를 공유하기 위한 용도로는 세션을 활용하는 것이 적합하다.
	%>

</body>
</html>