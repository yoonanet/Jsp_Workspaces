drop table board purge; -- 지금 현재 board테이블이 존재할 수 있기 때문에 삭제함. (purge키워드: 임시테이블로 등록되지 않고 바로 삭제)

--게시판에 작성한 데이터를 보관할 테이블 생성
create table board(
	board_num	number, --게시글을 고유하게 관리할 번호의 컬럼 (중복X, nullX), DB가 자체적으로 게시물을 일련번호로 관리하기 위해 추가한 컬럼 항목인 것임.
	board_name	varchar2(20),
	board_pass	varchar2(15),
	board_subject	varchar2(50),
	board_content	varchar2(2000),
	board_file		varchar2(50), -- 파일 첨부의 기능
	-- 댓글 처리를 위한 컬럼 항목↓ (사용자로 부터 전달받는 데이터가 아니라 서버에서 사용자가 댓글을 작성했을 때 서버가 관리하기 위해서 자체적으로 추가해주는 컬럼 항목임)
	board_re_ref	number,
	board_re_lev	number,
	board_re_seq	number,
	-- 게시글의 조회수 관리 항목
	board_readcount number,
	-- 게시글이 언제 작성되어졌는지에 대한 일자 정보 항목 (등록 일자의 데이터를 보관하기 위한 목적)
	board_date date,
	primary key(board_num)
);

select * from BOARD;