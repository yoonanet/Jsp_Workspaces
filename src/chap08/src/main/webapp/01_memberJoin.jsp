<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼</title>
</head>
<body>
	
	<%-- 코드를 간략하게 작성을 할 수 있도록 제공하는 태그 형태의 자바기능이 액션태그임
          useBean액션태그는 모델1기반 형태에서 사용의 빈도수가 매우 높다.
          자바빈의 규약을 만든 이유가 useBean액션태그와의 연관성이 높음. --%>
	<form action="02_processJoin.jsp" method="post"> <%-- submit버튼을 눌렀을 때 전달받고 싶은 페이지 지정
	                                                      퍼포먼스적으로는 떨어지지만 데이터를 노출되지 않도록 감춰서 전송하는 방식 post(몸체에 담아서 전송)로 지정!! --%>
		<table border="1" align="center" cellpadding="5" cellspacing="0">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" size="20"></td> <%-- 서버와 연동하여 데이터를 처리한다고 할 때 무조건적으로 name속성을 작성하도록 하자 --%>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" size="20"></td> 
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" size="20"></td> 
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" size="20"></td> 
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" size="20"></td> 
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="reset" value="취소">
				</td>
			</tr>			
		</table>
	</form>
	
	<%-- 자바와 데이터베이스간에 데이터를 주고받을 수 있는 가교역할을 하게끔 자바빈으로 구조를 잡아줬었음
	     자바빈이란? 데이터를 보관할 목적으로 생성하는 참조 자료형
	     가교역할을 위한 목적으로 생성하는 참조 자료형은 controller가 있었음 (기능에 포커스를 맞췄음)
	     
	     자바라는 자료형을 jsp에서 먼저 생성하도록 한다.
	     자바빈은 현재 만들어진 프로젝트 안에 java Resources폴더를 보면 src/main/java가 보여짐 이는 위치를 의미하는 것이다. -> 우클릭하여 클래스파일 만들기
	     위 지정된 위치와 지금 현재 작업되는 위치가 똑같이 보여지는 것이다. --%>
	
</body>
</html>