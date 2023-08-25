<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	th, td {
		border:1px solid gray;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){
	//jquery라이브러리 제공 함수중에 get방식의 로드를 수행할 수 있게끔 제공해주는 get함수
	//=> get방식으로 서버에 저장되어진 데이터를 읽어올 수 있음 -> 그렇게 읽어온 데이터를 화면상에 비동기적으로 출력할 수 있게끔 한다.
	// : 첫번째 매개변수로 비동기적으로 요청하고자 하는 파일의 정보를 담아주면 된다. 서버는 해당파일의 존재유무를 살펴보고 존재하면 해당 데이터들을 브라우저에게 전송해주게 됨
	//   서버로부터 해당 데이터를 전부 전달받으면 두번째로 등록한 함수가 호출해주게됨 (전달받은 데이터를 입력으로 전달해주게 된다.)
	$.get('item.xml', function(data){
		$('#treeData').append( //헤더정보만 출력
				"<tr>" +
					"<th>id</th>"+
					"<th>name</th>"+
					"<th>price</th>"+
					"<th>description</th>"+
				"</tr>"
		);
		
		//xml포맷으로 데이터가 전달되어져 올 때는 포맷을 잡을 때 items라는 태그 안에 item단위로 데이터를 담아주고 있다.
		//입력으로 전달받은 data에서 find함수에 입력으로 실질적인 데이터가 담긴 item을 넣어주도록 한다. 
		$(data).find('item').each(function(){
			var $item = $(this); //변수선언 -> 지금현재의 선택된 데이터관련 태그
			
			$('#treeData').append(
				"<tr>" + 
					"<td align='center'>"+$item.attr('id')+"</td>"+ //attr에 속성의 값만 입력으로 넣어주게 되면 해당 속성에 담긴 값을 반환해주게 됨.
					"<td align='center'>"+$item.attr('name')+"</td>"+
					"<td align='right'>"+$item.find('price').text()+"</td>"+ 
					//태그를 찾을 때는 find함수를 활용해서 태그의 이름을 입력으로 넣어주면 된다. 
					//=> find는 태그만 찾은 것이고 실질적인 값을 출력하려면 메서드체이닝 방식으로 text함수(태그형태로 전달받은 데이터도 텍스트로 리턴)를 호출하도록 한다. 
					"<td align='left'>"+$item.find('description').text()+"</td>"+
				"</tr>"
			);
		});		
	});
});
</script>

<!-- xml포맷으로 데이터가 서버에 저장이 되어있을 때, xml포맷은 데이터를 응답으로 받아서 
     자바스크립트에서는 어떻게 처리를 할 수 있는 것인지에 대한 방법적인 부분을 살펴볼 예정
     
     여기에서의 get방식은 전송방식을 의미함 -->
<title>XML 파일을 GET 방식으로 로드하기 - $.get()</title>
</head>
<body>
	
	<table id="treeData"></table> 
	
</body>
</html>