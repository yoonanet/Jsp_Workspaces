package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//VO와 연동이 되면서 DB에 실질적인 로직이 구현되어지는 자료형임. DB에 쿼리문을 날리면서 처리할 기능들이 탑제된 클래스임.
//=> 실질적으로 DB와 연동하는 영역인 repository레이어.
public class BoardDAO { // CRUD 기능 구현
	DataSource ds;
	
	//jdbc를 적용할 때는 어떤 DB를 사용할 것인지에 대한 정보를 자바에게 알려줘야 했었음 -> 서블릿에서는 톰캣에게 정보를 알려주도록 한다.
	//=> META-INF - context.xml에 작성하여 알려주도록 한다.
	//context는 대상이 사용하는 영역을 의미 -> 웹context는 톰캣이 구동되기 위해 사용하는 영역을 의미한다. (톰캣은 내부를 들여다보면 서블릿context, jspcontext가 있음.)
	public BoardDAO() {
		
		try {
			Context init = new InitialContext();
			//톰캣7버전부터는 라이브러리로 커넥션풀을 탑제하여 제공해주고 있음!! -> 가져다가 사용만 하면 됨
			//context를 초기화하겠다는 것임. 방금 전에 만들었던 파일 중 context.xml를 땡겨가면서 인스턴스를 생성해주게 된다. 따라서 context.xml파일로써 DB의 초기화 내용을 먼저 지정해주면 됨.
			
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB"); 
			//커넥션풀의 위치를 lookup에 알려주면 됨. 그렇게 커넥션풀을 찾아가게 된다. 
			//커넥션 풀의 디폴트로 잡혀져 있는 디렉토리 위치가 java:comp/env이다. -> 디폴트 위치에서 name에 지정했던 위치정보를 뒤에 넣어주도록 한다. 
			//주의) 디폴트의 디렉토리 위치 뒤에 context에 지정한 name의 이름 위치랑 동일하게 작성해주도록 한다. => 반환형이 object이기 때문에 DataSource자료형으로 강제형변환하기 
			//연결객체를 커넥션풀에서 DataSource라는 자료형의 참조변수를 이용해서 나중에 사용할 커넥션풀의 객체를 가져오는 기능을 사용하도록 한다.
			
		} catch (NamingException e) {
			System.out.println("DB 연결 실패: " + e.getMessage());
			return;
		} 
	}
	
	// 현재 DB에 저장되어져 있는 게시글의 전체 개수 구하기
	public int getListCount() {
		String sql = "select count(*) from board";
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		int result = -1;
		
		try {
			con = ds.getConnection(); 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}

			return count;
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch (SQLException e) {} 
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {} 
			if(con != null) try { con.close(); } catch (SQLException e) {} 
		}	
		
