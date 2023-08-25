package net.member.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet { //HttpServlet을 구현하는 구조임. 
	
	//doget, dopost의 전송방식을 달리해야하는 것은 서버입장이 아닌 클라이언트의 입장에서 정보요청시에 함부로 노출되면 안되기 때문에 구분하고 있던 것이였음
	//서버 입장에서는 요청을 받은 상태에서 post든 get이든 어떤 전송방식으로 요청을 해왔는지의 구분이 딱히 필요없음
	//서블릿 생성에서는 디폴트로 doget, dopost가 생성이 되어지는데 여기서 service의 메소드도 있음.
	//service메소드를 호출하면서 service 안에서 doget, dopost를 정의하고 있어서 전송방식에 따라서 톰캣이 호출하게끔 구조를 잡고 있다.
	//service메소드를 아예 오버라이딩을 하여 doget, dopost를 구분없이 처리하게끔 구조를 잡아주고 있는 것이다.
	//내부에서는 전송방식을 구분하도록 구현이 되어져 있음. 서버입장에서는 두 전송방식을 구분하지 않도록 하는 것임
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		//컨트롤러의 역할인 파싱을 먼저 하도록 함.
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action = null;

		System.out.println("요청명령: " + command);

		if (command.equals("/MemberLogin.me")) {
			forward = new ActionForward();
			forward.setPath("./member/member_login.jsp"); //db연동없이 바로 화면을 보내주도록 함.
		} else if (command.equals("/MemberJoin.me")) { //회원가입 화면
			forward = new ActionForward(); //액션이 이루어지면 바로 화면이 전송되어지는 것을 확인할 수 있음.
			forward.setPath("./member/member_join.jsp"); //아이디, 비밀번호 찾는 화면
		} else if (command.equals("/MemberFind.me")) {
			forward = new ActionForward();
			forward.setPath("./member/member_find.jsp"); 
		} else if (command.equals("/MemberOut.me")) {
			forward = new ActionForward();
			forward.setPath("./member/member_out.jsp");
		} else if (command.equals("/Zipcode.me")) {
			forward = new ActionForward();
			forward.setPath("./member/member_zipcode.jsp");
		} else if (command.equals("/MemberLoginAction.me")) {
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberJoinAction.me")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberModifyAction_1.me")) {
			action = new MemberModifyAction_1(); //DB와 연동!!
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberModifyAction_2.me")) {
			action = new MemberModifyAction_2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberDeleteAction.me")) {
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberIDCheckAction.me")) {
			action = new MemberIDCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberFindAction.me")) {
			action = new MemberFindAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberZipcodeAction.me")) {
			action = new MemberZipcodeAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
