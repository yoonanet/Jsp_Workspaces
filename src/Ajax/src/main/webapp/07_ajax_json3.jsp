<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>$.getJSON()으로 프리커(Flickr)에서 너구리(raccoon)와 관련된 이미지 얻기</title>
<!-- https://www.flickr.com/ => 이미지들을 웹사이트 저장소 공간에 저장을 해서 제공해주고, 사용자가 이미지를 등록할 수 있는 웹사이트 url (JSON의 포맷으로 데이터들을 관리하고 있음)
     [ 실제 화면을 구성하는데 있어서 json의 포맷을 적용하고 있는 웹사이트를 가지고 확인을 하는 시간을 가져볼 예정 ]
      -> 타사이트의 이미지들이나 데이터를 내가 만들고 있는 웹사이트에 출력할 수 있음. 이를 적용하는 실습 -->

<style type="text/css">
	img {
		height:100px; float:left;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){ 
	//JSON의 포맷으로 데이터를 관리하고 있는 사이트의 링크를 첫번째 매개변수로 지정(!!타사이트의 위치를 지정해주는 것임. url을 통한 등록!!), 두번째매개변수는 함수를 등록하도록 한다.
	//서버로부터 모든 데이터를 전달받음과 동시에 등록된 함수가 호출됨 => 전달받은 데이터를 등록한 함수의 첫번째 매개변수 data에 담아주면서 함수를 호출하게끔 동작됨.
	$.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?tags=raccoon&tagmode=any&format=json&jsoncallback=?", 
			 function(data){ 
				//입력으로 전달받은 전체 데이터 중에서 items라고 하는 키값이 적용되어진 데이터를 읽어오도록 함.
				$.each(data.items, function(index, item){
					//속성에 관련된 모든 작업은 attr(해당 태그의 속성 이름, 속성에 해당하는 값)함수를 활용하도록 한다.
					$('<img />').attr("src", item.media.m).appendTo("#images");
					//appendTo(): 뒤를 기준으로 앞에 태그를 자식으로 추가하겠다는 것임.
					
					if(index == 4) { //5개의 이미지만 화면에 뿌려보도록 함
						return false; 
					}
				});
			});		
	
});
</script>

</head>
<body>
	
	<div id="images"></div>
	
</body>
</html>