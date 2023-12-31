<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>
<script>
function check(){
	var id=loginform.MEMBER_ID.value;
	var pass=loginform.MEMBER_PW.value;
	
	if(id.length == 0){
		alert("아이디를 입력하세요.");
		loginform.MEMBER_ID.focus();
		return false;
	}
	if(pass.length == 0){
		alert("비밀번호를 입력하세요.");
		loginform.MEMBER_PW.focus();
		return false;
	}
	
	return true;
}

function openConfirmId(loginform){	//폼에 해당하는 name을 넣어줌.
	var url="./MemberFind.me";
	//window.open -> 새로운 윈도우창을 뜨도록 함. (window생략가능)
	open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"+ //최근버전부터는 옵션에 해당하는 속성 지원을 아예 안함.(체크하고 있기)
						 "scrollbars=no,resizable=no,width=450px,height=300");
	//서버의 창을 띄우면서 서버에 url을 보내게끔 셋팅해주고 있음. 이때 띄워진 창에 이름이 confirm임.
}
</script>
</head>

<body>
<table width="960" cellspacing="0" cellpadding="0" border="0" align="center">
	<tr>
		<td colspan="2" align="center" >
			<table border="0" cellpadding="0" cellspacing="0" width="500">
				<!--회원 로그인 -->
				<tr>
					<form action="./MemberLoginAction.me" method="post" name="loginform" onsubmit="return check()">
					<td><br><br>
						<table width="400" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td bgcolor="f6f6f6">
									<table width="400" border="0" cellspacing="4" cellpadding="0">
										<tr>
											<td valign="top" bgcolor="#FFFFFF">
												<table width="100%" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td align="center">
															<table cellpadding=0 cellspacing=0 border=0>
																<tr>
																	<td width=73>아이디</td>
																	<td width=9>:</td>
																	<td width=103>
																		<input type=text name="MEMBER_ID" size=12 maxlength=20>
																	</td>
																	<td width=66 rowspan=3><input type="submit" value="로그인"></td>
																	<td width=26 rowspan=3></td>
																</tr>
																<tr>
																	<td height=4 colspan=3></td>
																</tr>
																<tr>
																	<td width=73>비밀번호</td>
																	<td width=9>:</td>
																	<td width=103>
																	<input type=password name="MEMBER_PW" size=12 maxlength=12>
																	</td>
																</tr>
																<tr>
																	<td height=35 colspan=6 align="center">
																		<input
																			type="button" value="회원가입"
																			onclick="javascript:window.location='./MemberJoin.me'"> 
																			<!-- 자바스크립트에서 window(브라우저를 관리함)의 location객체는 윈도우즈 창에서 주소값을 관리함.(주소록 관리)
																			     window.location을 통해서 지정한 값은 서버에 요청하게 됨. -->
																		<a href="#">
																		<input type="button" value="아이디/비밀번호 찾기"
																			onclick="openConfirmId(this.form)"> <!-- 함수 호출하면서 지금 현재의 폼을 입력으로 넣도록 함 -->
																		</a>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td style="padding: 15 0 15 70;">
														<table width="400" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td width="8"><img src="#" width="8" height="7"></td>
																<td width="392">
																	<font size=2 color="565656">
																	아이디가 없을 경우 '회원가입'을 클릭하십시오.
																	</font>
																</td>
															</tr>
															<tr>
																<td><img src="#" width="8" height="7"></td>
																<td>
																	<font size=2 color="565656">
																	아이디 또는 비밀번호를 잊어버렸을 경우 '아이디/비밀번호 찾기'를 클릭하십시오.
																	</font>
																</td>
															</tr>
														</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					</form>
				</tr>
			</table>
			<!-- 회원 로그인 -->
		</td>
	</tr>
</table>
</body>
</html>
