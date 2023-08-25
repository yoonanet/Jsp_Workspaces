package net.board.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.board.db.BoardDAO;
import net.board.db.BoardVO;

public class BoardDeleteAction implements Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		ActionForward forward = new ActionForward();
		
		int num = Integer.parseInt(request.getParameter("num")); 
		String pass = request.getParameter("boardPass");
		
		int result = dao.boardDelete(num, pass);
		
		if(result == 0) {
			System.out.println("삭제 실패.");
			
			forward.setPath("./BoardDeleteView.bo?num="+ num  +"&msg=diff");
			forward.setRedirect(true);
			return forward;
		}
		
		forward.setPath("BoardList.bo");
		forward.setRedirect(true);
		
		return forward;
	}

}
