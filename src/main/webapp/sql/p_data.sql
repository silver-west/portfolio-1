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


INSERT INTO member VALUES('id1' , '1111' , '호빵');
INSERT INTO member VALUES('qwer' , '2222' , '버블티');
INSERT INTO member VALUES('abcd' , '3333' , '고양이');

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

-- testCode
INSERT INTO board  VALUES(1, 'qwer' , '사자의 습성은 어떨까요?' , '사자는 아프리카 초원에서\n가장 무서운 포식자입니다.\n그들은 보통 낮에는 쉬고\n밤에 사냥을 나섭니다.' , 2);
INSERT INTO board  VALUES(2, 'id1' , '코알라의 하루' , '코알라는 하루에 20시간을\n나무 위에서 잠을 잡니다.\n주식은 유칼립투스 잎으로\n독성도 견딜 수 있습니다.' , 30);
INSERT INTO board  VALUES(3, 'abcd' , '문어의 지능에 대하여' , '문어는 무척 똑똑한 동물로\n문제 해결 능력이 탁월합니다.\n위장술이 뛰어나며\n몸도 자유롭게 바꿀 수 있어요.' , 5);
INSERT INTO board  VALUES(4, 'qwer' , '하마는 위험합니다!' , '내용1' , 0);
INSERT INTO board  VALUES(5, 'id1' , '펭귄의 가족' , '펭귄은 부부가 함께 번갈아\n알을 품고 새끼를 돌봅니다.\n남극의 추운 환경에서도\n단체로 체온을 유지해요.' , 22);
INSERT INTO board  VALUES(6, 'abcd' , '기린의 목은 길다' , '기린의 목은 길지만\n뼈 개수는 인간과 같아요.\n주로 아카시아 나무를\n먹으며 살아갑니다.' , 10);
INSERT INTO board  VALUES(7, 'qwer' , '너구리는 밤행동을 한다' , '너구리는 야행성이며\n먹이는 매우 다양합니다.\n도시에서도 자주 보이며\n적응력이 뛰어납니다.' , 23);
INSERT INTO board  VALUES(8, 'id1' , '개미는 함께 산다' , '개미는 집단 생활을 하고\n역할이 나눠져 있습니다.\n여왕개미가 알을 낳고\n일개미는 일합니다.' , 82);
INSERT INTO board  VALUES(9, 'abcd' , '낙타의 능력' , '낙타는 물 없이도 며칠을\n버틸 수 있는 능력이 있어요.\n혹에는 물이 아닌\n지방이 저장돼 있습니다.' , 11);
INSERT INTO board  VALUES(10, 'qwer' , '팬더는 대나무를 먹어요' , '팬더는 대나무를 하루에\n10kg 넘게 먹습니다.\n주로 혼자 지내며\n느리게 생활합니다.' , 22);
INSERT INTO board  VALUES(11, 'id1' , '수달은 도구를 씁니다' , '수달은 돌을 사용해\n조개껍질을 깹니다.\n장난을 잘 치며\n사교적인 성격이에요.' , 42);
INSERT INTO board  VALUES(12, 'abcd' , '하이에나는 단결합니다' , '하이에나는 무리를 지어\n조직적으로 사냥합니다.\n웃음 소리 같지만\n경계의 신호입니다.' , 12);
INSERT INTO board  VALUES(13, 'qwer' , '두더지는 땅속에' , '두더지는 어두운 땅속을\n자유롭게 파고 다녀요.\n촉각이 발달했고\n눈은 거의 퇴화됐습니다.' , 0);
INSERT INTO board  VALUES(14, 'id1' , '개구리는 잘 뛴다' , '개구리는 긴 뒷다리로\n멀리 점프할 수 있어요.\n알을 물속에 낳고\n올챙이로 자랍니다.' , 33);
INSERT INTO board  VALUES(15, 'abcd' , '코끼리는 가족적이다' , '코끼리는 가족 중심으로\n무리를 지어 살아갑니다.\n기억력이 매우 좋아\n죽은 친구도 기억해요.' , 19);
INSERT INTO board  VALUES(16, 'qwer' , '족제비는 사냥꾼' , '족제비는 날렵하며\n작은 동물을 사냥합니다.\n굴을 파서 숨거나\n남의 굴도 사용해요.' , 22);
INSERT INTO board  VALUES(17, 'id1' , '부엉이는 밤에 떠' , '부엉이는 밤에 활동하며\n눈과 귀가 매우 발달했습니다.\n날개짓이 조용해서\n몰래 다가갈 수 있어요.' , 53);
INSERT INTO board  VALUES(18, 'abcd' , '해파리는 조심해' , '해파리는 몸이 투명하고\n촉수가 매우 위협적입니다.\n종류에 따라 독성이 달라\n주의가 필요합니다.' , 11);

