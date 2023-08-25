package net.board.action;

public class ActionForward {
	private boolean isRedirect; //true는 sendRedirect할 명령, false는 forward할 명령으로 해석하여 처리
	//클라이언트의 요청에서 다이렉트로 forward를 통해 뷰화면을 보낼 것인지, 
	//sendRedirect를 통해 이미 구현된 화면을 브라우저에 재요청하여 보낼 것인지를 boolean값을 통해 확인하는 필드인 것이다. 
	private String path; //forward는 어떤 페이지로 이동할 것인지에 대한 정보, Redirect는 어떤 요청을 재전송할 것인지의 정보를 담아줄 용도의 필드

	
	public boolean isRedirect() { //반환형이 boolean일 경우에는 앞에 get(읽어올 때 사용)보다는 is로 많이 사용됨.
		return isRedirect;
	}
	
	public void setRedirect(boolean isRedirect) { //위 값을 셋팅할 메소드를 생성
		this.isRedirect = isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}
