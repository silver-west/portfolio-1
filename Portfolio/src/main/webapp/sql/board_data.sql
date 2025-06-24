create database board_data;
USE board_data;

CREATE TABLE board(
	boardNo int,
	boardWriter varchar(100),
	boardSubject varchar(100),
	boardContent varchar(500),
	boardReadCount int
);

DESC board;


INSERT INTO board  VALUES(1, 'id2' , '제목1' , '내용1' , 0);
INSERT INTO board  VALUES(2, 'id1' , '제목2' , '내용2' , 0);
INSERT INTO board  VALUES(3, 'id3' , '제목3' , '내용3' , 0);

SELECT * FROM board;



