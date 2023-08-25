package net.board.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.board.db.BoardDAO;
import net.board.db.BoardVO;

public class BoardReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //댓글로 작성된 게시물 정보를 꺼내와서 DB에 저장
		//댓글은 단순하게 저장할 목적이 아니고, 기존에 삽입에서 구분할 수 있는 처리 기술이 추가적으로 포함되어야 함 -> 따라서 기존 insert메소드를 활용하지 않는다.
		//데이터를 꺼내와서 자바빈에 담고, DAO에 전달하는 시퀀스가 똑같음
		
		request.setCharacterEncoding("UTF-8"); 
		//post방식은 파라메타에서 꺼내기 직전에 디폴트가 톰캣 9버전 이하까지는 서유럽어로 인코딩을 하기 때문에 인코딩의 방식을 utf-8로 지정해줘야만 한글이 깨지지 않고 반환됨.
		
		BoardVO board = new BoardVO(); //자바빈에 박명수가 입력한 데이터를 먼저 저장.
		BoardDAO dao = new BoardDAO();
		ActionForward forward = new ActionForward();
		
		board.setBoardNum(Integer.parseInt(request.getParameter("boardNum"))); 
		//저장할 수 있는 값이 숫자값이기 때문에 Integer객체의 parseInt를 통해 정수값으로 변환하여 담아주도록 한다.
		board.setBoardName(request.getParameter("boardName"));
		board.setBoardPass(request.getParameter("boardPass"));
		board.setBoardSubject(request.getParameter("boardSubject"));
		board.setBoardContent(request.getParameter("boardContent"));
		
		//댓글에 관련된 데이터(원글에 저장되어 있는 데이터를 끌어다오는 것임.)
		board.setBoardReplyRef(Integer.parseInt(request.getParameter("boardReplyRef")));
		board.setBoardReplyLev(Integer.parseInt(request.getParameter("boardReplyLev")));
		board.setBoardReplySeq(Integer.parseInt(request.getParameter("boardReplySeq")));
		
		int result = dao.boardReply(board);
		
		if(result == 0) { 
			System.out.println("댓글 저장 실패");
			return null; //더이상에 액션을 취하지 않고 빠져나오게끔 코드 넣어주기
		}
		
		
		forward.setRedirect(true);
		forward.setPath("./BoardDetailAction.bo?num="+result); //내가 댓글로 작성하여 등록한 정보에 대한 DB상의 고유 번호를 넣어주도록 한다.
		
		
		return forward;
	}

}
