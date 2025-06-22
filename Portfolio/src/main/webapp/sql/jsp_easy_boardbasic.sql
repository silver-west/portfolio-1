create database jsp_easy_boardbasic;
USE jsp_easy_boardbasic;

CREATE TABLE board(
	boardNo int,
	boardWriter varchar(100),
	boardSubject varchar(100),
	boardContent varchar(500),
	boardReadCount int
);

DESC board;


INSERT INTO board  VALUES(1, '작성자1' , '제목1' , '내용1' , 0);
INSERT INTO board  VALUES(2, '작성자2' , '제목2' , '내용2' , 0);
INSERT INTO board  VALUES(3, '작성자3' , '제목3' , '내용3' , 0);

SELECT * FROM board;


