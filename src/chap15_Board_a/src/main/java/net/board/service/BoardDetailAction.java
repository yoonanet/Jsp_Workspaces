package net.board.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.board.db.BoardDAO;
import net.board.db.BoardVO;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //상세화면을 서비스할 목적으로 만든 것임.
		//해당하는 데이터가 존재한다면 조회수를 증가시켜서 저장을 해줘야 한다!!
		int num =Integer.parseInt(request.getParameter("num")); //parseInt():입력으로 넣어준 값을 래퍼클래스의 자료형으로 변환해줌 
		
		BoardDAO dao = new BoardDAO();
		//데이터를 가지고 오기 직전에 조회수를 수정시켜주도록 한다. => 그래야 화면에 출력됨
		dao.setReadCountUpdate(num); //현재 눌린 게시물에 대한 고유번호를 인자값으로 전달하도록 한다.
		
		BoardVO board = dao.getDetail(num); //데이터를 저장했던 실질적인 인스턴스의 주소값을 반환되어 올 것이다.
		ActionForward forward = new ActionForward();
		
		if(board == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		
		request.setAttribute("boardData", board); 
		
		forward.setRedirect(false);
		forward.setPath("./board/qna_board_view.jsp");
		
		return forward; //컨트롤러단으로 어떻게 화면을 보여줄지에 대한 정보가 담긴 인스턴스 주소값 전송
	}

}
