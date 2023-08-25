<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>
</head>
<body>
<table width="960" cellspacing="0" cellpadding="0" border="0"
	bordercolor="gray" align="center">
<tr>
<td colspan=2>
<!-- 상품 등록 -->
<table border="0" width="80%">
<form name="goodsform" action="./GoodsAddAction.ag" method="post" 
	enctype="multipart/form-data"> 
	<!-- 파일첨부에서 이미지 등록하기 위해서 cos.jar에서 제공하는 multipart/form-data를 통해 셋팅
	     여기서의 동작들은 최종적으로 DB에 데이터들이 저장되어야 함!! -->
	<input type="hidden" name="goods_best" value="0">
	<tr> 
		<td>
			<p align="center">
				<span style="font-size: 26pt;">상 품 등 록</span> 
				<!-- !!상품 등록 화면과 상품의 정보 테이블이 서로 매핑되어져 있어야 한다!!  -->
			</p>
		</td>
	</tr>
	<tr>
		<td height="331">
		<table border="1" align="center" width="558">
			<tr>
			<td width="196" height="30">
				<p align="center">
					<font size=2>카테고리</font>
				</p>
			</td>
			<td width="346" height="30">
				<select name="goods_category" size="1">
					<option value="outwear" selected>아웃웨어</option>
					<option value="fulldress">정장/신사복</option>
					<option value="Tshirts">티셔츠</option>
					<option value="shirts">와이셔츠</option>
					<option value="pants">팬츠</option>
					<option value="shoes">슈즈</option>
				</select>
			</td>
			</tr>
			<tr>
			<td>
				<p align="center"><font size=2>상품이름</font></p>
			</td>
			<td><input type="text" name="goods_name"></td>
		</tr>
		<tr>
			<td>
				<p align="center"><font size=2>판매가</font></p>
			</td>
			<td><input type="text" name="goods_price"></td>
		</tr>
		<tr>
			<td>
				<p align="center"><font size=2>색깔</font></p>
			</td>
			<td><input type="text" name="goods_color"></td>
		</tr>
		<tr>
			<td>
				<p align="center"><font size=2>수량</font></p>
			</td>
			<td><input type="text" name="goods_amount"></td>
		</tr>
		<tr>
			<td>
				<p align="center"><font size=2>사이즈</font></p>
			</td>
			<td><input type="text" name="goods_size"></td>
		</tr>
		<tr>
			<td width="196">
				<p align="center"><font size=2>제품정보</font></p>
			</td>
			<td width="346">
				<textarea 
				name="goods_content" cols=50 rows=15></textarea>
			</td>
		</tr>
		<tr>
			<td>
			<p align="center"><font size=2>메인 제품이미지(gif)</font></p>
			</td>
			<td><input type="file" name="file4"></td></tr>
			<tr>
			<td>
			<p align="center"><font size=2>제품이미지1(gif)</font></p>
			</td>
			<td><input type="file" name="file3"></td></tr>
			<tr>
			<td>
			<p align="center"><font size=2>제품이미지2(gif)</font></p>
			</td>
			<td><input type="file" name="file2"></td></tr>
			<tr>
			<td>
			<p align="center"><font size=2>제품이미지3(gif)</font></p>
			</td>
			<td><input type="file" name="file1"></td>
		</tr>
	</table>
	</td>
</tr>
<tr>
	<td height="75">
	<p align="center"><input type="submit" value="등록">&nbsp;
	<input type="reset" value="다시쓰기"></p>
	</td>
</tr>
</table>
</form>		
<!-- 상품 등록 -->
</td>
</tr>
</table>
</body>
</html>
