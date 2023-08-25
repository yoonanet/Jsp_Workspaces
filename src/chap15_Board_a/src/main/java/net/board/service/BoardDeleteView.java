package net.board.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.board.db.BoardDAO;
import net.board.db.BoardVO;

public class BoardDeleteView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		BoardDAO boardDao = new BoardDAO();
		BoardVO board = null;
		int num = Integer.parseInt(request.getParameter("num"));
		board = boardDao.getDetail(num);
		
		request.setAttribute("boardData", board);
		
		forward.setRedirect(false);
		forward.setPath("./board/qna_board_delete.jsp"); 
		
		return forward;
	}

}
