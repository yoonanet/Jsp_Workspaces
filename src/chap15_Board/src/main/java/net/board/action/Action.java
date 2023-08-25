package net.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서비스와 연동할 때는 상속에 구조하에 다형성을 이용해서 메소드를 오버라이딩하는 구조로 정의할 목적
//실질적인 컨트롤러 안에서 사용할 인터페이스를 정의 => 실질적인 기능을 수행하기 위한 Action의 이름으로 정의한다. (스프링에서는 service라는 이름이 주로 사용됨.)
//                                                     jsp에서는 개발자 성향에 따라서 여러 이름들로 정의됨
public interface Action { //doProcess의 요청이 오면 최종적으로 else if문으로 요청을 처리하고 있음. 그 다양한 요청 사항을 다형성에 의해 간결한 코드로 처리할 수 있도록 인터페이스를 만듦.
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; 
	//execute메소드를 호출할 때 request, response의 객체를 그대로 전달받게 해줘야 실질적인 서비스레이어에서도 동일하게 사용할 수 있음
	
}
