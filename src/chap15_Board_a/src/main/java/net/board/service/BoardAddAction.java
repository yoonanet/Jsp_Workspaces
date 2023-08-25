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
		String realFolder = ""; //절대경로를 담아주기 위해 생성한 변수
		String saveFolder = "/boardUpload"; //첨부되어져온 파일을 보관할 폴더를 먼저 생성 -> boardUpload -> 이후 이름을 등록
		ActionForward forward = new ActionForward();
		
		
		BoardVO boardVO = new BoardVO(); //자바빈의 메모리를 생성하여 데이터를 저장하도록 한다.
		BoardDAO boardDao = new BoardDAO();
		
		
		
		realFolder = request.getSession().getServletContext().getRealPath(saveFolder); 
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy()); 
		
		
		//[자바빈에 데이터 저장]
		boardVO.setBoardName(multi.getParameter("BOARD_NAME"));
		boardVO.setBoardPass(multi.getParameter("BOARD_PASS"));
		boardVO.setBoardSubject(multi.getParameter("BOARD_SUBJECT"));
		boardVO.setBoardContent(multi.getParameter("BOARD_CONTENT"));
		boardVO.setBoardFile(multi.getFilesystemName((String)multi.getFileNames().nextElement())); 
		
		
		if(!boardDao.boardInsert(boardVO)) { 
			System.out.println("게시판 등록 실패");
			return null; 
		}
		
		
		forward.setPath("BoardList.bo"); 
		forward.setRedirect(true);
		
		return forward;
	} 
}
