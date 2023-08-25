<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%-- 세션 영역에 접근하여 데이터를 저장하는 방법과 꺼내오는 방법을 실습으로 확인할 예정
     jsp 메모리 영역에 접근하려면 메모리 영역의 동일 객체 이름을 통해 접근을 하면 됐었다. (page영역만 pageContext로 영역에 접근을 해야함)
     그렇게 데이터를 저장하려면 .연산자를 통해 setAttribute메소드를 불러내어 키와 벨류 형태로 정의하도록 한다.
     
     세션영역에 대한 접근 방법은 톰캣이 알아서 고유 세션 영역을 현재 클라이언트와 고유하게 사용할 수 있는 ID를 생성하여 메모리를 할당해주기 때문에
     응답을 보낸 이후에 재요청이 왔을 때는 톰캣이 자기가 생성한 세션 ID를 통해서 자체 판단을 하여 setAttribute를 하게 된다면 
     그때 고유로 할당되었던 영역에 계속해서 데이터를 보관해주게 된다. 
     
     우리가 세션에 저장된 데이터를 삭제해달라는 요청 전이거나 브라우저 x버튼을 눌러서 종료하기 전, 
     아무런 응답을 보내지 않는 디폴트 30분 이내에 재요청을 한다면 정보를 보관해주게 됨 --%>    
<%
	session.setAttribute("MemberID", "hongkd");
	session.setAttribute("name", "홍길동");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 영역</title>
</head>
<body>

	<h3>세션에 정보를 저장하였습니다.</h3>



</body>
</html>