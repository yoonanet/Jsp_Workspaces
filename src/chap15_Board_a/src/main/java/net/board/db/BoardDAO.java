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


public class BoardDAO { // CRUD 기능 구현
	DataSource ds;
	
	public BoardDAO() {
		
		try {
			Context init = new InitialContext();
			
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB"); 
			
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
