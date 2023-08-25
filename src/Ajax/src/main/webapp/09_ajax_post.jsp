<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- post방식의 요청을 비동기적으로 처리하는 실습 -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post 방식으로 서버와 통신하기 - $.post()</title>
<!-- 대표적인 ajax를 가장 많이 사용하는 응용이나 활용이 로그인에 관련된 처리가 될 것이다. 
로그인에는 개인정보에 중요한 아이디와 패스워드가 서버쪽으로 전달이 되어질 것이다. 그럴 때는 post방식으로 반드시 처리를 해줘야 한다.
ajax의 post를 통해서 서버가 데이터를 전달받았을 때 현재 아이디로 전달받은 사용자가 DB안에 존재하는지 먼저 체크
존재한다면 그 사람의 데이터를 읽어와서 DB의 password와 일치 여부를 확인하여 로그인을 처리해주도록 해야함.(요청을 받은 서버는 DB와 연동이 되어야 함)
서버에 요청을 할 때 DB와 연동할 수 있는 jsp파일이나 모델2기반이라고 한다면 --.bo를 통한 요청으로 서블릿에 전달받아서 처리하게끔 구성해줘야함 

로그인화면에서 post로 전달된 데이터를 전달받아서 부분적인 업데이트를 하도록 처리함.
-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){ 
	$('#submit').click(function(){
		var id = $('#id').val(); //val함수를 이용해서 id에 사용자가 입력한 값을 읽어옴
		var pw = $('#password').val();
		//쿼리문자열 ↓
		var sendData = 'userId='+id+'&userPw='+pw; //실질적으로 파라메타에 전달되어지는 이름은 쿼리문에 작성된 이름으로 전달될 것이다.
		
		//$.get()함수와 매개변수 형태가 동일함 -> 두번째 매개변수에 전달할 쿼리문만 다름
		//첫번째 매개변수는 요청할 파일에 대한 정보, 두번째 매개변수는 파일에 전송할 데이터,
		//클라이언트에게 전송할 데이터를 전달받을 함수를 세번째 매개변수에 등록해주면 됨.
		//post함수는 서버로부터 전송되어온 데이터를 전송이 완료됐을 때 세번째 등록한 함수를 호출하면서 입력으로 전달을 해주게 될 것이다.
		//그 전달받은 메시지를 지정한 자리에 출력해주고자 한다!!!
		//loginCheck.jsp페이지에 post방식으로 sendData으로 넣어준 쿼리문의 형태로 데이터가 전달되어질 것이다.
		$.post('loginCheck.jsp', sendData, function(msg){ //전송된 데이터가 매개변수로 전달되어져 올 것임.
			$('#message').html(msg); //전달받은 메시지를 html입력으로 넣어주게 되면 해당 영역에 메시지를 출력해줄 것임
		});
		
		return false;
	});
});
</script>

</head>
<body>

	<form action=""> 
		<label>아 이 디 : </label>
		<input type="text" name="id" id="id"><br>
		<label>비밀번호 : </label>
		<input type="password" name="password" id="password"><br>
		<input type="button" id="submit" value="로그인">
	</form>
	
	<div id="message">더조은 컴퓨터 아카데미</div>
	
</body>
</html>