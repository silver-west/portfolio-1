create database p_data;
USE p_data;

--  admin
CREATE TABLE admin(
	admin_id varchar(30),
	admin_pw varchar(30),
	nickname varchar(30)
);

-- member
CREATE TABLE member(
	id varchar(30),
	pw varchar(30),
	nickname varchar(30)
);

DESC member;


INSERT INTO member VALUES('id1' , '1111' , '닉네임1');
INSERT INTO member VALUES('id2' , '2222' , '닉네임2');
INSERT INTO member VALUES('id3' , '3333' , '닉네임3');

INSERT INTO admin VALUES('admin' , 'admin1234' , '관리자');

SELECT * FROM member;

-- board
CREATE TABLE board(
	boardNo int,
	boardWriter varchar(100),
	boardSubject varchar(100),
	boardContent varchar(500),
	boardReadCount int
);

DESC board;

--test Code
INSERT INTO board  VALUES(1, 'id2' , '제목1' , '내용1' , 0);
INSERT INTO board  VALUES(2, 'id1' , '제목2' , '내용2' , 0);
INSERT INTO board  VALUES(3, 'id3' , '제목3' , '내용3' , 0);
INSERT INTO board  VALUES(4, 'id2' , '제목1' , '내용1' , 0);
INSERT INTO board  VALUES(5, 'id1' , '제목2' , '내용2' , 0);
INSERT INTO board  VALUES(6, 'id3' , '제목3' , '내용3' , 0);
INSERT INTO board  VALUES(7, 'id2' , '제목1' , '내용1' , 0);
INSERT INTO board  VALUES(8, 'id1' , '제목2' , '내용2' , 0);
INSERT INTO board  VALUES(9, 'id3' , '제목3' , '내용3' , 0);
INSERT INTO board  VALUES(10, 'id2' , '제목1' , '내용1' , 0);
INSERT INTO board  VALUES(11, 'id1' , '제목2' , '내용2' , 0);
INSERT INTO board  VALUES(12, 'id3' , '제목3' , '내용3' , 0);
INSERT INTO board  VALUES(13, 'id2' , '제목1' , '내용1' , 0);
INSERT INTO board  VALUES(14, 'id1' , '제목2' , '내용2' , 0);
INSERT INTO board  VALUES(15, 'id3' , '제목3' , '내용3' , 0);
INSERT INTO board  VALUES(16, 'id2' , '제목1' , '내용1' , 0);
INSERT INTO board  VALUES(17, 'id1' , '제목2' , '내용2' , 0);
INSERT INTO board  VALUES(18, 'id3' , '제목3' , '내용3' , 0);

SELECT * FROM board;

-- point
CREATE TABLE point_table(
	myPoint int,
	id varchar(100)
);

--test Code
INSERT INTO point_table  VALUES(200, 'id1');
INSERT INTO point_table  VALUES(400, 'id2');
INSERT INTO point_table  VALUES(530, 'id3');

CREATE TABLE point_store(
	item_num int,
	item_name varchar(100),
    item_price int,
    item_cmt varchar(50),
    item_total int,
    item_path varchar(100)
);

--test Code
INSERT INTO point_store  VALUES(1, '아이템1', 300, '아이템 설명1 입니다.', 30, null);
INSERT INTO point_store  VALUES(2, '아이템2', 500, '아이템 설명2 입니다.', 10, null);
INSERT INTO point_store  VALUES(3, '아이템3', 1000, '아이템 설명3 입니다.', 0, null);
SELECT * FROM point_store;

CREATE TABLE point_history(
	history_num int,
	history_id varchar(100),
	history_cmt varchar(100),
    history_price int,
    history_option varchar(50)
);

--test Code
INSERT INTO point_history VALUES(1, 'id1', '회원가입', 500, 'plus');
INSERT INTO point_history VALUES(2, 'id1', '포인트상점', 300, 'minus');
INSERT INTO point_history VALUES(3, 'id2', '회원가입', 500, 'plus');
INSERT INTO point_history VALUES(4, 'id2', '포인트상점', 100, 'minus');
INSERT INTO point_history VALUES(5, 'id3', '회원가입', 500, 'plus');
INSERT INTO point_history VALUES(6, 'id3', '게시글작성', 30, 'plus');

SELECT * FROM point_history;

CREATE TABLE point_cart(
	user_id varchar(50),
	item_num int,
	orderCount int
);

--test Code
INSERT INTO point_cart VALUES('id1', 1, 3);
INSERT INTO point_cart VALUES('id1', 2, 1);
INSERT INTO point_cart VALUES('id1', 3, 2);
INSERT INTO point_cart VALUES('id2', 1, 3);
INSERT INTO point_cart VALUES('id2', 1, 1);
INSERT INTO point_cart VALUES('id2', 3, 2);

SELECT * FROM point_cart;