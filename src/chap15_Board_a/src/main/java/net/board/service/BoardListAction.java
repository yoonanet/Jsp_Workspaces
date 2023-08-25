package net.board.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.board.db.BoardDAO;
import net.board.db.BoardVO;

public class BoardListAction implements Action  { 

	@Override //디버깅: 문제점을 해결하는 과정을 말함.
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //DB에 등록된 게시물을 읽어와서 자바의 메모리 영역에 보관하여 화면에 뿌려주는 기능 
		
		ActionForward forward = new ActionForward();
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = null; 
		
		
		
		int page = 1; 
		int limit = 10; 
		
		String pageData = request.getParameter("page"); 
		
		if(pageData != null) { 
			page = Integer.parseInt(pageData); 
		}
		
		
		int listCount = dao.getListCount();
		
		
		list = dao.getBoardList(page, limit); 


		//끝페이지를 계산하여 찾아주는 알고리즘.
		int endPage = (int)(Math.ceil(page / 10.0)) * 10; //1페이지일때, 1 / 10.0 = 0.1 여기서 올림해서 1이됨. 그렇게 1 * 10은 10이다. (페이징의 리스트의 끝페이지를 계산해줌)
		//문제점) 게시글의 갯수가 100개 미만일 때가 고려되지 않은 것임 (100개 미만이여도 1부터 10까지 페이지상에 표시해주게 됨)
		//        현재 게시물의 총 갯수를 구해서 endPage값보다 작으면 작은 페이지의 갯수로 처리를 해주도록 해야한다.
		int startPage = endPage - 9;
		
		int maxPage = (int)(Math.ceil((listCount * 1.0) / limit)); //현재의 페이지가 계산되어 나올 것임.
		//총 갯수는 정수형이기 때문에 실수형으로 만들어주기 위해서 1.0을 곱함. => 총갯수의 실수형으로 만들고 거기에 10나눔
		//만약 35면 4페이지까지는 나와야 함. => 이렇게 나누면 3.---이 나올 것이고 그 값을 올림처리하도록 함.
		
		if(endPage > maxPage) //전체게시물이 100이하의 갯수일 때
			endPage = maxPage; //maxPage의 갯수로 셋팅을 해줌.
		
		
		
		//자바에 저장된 데이터를 jsp가 사용하는 메모리영역에 저장하도록 하는 가교역할로써의 기능을 제공 -> !!setAttribute메소드를 활용!!
		request.setAttribute("boardlist", list); 
		
		//페이징 기능의 데이터를 jsp메모리 영역에 저장
		request.setAttribute("page", page); //현재의 페이지 데이터
		request.setAttribute("startPage", startPage); //시작페이지
		request.setAttribute("endPage", endPage); //끝페이지
		request.setAttribute("listCount",listCount); //현재 총 레코드 데이터 갯수
		
		
		// ./ => 현재요청한 파일 위치로써 webapp폴더의 위치 생각.
		forward.setPath("./board/qna_board_list.jsp"); //보내줄 화면에 대한 정보를 담아주면 됨.
		forward.setRedirect(false); //화면을 다시 요청하는 것이 아닌 새로운 화면을 보여줄 것이기 때문에 false로 셋팅 (다이렉트로 화면을 보내줄 목적이 내포)
		
		return forward; //현재 셋팅했던 화면에 대한 인스턴스의 주소값을 반환되도록 한다. => 호출했던 컨트롤러쪽으로 복귀하게 됨.
	}

}
