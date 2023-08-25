package net.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.service.BoardAddAction;
import net.board.service.BoardDeleteAction;
import net.board.service.BoardDeleteView;
import net.board.service.BoardDetailAction;
import net.board.service.BoardListAction;
import net.board.service.BoardReplyAction;
import net.board.service.BoardReplyView;
import net.board.service.BoardUpdateAction;
import net.board.service.BoardUpdateView;




@WebServlet("*.bo") 
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doGet() 호출.");
		doProcess(request, response); //request와 response를 다시 전달하는 것임.
	}

	/* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doPost() 호출.");
		doProcess(request, response);
	}
	
	
	

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();   // 이 메소드는 /chap15_Board/BoardWrite.bo를 반환해줄 것이다.
		System.out.println("URI : " + requestURI);
		String contextPath = request.getContextPath(); // 이 메소드는 /chap15_Board를 반환해줄 것이다. (프로젝트 이름 반환하는 것임.)
		System.out.println("path : " + contextPath);
		
		String command = requestURI.substring(contextPath.length()); 
		System.out.println("command : " + command); // command : /BoardWrite.bo반환 => 사용자의 요청정보가 담긴 것임.
		
		
		Action action = null; 
		ActionForward forward = null; 
		
		
		if(command.equals("/BoardWrite.bo")) { 
			forward = new ActionForward();
			forward.setPath("./board/qna_board_write.jsp"); 
			forward.setRedirect(false); 
				
			
			
	
		}else if(command.equals("/BoardAddAction.bo")) { 
			//System.out.println("==> /BoardAddAction.bo");
			
		
			action = new BoardAddAction(); 
			forward = action.execute(request, response);
			
			
		
		}else if(command.equals("/BoardList.bo")) { 
			action = new BoardListAction();
			forward = action.execute(request, response); 
			
			
			
		}else if(command.equals("/BoardDetailAction.bo")) { 
			action = new BoardDetailAction();
			forward = action.execute(request, response);
		
		
		}else if(command.equals("/BoardReplyView.bo")) { 
			action = new BoardReplyView();
			forward = action.execute(request, response);
		
		
		}else if(command.equals("/BoardReplyAction.bo")) {
			action = new BoardReplyAction();
			forward = action.execute(request, response);
			
			
		}else if(command.equals("/BoardDownload.bo")) { 
			forward = new ActionForward();
			forward.setPath("./board/qna_board_download.jsp");  
			forward.setRedirect(false);
		}
		
		else if(command.equals("/BoardUpdateView.bo")) {  //수정
			action = new BoardUpdateView();
			forward = action.execute(request, response);
		}
		
		else if(command.equals("/BoardUpdateAction.bo")) {  //수정
			action = new BoardUpdateAction();
			forward = action.execute(request, response);
		}
		
		else if(command.equals("/BoardDeleteView.bo")) {  //삭제
			action = new BoardDeleteView();
			forward = action.execute(request, response);
		}
		
		else if(command.equals("/BoardDeleteAction.bo")) {  //삭제
			action = new BoardDeleteAction();
			forward = action.execute(request, response);
		}
		
		
		
		
		if(forward != null) {
			
			if(forward.isRedirect()) { 
				response.sendRedirect(forward.getPath()); 	
			}else {	
				
				RequestDispatcher dispather = request.getRequestDispatcher(forward.getPath()); 
				dispather.forward(request, response);  
			}
		}
			
	}
	
	
}