		return count;
	}
	
	
	// 글쓰기
	public boolean boardInsert(BoardVO board) { //실질적으로 삽입된 갯수를 리턴이 되어질 것이다.
	//실질적으로 DB와 작업하려면 연결정보를 DB에서 가지고 오기 위해서 DB와 연결한 다음에 getConnection메소드를 이용해서 그때마다 그 정보를 받아서 CRUD를 수행할 수 있었다. 
	// => 내부에서는 getConnection을 할 때 new를 통해 객체들을 생성해주는 것이였음.
	//웹어플리케이션은 실시간 서비스이고, 동시 접속하여 요청하는 클라이언트의 수가 많을 것임. 그 순간마다 new를 하여 인스턴스를 생성한다면 서버에 어마어마한 부하가 발생하게 됨
	//그렇기 때문에 실시간 서비스의 부하를 최소화하는 방법이 미리 연결객체를 잔뜩 만들어놓는 방법을 활용하도록 한다.
	//이는 커넥션풀이라고 하며, 커넥션풀은 연결객체를 담아두고 있는 풀이라는 의미를 담고있다. (톰캣7버전부터 탑제되어 제공해줌)	
	//커넥션풀을 이용해서 연결객체를 잔뜩 만들어놓고 서버가 살아나서 클라이언트 요청이 올 때마다 이미 생성해놓은 객체를 할당해주고, 
	//사용이 끝나면 다시 반환을 받아서 새로운 요청자에게 할당을 해줌으로써 연결객체에 대한 실시간 생성의 부하를 최소화하도록 한다.
		
		String sql = "select max(board_num) from board"; //board_num의 최대값을 읽어오도록 한다.
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		int result = -1;
		
		try {
			con = ds.getConnection(); //getConnection메소드를 통해서 반환되어져온 커넥션 객체를 Connection참조자료형에 담아주도록 한다. (연결객체를 반환)
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); //조건에 부합하는 결과값을 리턴해줌. => 결과의 자료형 ResultSet임
			
			if(rs.next()) { //담긴 값이 null이 아니면
				num = rs.getInt(1) + 1; //최대값에다가 +1을 해주도록 한다.
			}else {
				num = 1; //아무런 값도 저장되어있지 않다면 num에 1을 저장하도록 한다.
			}
			
			sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,sysdate) "; //sysdate의 시간은 데이터베이스에 저장하는 시간으로 바로 넣어주도록 한다.
			pstmt = con.prepareStatement(sql); //데이터베이스에 전달되어지는 데이터의 노출을 막기 위해 prepareStatement메소드를 활용하도록 한다.
			pstmt.setInt(1, num); //첫번째 물음표에 num의 일련번호값을 넣도록 함.
			pstmt.setString(2, board.getBoardName());
			pstmt.setString(3, board.getBoardPass());
			pstmt.setString(4, board.getBoardSubject());
			pstmt.setString(5, board.getBoardContent());
			pstmt.setString(6, board.getBoardFile());
			
			//댓글에 대한 데이터 처리
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			
			//조회수 => 처음에 삽입될 때는 0으로 셋팅
			pstmt.setInt(10, 0);
			
			result = pstmt.executeUpdate(); //쿼리문을 바로 실행시켜주는 메소드 => 현재 삽입된 데이터의 갯수를 반환해줌.
			
			if(result == 0) 
				return false;
			
			return true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch (SQLException e) {} 
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {} 
			if(con != null) try { con.close(); } catch (SQLException e) {} 
					
			/*try {
				if(rs != null) { rs.close(); }
				if(pstmt != null) { pstmt.close(); }
				if(con != null) { con.close(); }
			} catch (SQLException e) { } */	
		}
		return false;
	}
	
	
	// 읽기 (작성된 글의 목록 보기) => 서비스단에서 이 메소드를 호출하는 구조로 연결됨.
	// 나중에는 컬렉션 프레임워크에 DB의 데이터들을 담을 것이기 때문에 반환형이 컬렉션프레임워크로 바뀔 것임
	public List<BoardVO> getBoardList(int page, int limit) { 
		
/*[ 댓글의 리스트 순서 +) 페이징 처리 기능 ]
  ● DB의 뷰에서 탑쿼리를 배웠었음. => 오라클DB는 자체적으로 생성해주는 rownum과 inlineView의 개념이 댓글 순서에 연관되어진다.
		  
  DB에 요청할 때 리스트에 보여줄 내용을 아예 정렬해서 리턴하게끔 쿼리문을 만들고 싶은 것임.
  이때 쿼리문에서 오라클DB를 사용할 때 TopQuery문에서 배웠던 rownum과 inlineView의 두 가지 기능을 이용해서 우리가 원하는 형태로 정렬된 데이터를 요청하도록 한다.
  - rownum: DB에 조건에 따라 데이터 요청할 때, 데이터를 반환하기 직전에 순번을 매겨서 자동으로 부여한 번호를 말한다.
  - inlineView: 서브쿼리(하나의 쿼리문 안에 두 개이상의 select문을 작성할 수 있다는 것)의 일종으로 하나의 쿼리문 안에 두 개이상의 select문이 올 수 있다는 것은 공통인데
		        from에서 테이블 이름이 와야하는 자리에 다시 select문이 올 수 있는 구문을 말한다.
		                
  정렬만 하여 브라우저의 리스트 화면을 구성해준다면 문제점이 발생. DB에 보관된 데이터가 수만개라면? 그 많은 데이터가 리턴될 것이고, 그 리턴된 데이터를 브라우저에 보내게 될 것이다. 
		                                                         그렇게 되면 엄청난 퍼포먼스 수행 및 데이터 표시가 비효율적임
  그래서 실제 사이트에서는 10개정도의 게시물로써 고정을 시키고, 나머지 보여지지 않는 데이터들은 페이징의 기능을 구현해서 이후 번호를 클릭해서 번호 안에 들어오는 10개의 게시물들을 응답으로 보여주게 된다.   
  => 마지막 게시물부터 순차적으로 10개의 게시물을 보여주도록 해야한다. 나머지 게시물을 페이징 기능을 적용해야함.
     페이징 기능을 정의하려면 DB에 저장된 게시물 갯수에 따라서 몇번까지를 보여줘야할지를 판단해야 한다.

rownum은 지금 select를 하면서 컬럼을 리턴해주는 순서대로 번호를 붙여줌(읽어오는 순간 DB가 순번을 부여) -> rownum을 활용해서 데이터를 10개씩 꺼내오도록 하자. 
*/ 
		
		//String sql = "select * from board order by board_num desc";
		String sql = "select * from " +
					 "(select rownum rnum, board_num, board_name, board_subject, board_content, board_file," + 
				     " board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date" +
				     " from (select * from board" + 
		             " order by board_re_ref desc, board_re_seq asc))" + //그룹핑으로 가져온 것을 내림차순정렬함, 그룹핑된 묶음 댓글을 오름차순하도록 함.
				     " where rnum >= ? and rnum <= ?"; //***내가 원하는 갯수만큼만 최종적으로 피드백을 받도록 지정하는 것임.
		//괄호(인라인뷰)먼저 실행하면 전체 데이터에서 정렬을 해서 결과를 보내줄 것이고, 보내주는 순간 오라클 DB는 rownum(가상의 컬럼이기 때문에 별칭부여)이라는 컬럼을 만들어서 순번을 자동으로 부여함
		//또 한번 괄호를 감싸주면 정렬해서 가져온 데이터에 부여한 값을 활용할 수 있게 된다.
		//***rownum의 값을 확정시키기 위해서 인라인뷰로 한번 더 감싸서 출력시키도록 하는 것이다. rownum이 확정되지 않은 상태에서 and연산을 하게 되면 첫번째 값에 false가 나오면 무한굴레에 빠지게 되는 것임.
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BoardVO> list = new ArrayList<>(); //컬렉션프레임워크는 인스턴스를 관리하기 때문에 자바빈의 인스턴스 넣어주기.
		
		
		//요청해오는 페이지에 따라서 게시글의 목록을 업데이트하도록 한다. (목록은 한페이지에 게시글 10개 생각하고 보기)
		int startrow = (page-1)*10 + 1; //페이지에서의 시작 게시글 row번호  
		int endrow = startrow + limit - 1;  //페이지에서의 끝 게시글 row번호
		
		
		try {
			con = ds.getConnection(); //연결객체 하나만 반환해달라고 요청
			pstmt = con.prepareStatement(sql); 
			
			//***사용자가 누른 페이지에 따라서 값이 바뀌어져야 함
			pstmt.setInt(1, startrow); 
			pstmt.setInt(2, endrow);
			
			//데이터를 보관해야 하기 때문에 select일 경우에만 executeQuery메소드를 사용.
			//(이 메소드가 리턴되어진 결과 데이터들을 가지고 복귀하여 메모리에 저장해줌 -> 보관하고 있는 메모리의 시작 주소값을 반환)
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) { //next(): 데이터 존재 유무 확인 => 데이터가 존재할 때 true로 반복문에 들어가서 반복적으로 데이터를 컬렉션프레임워크에 저장하는 것임.
				BoardVO board = new BoardVO();
				
				//데이터베이스에서 읽어온 데이터를 자바빈에 저장 -> 이 데이터들을 컬렉션 프레임워크에 차곡차곡 담아주면 됨.
				board.setBoardNum(rs.getInt("board_num")); //getInt(): DB의 컬럼이름을 입력으로 넣어주게 되면 그 필드에 있는 값을 리턴해주게 된다. 
				board.setBoardName(rs.getString("board_name"));
				//패스워드에 대한 정보는 보여주면 안되기 때문에 생략
				board.setBoardSubject(rs.getString("board_subject"));
				board.setBoardContent(rs.getString("board_content"));
				board.setBoardFile(rs.getString("board_file"));
				board.setBoardReplyRef(rs.getInt("board_re_ref"));
				board.setBoardReplyLev(rs.getInt("board_re_lev"));
				board.setBoardReplySeq(rs.getInt("board_re_seq"));
				board.setBoardReadCount(rs.getInt("board_readcount"));
				board.setBoardDate(rs.getDate("board_date"));
				
				
				list.add(board); //데이터의 갯수만큼 반복될 때마다 레코드 데이터들을 add하여 컬렉션프레임워크에 추가해감.(레코드 데이터를 컬렉션프레임워크에 추가한 것임.)
			}
			
			
			return list;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //메모리 반납.
			if(rs != null) try { rs.close(); } catch (SQLException e) {} 
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {} 
			if(con != null) try { con.close(); } catch (SQLException e) {} 
		}
		
		return null; //문제가 발생했을 때 null값을 반환하도록 함.
	}
	
	
	// 상세 화면 보기(번호를 전달받았을 때 해당되는 번호에 맞는 레코드 데이터를 화면상으로 보기 위함의 기능)
	public BoardVO getDetail(int num) { //전달되는 파라메타의 값을 전달받을 목적으로 매개변수 선언
		String sql = "select * from board where board_num = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO board = null; //이 메소드가 종료되기 전까지 데이터의 값을 보관하도록 한다.
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery(); //DB에 해당 데이터가 있을 때 레코드를 반환 => 자바는 ResultSet의 자료형으로 내부적으로 메모리를 할당해놓고 보관하는 것
			
			if(rs.next()) { //검색해온 하나의 레코드를 꺼내서 자바빈에 저장하는 것임. 따라서 컬렉션프레임워크로 저장할 필요 없음.
				board = new BoardVO(); 
				
				board.setBoardNum(rs.getInt("board_num")); 
				board.setBoardName(rs.getString("board_name"));
				board.setBoardSubject(rs.getString("board_subject"));
				board.setBoardContent(rs.getString("board_content"));
				board.setBoardFile(rs.getString("board_file"));
				board.setBoardReplyRef(rs.getInt("board_re_ref"));
				board.setBoardReplyLev(rs.getInt("board_re_lev"));
				board.setBoardReplySeq(rs.getInt("board_re_seq"));
				board.setBoardReadCount(rs.getInt("board_readcount"));
				board.setBoardDate(rs.getDate("board_date"));
			} //영역을 벗어나더라도 이미 리스트에서 주소값을 저장하고 있기 때문에 상관 없음
			
			return board; //DB와 실질적인 작업이 성공하면 서비스 영역으로 자바빈에 저장했던 데이터를 넘기도록 한다. (해당하는 하나의 데이터)
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch (SQLException e) {} 
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {} 
			if(con != null) try { con.close(); } catch (SQLException e) {} 
		}
			
		return null;
	}
	
	
	//댓글 저장
	public int boardReply(BoardVO board) { //자바빈에 저장한 데이터를 전달받을 것임. -> 매개변수 선언
		/*
		 *** 댓글을 쓰고 등록버튼을 눌렀을 때의 기능 구현. => hidden으로 UI상에 구성되어 있던 댓글 관련된 데이터들이 서버쪽으로 전달됨 ***
		  위에 값들을 입력양식태그의 타입에서 hidden을 통해 서버로 데이터를 전송하는 것은 저장하는 순간에 값들을 결정지어서 전달하도록 하는 것이다. 
		  (ref가 기준 값이고, 그 기준값에 따라 나머지 값들이 그룹이 되는 구조임.)
		  => 작성된 글에서 댓글을 달게 된다면 DB에 저장되는 고유 번호가 서로 연결이 될 수 있어야 한다. (DB는 순차적인 저장이 되지만 UI상에서는 게시글 밑에 댓글이 와야함) 
		     ***ref는 소속값으로써 메인 게시글 고유 번호와 동일하게 해주도록 한다!! (가족으로 뭉쳐서 한묶음으로 가져오려는 것) - 기준값을 그대로 저장
		  => 댓글은 특정 게시글에 대한 댓글을 달지만 어떤 경우에는 댓글에 댓글을 달 수 있음. => 이때는 UI상에 댓글 밑에 대댓을 둬야함(***원본 글에 대한 들여쓰기를 하기 위한 데이터인 것임)
		     이때, 구분을 주기 위해서 lev의 값을 주는 것이다. => 0을 주면 원글인 것이고, 1을 주면 원글에 대한 댓글이 된다. (대댓글에 대한 단계별 들여쓰기 위치 조정을 위함, 여백을 통한 시각화!!) 
		  => 제일 마지막 댓글이 위로 잡힘. => 댓글에 따른 순서 체크(관리)를 하기 위해서 re_seq의 데이터를 만든 것임.
		     즉, seq에서 이전 댓글은 현재 seq를 읽어와서 +1을 하여 담아주도록 한다. 또한, 이후 댓글은 현재 담긴 seq값 그대로 담아주도록 한다. => 기존 값들을 전부 +1해주는 것임.
		     - 기존 값들에서 큰값이 있는지를 먼저 보고, 큰값(댓글 존재)이 있으면 +1을 해주면 된다. 내 값은 기준값에서 +1을 하여 저장하도록 한다.
		     - seq는 오름차순 정렬하여 값들의 순서를 표시하도록 한다. (현재 웹사이트들이 댓글에 대한 구조가 이러한 형식으로 잡혀져 있음. 이 컨셉을 똑같이 잡아가면서 구현할 예정)
		  
		  기준글에 댓글이 달릴 때는 기준글의 값을 참조해서 lev이나 seq의 값을 +1을 해주는데 lev같은 경우 현재 기준글에서 +1을 해주면 되기 때문에 별다른 추가적 고려사항이 없었음
		  하지만 seq는 +1을 하기 전에 기존에 다른 댓글들이 존재하는지 체크해야 했었다.
		  그렇기 때문에 먼저 정렬을 위해서 기존 값에 +1을 해주고 DB의 값을 수정을 하여 담아줬었음
		  그런 다음에 댓글의 게시물을 삽입해주고자할 때 원댓글에 +1을 하여 0, 1, 2의 순서를 가져가도록 알고리즘을 구현했었다.
		  그렇게 되면 게시물의 댓글이나 대댓글 등등의 공통적으로 리스트상에 출력되는 것에 있어서 문제가 되지 않았다!!    
		  (-> 대댓글 같은 경우에도 위와 같은 seq의 동일한 알고리즘 코드가 문제가 되지 않음.)
		*/
		
		//DB에 저장되는 고유한 번호에 대한 시퀀스는 동일함. 그렇기 때문에 insert메소드에 있는 번호에 대한 기능을 동일하게 넣어주도록 한다.
		String sql = "select max(board_num) from board";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		int result = -1;
		
		int re_ref = board.getBoardReplyRef(); //메인 게시글 번호
		int re_lev = board.getBoardReplyLev();
		int re_seq = board.getBoardReplySeq();
		
		try {
			con = ds.getConnection(); //연결객체부터 커넥션풀에서 꺼내오도록 함.
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) { 
				num = rs.getInt(1) + 1; 
			}else {
				num = 1; 
			}
			
			//기존에 댓글이 달려있으면 re_seq값을 +1씩 증가를 시키고 그 다음에 현재 넣는 값을 증가시켜줘야 한다. => 저장하기 전에 기존 댓글이 있는지부터 체크
			//모든 seq에 적용하는 것이 아니라 조건을 지정) 기존에 저장되어져 있는 기준 ref의 값과 동일하고, 현재 seq의 값이 보관된 seq값(0의 값) 보다 큰 것이 있을 때 마다 +1씩 증가를 시키도록 한다. (데이터 존재유무에 따라 순서를 지정하도록 함.)
			sql = "update board set board_re_seq = board_re_seq + 1 where board_re_ref = ? and board_re_seq > ?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq); 
			result = pstmt.executeUpdate();
			
			if(result == 0)
				System.out.println("답글 수정 사항 없음.");
			
			//현재 댓글의 게시물 저장↓
			sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getBoardName());
			pstmt.setString(3, board.getBoardPass());
			pstmt.setString(4, board.getBoardSubject());
			pstmt.setString(5, board.getBoardContent());
			pstmt.setString(6, ""); // 답장에는 파일을 업로드하지 않음.(따라서 공백으로 데이터를 넘겨주도록 한다.)
			
			pstmt.setInt(7, re_ref); //현재 꺼내온 기준 값을 그대로 저장하도록 한다. 그래야 그룹으로 지정해줄 수 있음
			pstmt.setInt(8, ++re_lev); //+1을 한 값으로 넣어야 하므로 앞에 ++을 붙여주도록 한다.
			pstmt.setInt(9, ++re_seq); //읽어온 기준 값에서 +1하여 저장
			
			//조회수 
			pstmt.setInt(10, 0);
			
			result = pstmt.executeUpdate();
			
			if(result == 0) 
				System.out.println("댓글 저장 실패.");
			
			return num;		
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch (SQLException e) {} 
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {} 
			if(con != null) try { con.close(); } catch (SQLException e) {} 
		}
		
		return 0;
		
	}
	
	// 조회수 업데이트
	public void setReadCountUpdate(int num) { //매개변수로 전달된 num게시물의 조회수를 하나 증가시키도록 한다.
		String sql = "update board set board_readcount = board_readcount + 1 " +
				     "where board_num = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection(); 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num); //?에 지금 전달받은 게시물에 대한 고유번호값을 전달하도록 한다.
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {} 
			if(con != null) try { con.close(); } catch (SQLException e) {} 
		}		
		
	}
	
	
	
	
	// 수정하기
	public int boardUpdate(BoardVO board) { 
		String sql = "select * from board where board_num = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
			
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getBoardNum());
			rs = pstmt.executeQuery(); 
			String pass = null;
			
			while(rs.next()) { //비밀번호에 해당하는 값 담아두기.
				pass = rs.getString("board_pass");
				
			}
			
			sql = "update board set board_subject = ?, board_content = ?, board_file = ? where board_num = ? and board_pass = ?"; 
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, board.getBoardSubject());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setString(3, board.getBoardFile());
			
			pstmt.setInt(4, board.getBoardNum());
			pstmt.setString(5, board.getBoardPass());
			
			if(!pass.equals(board.getBoardPass())) {
				System.out.println("비밀번호가 맞지 않습니다. 다시 한번 확인해주세요.");
				return 0;
			}
			
			
			result = pstmt.executeUpdate();
			if(result == 0) 
				return 0;
				
			return result;
				
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if(rs != null) try { rs.close(); } catch (SQLException e) {} 
				if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {} 
				if(con != null) try { con.close(); } catch (SQLException e) {} 
			}
			return 0;
		}
	
	
	// 삭제하기
	public int boardDelete(int num, String pass) { 
		String sql = "delete from board where board_num = ? and board_pass = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection(); 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, pass);
			int result = pstmt.executeUpdate();
			
			if(result == 0) 
				return 0;
				
			return result;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {} 
			if(con != null) try { con.close(); } catch (SQLException e) {} 
		}
		return 0;
	}
	
	
	

}