SELECT * FROM board;

-- point
CREATE TABLE point_table(
	myPoint int,
	id varchar(100)
);

-- testCode
INSERT INTO point_table  VALUES(200, 'id1');
INSERT INTO point_table  VALUES(400, 'qwer');
INSERT INTO point_table  VALUES(530, 'abcd');

CREATE TABLE point_store(
	item_num int,
	item_name varchar(100),
    item_price int,
    item_cmt varchar(50),
    item_total int,
    item_path varchar(100)
);

-- testCode
INSERT INTO point_store  VALUES(1, '무선 블루투스 이어폰', 1000, '선 없이 자유롭게 사용할 수 있는\n컴팩트한 블루투스 이어폰입니다.', 5, '/Point/img/bluetooth.png');
INSERT INTO point_store  VALUES(2, '천연 가죽 반지갑', 500, '부드러운 천연 소가죽으로 제작된\n세련된 디자인의 남성용 반지갑입니다.', 0, '/Point/img/wallet.png');
INSERT INTO point_store  VALUES(3, '아로마 디퓨저 세트', 300, '은은한 향기로 공간을 채우는\n우드 스틱 타입의 디퓨저 세트입니다.', 4, '/Point/img/tumblur.png');
INSERT INTO point_store  VALUES(4, '프리미엄 텀블러', 800, '이중 구조로 보온/보냉이 뛰어난\n휴대용 프리미엄 텀블러입니다.', 30, '/Point/img/tumblur.png');
INSERT INTO point_store  VALUES(5, '수제 마카롱 세트', 400, '바삭한 겉과 촉촉한 속의 조화가\n일품인 수제 마카롱 세트입니다.', 10, '/Point/img/maca.png');
INSERT INTO point_store  VALUES(6, '곰돌이 봉제 인형', 100, '포근한 촉감과 귀여운 디자인으로\n선물용으로도 인기 있는 인형입니다.', 100, '/Point/img/bear.png');

SELECT * FROM point_store;

CREATE TABLE point_history(
	history_num int,
	history_id varchar(100),
	history_cmt varchar(100),
    history_price int,
    history_option varchar(50)
);

-- testCode
INSERT INTO point_history VALUES(1, 'id1', '회원가입', 500, 'plus');
INSERT INTO point_history VALUES(2, 'id1', '포인트상점', 100, 'minus');
INSERT INTO point_history VALUES(3, 'qwer', '회원가입', 500, 'plus');
INSERT INTO point_history VALUES(4, 'qwer', '포인트상점', 100, 'minus');
INSERT INTO point_history VALUES(5, 'abcd', '회원가입', 500, 'plus');
INSERT INTO point_history VALUES(6, 'abcd', '게시글작성', 30, 'plus');

SELECT * FROM point_history;

CREATE TABLE point_cart(
	user_id varchar(50),
	item_num int,
	orderCount int
);

-- testCode
INSERT INTO point_cart VALUES('id1', 1, 3);
INSERT INTO point_cart VALUES('id1', 2, 1);
INSERT INTO point_cart VALUES('id1', 3, 2);
INSERT INTO point_cart VALUES('qwer', 4, 3);
INSERT INTO point_cart VALUES('qwer', 5, 1);
INSERT INTO point_cart VALUES('abcd', 6, 2);

SELECT * FROM point_cart;
