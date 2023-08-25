package net.board.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.board.db.BoardDAO;
import net.board.db.BoardVO;

public class BoardAddAction implements Action { //실질적으로 클라이언트의 삽입과 관련된 요청이 올 때 처리할 수 있는 메소드를 정의할 목적의 클래스

	@Override 
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
	//post형식으로 데이터를 전송하기 때문에 한글이 깨지지 않게끔 인코딩의 방식을 UTF-8로 지정해주도록 한다.
	//=> cos에서 제공해주는 파라미터를 통해 꺼내오기 때문에(인코딩을 해서 보내지 않음) 별도로 인코딩타입을 톰캣에게 알려줄 필요가 없었음.	
	
	//클라이언트가 전송해온 파라미터를 꺼내와서 꺼내온 파라미터를 DB에 저장하고자 하는 것이 클라이언트의 요구사항이다. (DAO에 전달을 하여 DB에 저장하는 것이 최종 목표임)
	//즉, 클라이언트가 전송한 파라미터 값을 꺼내서 자바빈에 담아서 DAO에 넘겨주고 DAO에서는 SQL쿼리문에 의해서 DB에 삽입하게끔 동작구현을 해주면 된다.
		
	//MultipartRequest의 클래스를 이용해서 파라미터 값 뿐만 아니라 파일에 저장된 값까지 꺼내올 수 있음
		String realFolder = ""; //절대경로를 담아주기 위해 생성한 변수
		String saveFolder = "/boardUpload"; //첨부되어져온 파일을 보관할 폴더를 먼저 생성 -> boardUpload -> 이후 이름을 등록
		ActionForward forward = new ActionForward();
		
		
		BoardVO boardVO = new BoardVO(); //자바빈의 메모리를 생성하여 데이터를 저장하도록 한다.
		BoardDAO boardDao = new BoardDAO();
		
		
		
		realFolder = request.getSession().getServletContext().getRealPath(saveFolder); //request객체에서 제공해주는 getSession()메소드: 세션이라는 객체를 반환해주게끔 제공해주는 메소드이다.
		//세션객체 안에 getServletContext()메소드를 제공해주고 있음. getServletContext메소드가 어플리케이션 객체를 반환해주게끔 제공해주는 메소드임.
		//마지막으로 getRealPath()를 호출해주도록 한다. => 입력으로 파일을 보관하기 위해 생성했던 폴더의 정보를 넣어주면 c드라이브부터 최종적으로 현재 프로젝트 밑에 전달한 정보를 포함하여 절대경로를 반환해주게 됨
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy()); 
		//***MultipartRequest를 이용하면 파라미터값 뿐만 아니라 첨부되어져온 파일까지도 꺼내올 수 있음.
		// 첫번째 입력값으로 request객체를 넣어줘야 한다. (request객체에 파라메타와 첨부된 파일의 정보가 담겨있기 때문에 이 정보들을 알려줘야 내부에서 담겨진 파라메타값들을 꺼내올 수 있음), 
		// 두번째 입력값으로 첨부되어온 파일을 저장할 위치의 path정보를 알려주도록 한다. -> 폴더의 이름만 알려주게 되면 찾아가지 못하기 때문에 이 위치는 절대 경로로 알려주도록 한다.
		// 현재 프로젝트의 위치까지의 절대경로를 알려주는 기능이 application의 getRealPath를 호출하면 절대경로를 사용할 수 있음. 하지만 문제는 자바코드에서는 application객체를 직접적으로 사용할 수 없음.
		// 두 개의 값을 전달받게끔 정의되어져 있는 생성자도 있지만 추가적으로 세번째 매개변수도 넣어줄 수 있음 
		// => 파일을 첨부해서 전송해주고자할 때 최대 몇 크기만큼의 파일 첨부가 가능하게끔 할지를 제한할 수 있음 (첨부파일의 크기 제한두기)
		//네번째 매개변수는 텍스트에 대한 처리 포맷(인코딩 타입)을 지정해주도록 한다, 다섯번째 매개변수에는 cos.jar에서 제공해주는 DefaultFileRenamePolicy의 자료형의 인스턴스를 생성하도록 함
		//DefaultFileRenamePolicy 참조 자료형: rename정책. 파일이 전달되어져서 보관을 할 때, 파일의 내용이 전혀 다른데 기존에 파일과 동일한 이름으로 첨부되어져서 온다고 할 때 어떻게 처리를 해야할까?
		//                                     이 자료형을 활용하면 자체적으로 새로운 이름을 부여해주게끔 동작이 되어진다. 
		//결과창을 보면 동일이름의 파일이 삽입되면 파일 이름 뒤에 1,2,3으로 숫자를 부여하면서 새로운 이름으로 삽입하게끔 처리되어지는 것을 확인할 수 있다.
		
		
		//[자바빈에 데이터 저장]
		//데이터를 꺼내오는 기능의 메소드 이름이 request와 동일하게 제공 => getParameter()
		//입력으로 입력양식태그마다의 파라메타로 전송되어져 오는 꺼내오고자 하는 대상에 대한 name속성의 이름을 넣어주면 된다. -> 그에 해당하는 value값을 리턴해줌.
		boardVO.setBoardName(multi.getParameter("BOARD_NAME"));
		boardVO.setBoardPass(multi.getParameter("BOARD_PASS"));
		boardVO.setBoardSubject(multi.getParameter("BOARD_SUBJECT"));
		boardVO.setBoardContent(multi.getParameter("BOARD_CONTENT"));
		boardVO.setBoardFile(multi.getFilesystemName((String)multi.getFileNames().nextElement())); 
		//첨부된 파일은 getFilesystemName이라는 메소드를 이용해서 꺼내오도록 한다.
		//=> 파일의 입력양식으로 추가를 했기 때문에 getFileNames메소드의 nextElement를 통해 첨부되어진 파일에 대해 꺼내오는 요청을 해주도록 한다.
		//유의) nextElement메소드의 최종 반환형이 모든 자료형에 대한 처리를 위해서 최상위부모 클래스인 Object로 정의가 되어져 있기 때문에 강제형변환을 통해서 getFilesystemName메소드의 입력으로 전달을 해주도록 한다.
		//DB파일에서 select를 통해 삽입된 데이터를 확인해보면 nextElement의 메소드로 꺼내오기 때문에 파일의 이름을 리턴해주고 있다는 것을 확인할 수 있다.
		
		
		//자바빈에 데이터를 저장한 이유는 DAO에 삽입하는 기능의 메소드를 호출할 때 사용할 의도임
		if(!boardDao.boardInsert(boardVO)) { //호출하면서 위에 담았던 데이터를 입력으로 전달 => !를 붙여주니까 false일 경우를 조건문으로 잡은 것임.
			System.out.println("게시판 등록 실패");
			return null; //포워드의 객체로 반환을 해주기 때문에 null로 코드를 수정하도록 함.
		}
		
		
		//처리가 수행이 되어지면 호출해준쪽(컨트롤러쪽)으로 이에 대한 정보가 리턴이 될 것이다.
		forward.setPath("BoardList.bo"); //브라우저에 어떠한 페이지로 어떻게 이동해갈 것인지에 대한 정보를 셋팅을 해주도록 한다.
		forward.setRedirect(true);
		
		return forward;
	} //글을 등록하고 나면 대부분의 게시판들은 글을 등록했던 목록화면이 보여짐.
}
