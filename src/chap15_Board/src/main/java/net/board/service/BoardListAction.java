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
		//DB에 저장된 모든 항목들을 각각의 위치에 구성하여 화면에 보여줄 수 있도록 한다. 
		//=> 한 화면에 10개의 항목으로 하여 페이징 기능을 순차적인 번호에 따라 구성하도록 함.
		
		//***자바가 사용하는 메모리에 영역에서 jsp에 영역에 옮겨담아서 화면상에 출력하도록 해야한다. 
		//=> request객체의 setAttribute()메소드를 활용하도록 한다. 이는 jsp가 관리하는 request메모리에 영역에 저장하게끔 제공해주는 메소드였음
		//   데이터를 꺼내올 때는 request객체를 통한 표현언어와 액션태그등을 이용할 수 있음
		//   이 핵심적인 기능을 리스트에서 적극적으로 활용할 예정
		ActionForward forward = new ActionForward();
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = null; //데이터가 담긴 컬렉션프레임워크의 주소값을 받을 참조 자료형.
		
		
		//[페이징처리↓]
		int page = 1; //디폴트는 1페이지로 만들어둠.
		int limit = 10; //하나의 페이지에 몇개의 게시물을 보여줄지에 대한 제한을 걸도록 함.
		
		String pageData = request.getParameter("page"); //페이징에서 클릭된 번호에 대한 정보
		
		if(pageData != null) { 
			page = Integer.parseInt(pageData); //String의 값을 int로 바꿔서 페이지의 값을 업데이트
		}
		
		//지금 현재 게시물의 갯수를 통해 몇개까지 보여줄지 결정을 해줘야 함.
		int listCount = dao.getListCount(); // 전체 게시글에 대한 갯수
		
		
		//대부분의 웹사이트들은 일반적으로 리스트 화면을 보여줄 때 한화면에 보여줄 갯수를 고정하여 정의를 해주고, (수천만개의 데이터들을 DB에서 불러와서 하나의 브라우저에서 처리하게 된다면 실시간 서비스라는 컨셉에서 어긋남)
		//그 화면에 보여줄 데이터를 빠르게 읽어오면서 처리하여 퍼포먼스적인 부하를 줄이도록 한다. 
		//=> 보여지지 않는 게시글은 페이징 기능을 통해 번호를 클릭하면 해당 번호에 의미를 담은 설정한 고정 갯수만큼 리스트화면을 보여주게끔 처리되도록 화면 구성이 되어져야 한다.
		//1. DB에 저장된 데이터를 화면에서 꺼내오기 => 화면은 jsp로 구성 
		list = dao.getBoardList(page, limit); //데이터 받아옴 => 현재의 페이지를 전달하고, 가변적으로 페이지의 구성을 달리할 수 있도록 페이징의 갯수도 넣도록 함.
		//dao에서 메소드를 통해 데이터를 담은 컬렉션프레임워크의 주소값을 변수에 넣어주도록 한다.


		
/*[ 일반적으로 페이징은 어떤 알고리즘으로 동작이 되는가? ]
   데이터가 아주 많다면 페이징은 1~10까지 디폴트로 보여줌, 다음을 누르면 그 화면은 11~20까지 보여주게 될 것이다. => 해당 번호에 맞춘 게시물들을 보여주면 됨
   게시글이 적을 때도 고려를 해야함.(게시글에 따라 10개 미만의 페이징을 구성해야할 수도 있음)
   
   끝페이지를 먼저 계산을 해주는게 페이징에서 시작페이지를 계산하여 구현하기 더 쉬움!! => 계산된 페이지에서 -9를 해주면 되기 때문
   => Math.ceil(): 값을 나누었을 때 소수점이 존재하면 무조건 반올림을 해주는 기능이다. (나눗셈은 실수로 나눠줘야 한다. -> 소수점이하의 값이 0초과되는 값은 무조건 올림을 해주기 때문)
                   포인트는 실수의 값이 입력으로 전달되었을 때임. 실수 값을 무조건 올림수를 발생해서 결과를 리턴함
      ex) 사용자가 번호를 클릭해서 전송되어온 번호가 3번이라면? 페이징은 1~10까지 보여주면 됨. 
      
 */
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
