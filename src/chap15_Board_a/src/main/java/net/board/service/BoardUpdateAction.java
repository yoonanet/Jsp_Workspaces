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

public class BoardUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		BoardVO board = new BoardVO(); 
		BoardDAO dao = new BoardDAO();
		
		String realFolder = ""; 
		String saveFolder = "/boardUpload"; 
		
		
		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy());
		
		int num = Integer.parseInt(multi.getParameter("num"));
		
		board.setBoardNum(num);
		board.setBoardPass(multi.getParameter("boardPass"));
		board.setBoardSubject(multi.getParameter("boardSubject"));
		board.setBoardContent(multi.getParameter("boardContent"));
		board.setBoardFile(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
		
		int result = dao.boardUpdate(board);
		
		if(result == 0) { 
		 	System.out.println("게시판 수정 실패"); 
		 	
		 	forward.setPath("./BoardUpdateView.bo?num="+ num +"&msg=diff");
			forward.setRedirect(true);
			return forward;
		} 
		 
		forward.setPath("./BoardDetailAction.bo?num="+ num);
		forward.setRedirect(true);
		
		return forward;
	}

}
