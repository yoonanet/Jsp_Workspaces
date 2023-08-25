package net.board.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.board.db.BoardDAO;
import net.board.db.BoardVO;

public class BoardReplyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardDAO dao = new BoardDAO();
		BoardVO board = null;
		ActionForward forward = new ActionForward();
		
		int num = Integer.parseInt(request.getParameter("num")); //DAO에 데이터 전달할 목적임. 이 데이터에 해당하는 필드값들을 DB에서 가져올 의도
		
		//파라미터로 전달받은 num에 해당하는 데이터를 가지고 올 수 있는 메소드가 DAO에 이미 정의가 되어져 있기 때문에 그 메소드를 호출하도록 한다.
		board = dao.getDetail(num);
		
		if(board == null) {
			System.out.println("답장 페이지 이동 실패.");
			return null;
		}
		
		request.setAttribute("boardData", board);
		
		forward.setRedirect(false);
		forward.setPath("./board/qna_board_reply.jsp");
		
		return forward;
	}

}