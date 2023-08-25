<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	th, td { 
		border: 1px solid gray;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 
<script type="text/javascript">
//04에서 jQuery제공 함수 중에 ajax라는 함수를 살펴봤었음.
//.ajax함수의 장점은 객체를 입력으로 전달하면서 한번에 여러 속성에 대한 처리를 담아서 처리할 수 있었음.
$(function(){
	$.ajax({//ajax실행 시점에 서버에 요청하게 되는 것임
		url:'item.json', //서버에 요청할 파일에 대한 정보
		dataType:'json', //데이터 포맷 정보에 대한 셋팅
		success:function(data){ //정상적으로 서버에 전달이 되어졌을 때 실행할 함수
		//서버에 ajax를 이용해서 정보를 등록만 해두게 되면 실행되는 시점에 이 정보를 가지고 서버에 요청하게 될 것이고, 
		//jquery라이브러리의 ajax가 성공적으로 데이터를 수신하게 되면 등록한 함수를 호출하게 되면서 지금 서버로부터 전달받은 데이터를 입력으로 전달받게 될 것이다.
			$('#treeData').append( 
					"<tr>" +
						"<th>id</th>"+
						"<th>name</th>"+
						"<th>price</th>"+
						"<th>description</th>"+
					"</tr>"
			);
			
			$.each(data, function(){
				$('#treeData').append(
						"<tr>"+
							"<td>"+this.id+"</td>"+ //json포맷을 선호하는 이유: 데이터를 꺼내올 때 전달받은 자신을 통해서 키값으로 꺼내옴.
							"<td>"+this.name+"</td>"+
							"<td>"+this.price+"</td>"+
							"<td>"+this.description+"</td>"+
						"</tr>"
				);
			});
		}
	});
});	
</script>

</head>
<body>

	<table id="treeData"></table> 

</body>
</html>