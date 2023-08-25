package filter;

import java.io.IOException;

import javax.servlet.Filter; //톰캣이 제공해주는 필터를 사용하도록 한다. (톰캣(되도록 javax에 담김)은 jsp나 서블릿이기 때문임)
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter { //서블릿에서 제공해주는 필터 기능을 이용하기 위해 기존에 만들어진 Filter 인터페이스를 구현하도록 하자.

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	//web.xml에 설정해놓은 정보를 보고 브라우저에 해당 요청이 오면 그 요청의 이벤트를 탐지해서 필터를 구동시키는 이벤트 처리의 동작과 동일하다.
	//=> 우리가 호출할 목적이 아님. 이렇게 인터페이스 구조로 처리되어지는 것은 이벤트처리에서 사용이 됨. 
	//   필터와 관련된 이벤트가 발생되면 톰캣이 메소드를 호출하면서 실행된 것을 간접적으로 알려줌.(즉, 콜백함수임)
	
	//자바라는 프로그래밍언어에서는 이벤트가 발생했을 때 사용자한테 어떻게 알려주는지에 대한 사항을 알고 있어야 한다. (서블릿은 자바에 기반을 둔 기술이기 때문)
	//ex. 사용자가 입력한 값 그대로 가지고 쿼리문자열을 만들어서 서버에 요청해달라고 동작되게끔 기능을 제공해주는 것이 웹표준이였음
	//    이를 활용해서 사용자의 액션에 의한 원하는 바를 구현하면서 서비스를 해주도록 했었다.
	//이벤트에 대한 감지는 운영체제가 하지만 운영체제가 웹표준에게 알려줄 것이고, 우리는 html로부터 프로그래밍의 form태그의 submit으로 구현하여 이벤트에 대한 정보를 받을 수 있도록 한 것이다.
	//=> 지금의 필터 이벤트가 전송이 되어져서 서버로 오면 톰캣이 가장 먼저 받을 것이고, 톰캣으로부터 우리는 필터에 대한 이벤트 정보를 전달받기 위해 기능 처리를 정의하도록 한다.
	//   필터이벤트가 발생하면 톰캣(동작 수행 주체)이 doFilter라는 메소드가 호출이 되게끔 기능이 구현되어져 있다. -> 우리는 이벤트가 발생되었다는 것을 확인하면 됨.	
		
			
	/* 유의) 이 톰캣이 http프로토콜 방식만 지원하는 서버가 아니다. 여러 표준 중에 하나가 http일 뿐이다.
	         필터를 정의했을 때는 자료형을 유념해서 봐야한다. 서블릿에서의 메소드에서는 HttpServletRequest, HttpServletResponse자료형의 객체를 넘겨 받고 있었음. (http통신 프로토콜 규약에 맞게끔 기능들을 구현해주고 있을 뿐이다.)
	                                                          => http서비스가 이루어지도록 그 http프로토콜의 방식을 상속받는 기능의 객체를 넘겨받고 있던 것임.
	   => 외부에서 요청을 해오면 처리의 코드가 http서블릿이라고 하는 자료형으로 전달이 되어져 오고, 필터의 정의는 범용적으로 ServletRequest로 되어있기 때문에
	      선행적으로 request의 이름 자체에 대한 자료형을 강제형변환 해주도록 한다. => 요청이 http프로토콜 방식이기 때문에 통신에 대한 자료형에서 강제형변환한 것임. */
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		//세션에 MEMBER라는 이름이 있는지를 먼저 살펴봐야 한다. 그래야 로그인한 사람인지를 판단할 수 있음
		HttpSession session = httpRequest.getSession(); //메소드를 통해서 세션객체를 반환받아오도록 한다.
		
		boolean login = false;
		if(session != null) { //세션정보가 없을 경우를 체크하도록 한다.
			if(session.getAttribute("MEMBER") != null) { //MEMBER키값이 존재하면
				login = true; 
				System.out.println("로그인된 사람.");
			}
		}
		
		if(login) { //로그인이 됐으면 이동을 해야 하는 것임 => 이동에 대한 기능이 FilterChain에 담겨 있는 것
			chain.doFilter(httpRequest, httpResponse);
			//doFilter(): 원래 요청했었던 jsp페이지로 이동을 해가서 수행이 되어지게 된다. => 리스트 페이지
		}else { //로그인이 안된 사람이면 로그인에 대한 화면으로 이동이 되어야 함. (포워딩 처리되도록 함) => 전처리의 과정없이 폼만 보여주면 됨.
			RequestDispatcher dispather = request.getRequestDispatcher("/loginForm.jsp");
			dispather.forward(request, response);
		}
		
		
	} 
	

}

