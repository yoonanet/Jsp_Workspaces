package model;

//서블릿에서 최소한으로 필요한 코드는 이클립스가 자동으로 생성해주고 있음. => 서블릿을 생성했지만 확장자가 .java이고, 클래스가 정의된 형태이다.
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login.do") //자동완성으로 보여주고 있던 기능 => 로그인 버튼을 눌렀을 때의 임의의 이동경로를 알려주게 되면 설정과 같이 동작됨. (UI에서 폼태그의 액션속성에 지정)
//내가 지금 만들어준 클래스 이름으로 클래스 생성 -> HTTPServlet을 상속받는 구조로 자동적으로 코드를 구성해주고 있음.
//HTTPServlet=> http프로토콜방식으로 서블릿으로 서비스 동작되게끔 정의되어져 있는 자료형임.
public class LoginProcessServlet extends HttpServlet { 
	//private static final long serialVersionUID = 1L; //버전관리를 위해서 만들어진 필드(신경안써도 됨) - 강사님 지우심.
	
	//파일을 생성하면서 체크했던 부분이 메서드로 자동 생성이 되어지고 있음.
	//톰캣에게 설정값으로 클래스를 알려주면 전송방식에 따라서 클래스의 get방식과 post방식에 따라서 메소드를 호출해주게끔 동작이 되어진다.
	//톰캣이 매개변수의 입력도 전달을 해주고 있는 것이다.
	//실질적인 작업은 클라이언트의 요청이 왔을 때 전송방식에 따라 콜백함수를 연결하여 사용하도록 한다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet"); //로그인을 누르면 doGet메소드를 호출함. -> 전송방식이 get방식일때 호출됨.
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doPost"); //전송방식이 post방식일때 호출됨.
		
		//loginProc.jsp에서 지정한 똑같은 동작을 하도록 할 목적의 실습
		response.setContentType("text/html; charset=UTF-8"); //정보를 서블릿에 전송하는 방법
		//response(응답과 관련된 정보)의 객체를 통해 브라우저에 텍스트를 어떻게 처리할지 먼저 알려주도록 한다.(jsp가 .java로 변환될 때 브라우저가 텍스트를 읽는 방식을 알려주는 것임)
		//pageEncoding => 톰캣에게 알려주는 정보로 브라우저에게는 상관이 없음. 그렇기 때문에 브라우저에 보내줄 필요가 없음.
		
		request.setCharacterEncoding("UTF-8"); //파라미터값을 post방식으로 꺼내올 때의 텍스트처리 방식을 지정(자바코드이기 때문에 jsp와 처리는 동일함.) 
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//기존 html의 코드는 텍스트 단위로 전송을 해야 브라우저가 인식할 수 있었음. => 서블릿에서는 텍스트 단위의 코드를 직접적으로 작성을 해야함.
		//현재 서버와 클라이언트간에 데이터를 전송하기 위한 연결통로를 먼저 만들어줘야 한다. (연결통로를 만들어주는 jsp의 객체가 out임. => 하지만 지금은 out객체를 직접적으로 사용할 수 없음)
		//jsp에서는 출력스트림에 대한 연결통로를 톰캣이 미리 생성을 해주고 있었음 => 즉, 톰캣이 만들어놓은 연결통로를 사용하는 것이 효율적인 것임
		//응답과 관련된 다양한 정보들을 같이 담아서 전송할 수 있었기 때문에 쿠키에서도 활용이 됐었음.
		PrintWriter out = response.getWriter(); //getWriter메소드: 반환형이 PrintWriter자료형(문자열 처리에 대한 출력 스트림_자바에서도 권고함/채팅프로그램에서 사용했던 스트림임)이다.
		                                        //                 지금 요청해온 클라이언트의 ip를 보면서 출력 스트림을 이미 만들어두고 있는 getWriter메소드를 통해 out객체 생성할 수 있는 것이다.
		
		/*입출력 관점에서의 바이너리 개념에서 write를 자바코드에서 사용했었음. 
		  하지만 입력으로 전송되어진 값을 스트림에 연결된 대상으로 보내는 것은 동일하기 때문에 print를 사용해도 상관 없음.
		  하나 하나씩 텍스트들을 브라우저에 보내주게끔 한다. (서블릿으로 화면을 응답보내기 위해서는 아래와 같이 코드를 작성해야 하는 것이다.)
		  
		  jsp를 통해 화면을 구성하다보면 번거롭기 때문에 서블릿을 어떻게 활용하면 코드를 더 쉽게 구성할 수 있을지에 대한 실습을 할 예정 => MVC를 활용*/
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>Insert title here</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("안녕하세요, " + id + "님!!!<br>");		
		out.println("</body>");
		out.println("</html>");

		
	}

}
