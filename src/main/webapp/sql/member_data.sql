create database member_data;
USE member_data;

CREATE TABLE admin(
	admin_id varchar(30),
	admin_pw varchar(30),
	nickname varchar(30)
);

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


