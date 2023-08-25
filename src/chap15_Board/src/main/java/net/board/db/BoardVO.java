package net.board.db;

import java.sql.Date; //sql이라는 패키지 안에 정의된 자료형은 DB와 연동이 되어지게끔 정의되어진 자료형이다.

public class BoardVO { //board의 테이블과 연동시키는 자바빈으로 정의
	//나중에 프로젝트를 진행할 때는 DB의 컬럼 이름과 자바빈의 필드 이름을 동일하게 정의해주는 것이 편한 작업들을 추가적으로 할 수 있음
	//=> 지금은 정확한 이해를 위해 테이블과 자바빈의 구별하기 위해 필드의 이름을 다르게 짓도록 한다.
	private int boardNum;
	private String boardName;
	private String boardPass;
	private String boardSubject;
	private String boardContent;
	private String boardFile;
	private int boardReplyRef;
	private int boardReplyLev;
	private int boardReplySeq;
	private int boardReadCount;
	private Date boardDate;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardPass() {
		return boardPass;
	}
	public void setBoardPass(String boardPass) {
		this.boardPass = boardPass;
	}
	public String getBoardSubject() {
		return boardSubject;
	}
	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardFile() {
		return boardFile;
	}
	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}
	public int getBoardReplyRef() {
		return boardReplyRef;
	}
	public void setBoardReplyRef(int boardReplyRef) {
		this.boardReplyRef = boardReplyRef;
	}
	public int getBoardReplyLev() {
		return boardReplyLev;
	}
	public void setBoardReplyLev(int boardReplyLev) {
		this.boardReplyLev = boardReplyLev;
	}
	public int getBoardReplySeq() {
		return boardReplySeq;
	}
	public void setBoardReplySeq(int boardReplySeq) {
		this.boardReplySeq = boardReplySeq;
	}
	public int getBoardReadCount() {
		return boardReadCount;
	}
	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
		
}
