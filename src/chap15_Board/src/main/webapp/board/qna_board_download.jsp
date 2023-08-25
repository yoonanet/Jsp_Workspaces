<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>download</title>
</head>
<body>
<%  //파일 다운로드는 상세화면에서 첨부파일명을 클릭했을 때 다운로드되도록 연결을 시켜주면 된다. 
	request.setCharacterEncoding("UTF-8");
	
	String fileUrl = "";
	String path = request.getParameter("path");
	String saveFolder = "/boardUpload/" + path;

	fileUrl = request.getSession().getServletContext().getRealPath(saveFolder);
	System.out.println(fileUrl);
	
	//응답에 필요한 헤더 정보들을 전달함 (표준에 해당되는 설정셋팅들이다.)
	response.setContentType("application/octet-stream;");
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Cache-Control", "no-store, no-cache,must-revalidate");
	response.setHeader("Cache-Control", "post-check=0, pre-check=0");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Content-Disposition", "attachment; filename =\"" + request.getParameter("path") + "\"");
	
	out.clear();
	out = pageContext.pushBody();
	
	//현재 첨부되어진 내용들을 하나하나씩 읽으면서 브라우저 스트림에 연결해서 전달하면서 파일로 저장되어지게끔 구현되어져 있는 코드이다.
	//네트워크로 첨부된 파일을 바이트단위로 읽어가면서 거기에 데이터를 전송해주는 형태.
	java.io.BufferedOutputStream outs 
			= new java.io.BufferedOutputStream(response.getOutputStream());

	byte fileContens[] = new byte[8192];
	int read = 0;
	java.io.BufferedInputStream fin = null;
	try {
		fin = new java.io.BufferedInputStream(new java.io.FileInputStream(fileUrl));

		while ((read = fin.read(fileContens)) != -1) {
			outs.write(fileContens, 0, read);
			outs.flush();
		}
	} catch (Exception e) {
		;
	} finally {
		if (outs != null)
			outs.close();
		if (fin != null)
			fin.close();
	}
%>
</body>
</html>