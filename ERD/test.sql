SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS file;
DROP TABLE IF EXISTS qna_comment;
DROP TABLE IF EXISTS qnaboard;
DROP TABLE IF EXISTS room_comment;
DROP TABLE IF EXISTS room_like;
DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE file
(
	file_num int NOT NULL AUTO_INCREMENT,
	qna_num int NOT NULL,
	file_source varchar(100) NOT NULL,
	file_name varchar(100) NOT NULL,
	PRIMARY KEY (file_num)
);


CREATE TABLE qnaboard
(
	qna_num int NOT NULL AUTO_INCREMENT,
	user_num int NOT NULL,
	qna_subject varchar(100) NOT NULL,
	qna_content text NOT NULL,
	qna_regdate datetime DEFAULT now(),
	PRIMARY KEY (qna_num)
);


CREATE TABLE qna_comment
(
	qc_num int NOT NULL AUTO_INCREMENT,
	user_num int NOT NULL,
	qna_num int NOT NULL,
	qc_content text NOT NULL,
	qc_regdate datetime DEFAULT now(),
	PRIMARY KEY (qc_num)
);


CREATE TABLE room
(
	room_num int NOT NULL AUTO_INCREMENT,
	room_name varchar(200) NOT NULL,
	room_address varchar(500) NOT NULL,
	room_category varchar(80) NOT NULL,
	room_info longtext NOT NULL,
	room_region varchar(100) NOT NULL,
	room_personnel int NOT NULL,
	room_price int NOT NULL,
	room_viewcnt int DEFAULT 0 CHECK(room_viewcnt >= 0),
	room_image varchar(500) NOT NULL,
	room_summary varchar(80),
	PRIMARY KEY (room_num)
);

CREATE TABLE room_comment
(
	rc_num int NOT NULL AUTO_INCREMENT,
	user_num int NOT NULL,
	room_num int NOT NULL,
	rc_content text NOT NULL,
	rc_regdate datetime DEFAULT now(),
	PRIMARY KEY (rc_num)
);


CREATE TABLE room_like
(
	user_num int NOT NULL,
	room_num int NOT NULL,
	likecnt int DEFAULT 0 CHECK (likecnt >= 0)
);


CREATE TABLE user
(
	user_num int NOT NULL AUTO_INCREMENT,
	user_id varchar(50) NOT NULL,
	user_password varchar(50) NOT NULL,
	user_name varchar(100) NOT NULL,
	user_regdate datetime DEFAULT now(),
	authorities varchar(200) DEFAULT 'ROLE_MEMBER',
	PRIMARY KEY (user_num),
	UNIQUE (user_id)
);



/* Create Foreign Keys */

ALTER TABLE file
	ADD FOREIGN KEY (qna_num)
	REFERENCES qnaboard (qna_num)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE qna_comment
	ADD FOREIGN KEY (qna_num)
	REFERENCES qnaboard (qna_num)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE room_comment
	ADD FOREIGN KEY (room_num)
	REFERENCES room (room_num)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE room_like
	ADD FOREIGN KEY (room_num)
	REFERENCES room (room_num)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE qnaboard
	ADD FOREIGN KEY (user_num)
	REFERENCES user (user_num)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE qna_comment
	ADD FOREIGN KEY (user_num)
	REFERENCES user (user_num)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE room_comment
	ADD FOREIGN KEY (user_num)
	REFERENCES user (user_num)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE room_like
	ADD FOREIGN KEY (user_num)
	REFERENCES user (user_num)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


INSERT INTO `user`  (user_id , user_password ,user_name  , authorities) VALUES
('USER', '1234', '회원1', 'ROLE_MEMBER'),
('USER2', '1234', '회원2', null),
('ADMIN1', '1234', '관리자1', 'ROLE_MEMBER,ROLE_ADMIN')
;
INSERT INTO qnaboard (user_num, qna_subject, qna_content) VALUES
(1, '제목입니다1', '내용입니다1'),
(1, '제목입니다2', '내용입니다2'),
(2, '제목입니다3', '내용입니다3'),
(2, '제목입니다4', '내용입니다4')
;
insert into room(room_name, room_address, room_category, room_info, room_region, room_personnel, room_price, room_image,room_summary)
VALUES 
('그로브동산', '강원', '펜션', '유럽과 일본의 호스텔 문화를 동경해온 세 명의 친구가 여행자의 도시 양양에 국내 최초로 디자인 관점의 호스텔을 만들었습니다. 디자인 그룹 지랩을 비롯하여 다양한 브랜드의 협업으로 탄생한 그로브동산은 바스터즈 카페 캡슐형 베드 코인시스템 등으로 브랜딩하여 순천을 찾는 20~30대 여행자들에게 새로운 사용자 경험을 제공하는 열린 공간으로서 활발히 운영되고 있습니다.', '양양', 3, 520000, 'img/main8.jpg','동산리 해변 옆 몽환적인 로지'),
('테오리아', '전북', '호텔', '테오리아는 불필요한 것들의 비움, 옛 것에 대한 존중을 통하여 특별한 감성을 주는 편안한 휴식처로 탄생되었습니다. 비워진 가치 안에 자연을 담고 모든 것을 내려놓고 삶의 기운을 재충전하는 곳, 영감의 장소 테오리아입니다. 25년 동안 가족과 함께 한 시간을 가지고 있는 공간이 있었습니다. 시간의 흔적을 존중하며 불필요한 것들을 최대한 비워내면서도 옛 건물의 갖고 있는 이야기는 공간 안에 남겼습니다. ', '전주', 5, 320000, 'img/main9.jpg','고요한 마음으로의 침잠'),
('슬로우소랑', '경상', '펜션', '바다가 시원하게 펼쳐진 거제면 소랑리, 걱정과 고민거리가 아스라이 작아지는 곳이 있다. 호스트는 이곳을 방문하는 이들이 마음의 여유를 가지며 휴식에 집중하는 공간이기를 바라는 뜻을 담아 ‘슬로우 소랑’이라고 이름을 붙였다.', '거제시', 4, 350000, 'img/main10.jpg','여긴어때가 선보이는 신규 스테이'),
('브리드호텔', '강원','호텔', '속초나 강릉에 비해 작고 조용한 마을 양양, 사계절 내내 서퍼들이 모여드는 이곳에 작고 개성 있는 가게들이 모여들며 지역 문화가 꽃피고 있습니다. 서퍼들의 핫플레이스로 떠오르고 있는 죽도해변과 인구해변의 중심, 서퍼들의 아지트가 문을 열었습니다. 서퍼들을 위한 호텔 ‘양양 브리드’는 깊은숨을 고르는 쉼의 시간을 선사하며, 멈춤을 통해 나만의 속도와 흐름을 찾을 수 있는 스테이를 만들고자 했습니다. 기존 대형 호텔들과는 달리 지역 상생과 친환경 콘텐츠, 깊이 있는 경험을 위한 전문가와의 협업을 지향하고 꾸준히 기획하고 있습니다. 양양 브리드 호텔은 힐링, 서핑 그리고 지역 문화와 함께 다양한 사람들이 모여 새로운 라이프스타일을 제안하는 공간을 만들고자 호텔 자체의 운영을 최대한으로 줄이고, 지역적인 요소와 개성을 담으려 로컬/전문 업체들과 협업했습니다. 숨 쉴 시간도 없이 바쁜 도심 속 일상에서 잠시 벗어나 삶 속에 작은 쉼표를 더하는 여유를 가져보는 건 어떨까요.', '양양', 1, 220000, 'img/main11.jpg','서퍼들의 아지트'),
('윌로우 하우스', '강원', '민박', '윌로우 하우스는 여행에서 만난 우리 집 처럼 편안함을 드립니다 여긴어때와 윌로우 하우스가 만나 편안한 여행을 제안합니다.', '춘천', 2, 220000, 'img/main12.jpg','온전한 휴식속에 영감을 얻다.'),
('호미양양', '강원', '펜션', '좋을 호, 아름다울 미, 큰 바다 양, 그리고 큰 바다 양, 강원도 양양, 하조대 해수욕장과 가까운 호미양양은 취향의 아름다움을 담은 바다입니다.', '양양', 3, 350000, 'img/main13.jpg','취향의 아름다움이 가득 담긴 공간'),
('선현재', '제주', '민박', '선현재라는 이름은 깨끗할 선(洗), 밝을 현(炫), 곳 재(在), ‘깨끗하고 밝은 곳’이라는 뜻으로, 헤밍웨이의 단편소설 ‘A Clean, Well-Lighted Place’에서 영감을 받았다. 어쩌면 소설 속 허무의 세계에서 밝은 불빛, 깨끗함과 질서를 탐구하는 이유는, 우리가 일상을 떠나 여행하는 이유와 같은 것일지도 모른다. 이러한 생각에서 출발하여 스테이가 제공하는 공간과 쉼, 그 시간 속에서의 경험은 어떠한 것이 되어야 할지 고민하고 준비했다.', '제주', 4, 550000, 'img/main14.jpg','온전히 나에게 집중하는 공간'),
('프룩스 플럭스 호텔', '경상', '호텔', '파도를 뜻하는FLUX와 라틴어로 과실을 뜻하는 FRUX를 붙였습니다. 각 분야의 전문가들이 모여 이루어 낸 원숙한 재능의 결실을 뜻합니다 이곳 프룩스 플럭스 호텔은 모던하고 감각적입니다. 바다가 액자처럼 한 눈에 보이도록 모든 객실에 넓은 창을 설계하였습니다.', '경주', 4, 550000, 'img/main15.jpg','풍부한 감각의 흐름을 느끼다'),
('생활서가', '서울', '한옥', '북한산의 산세가 창밖으로 비치는 아름다운 마을. 은평 한옥마을에 ‘생활서가’가 있다. 호스트 부부는 이곳을 마치 책을 꽂아두는 서가처럼 취향과 생활을 꽂아두며 지식과 취향을 발견할 수 있는 공간을 만들고자 했다.', '은평구', 4, 550000, 'img/main16.jpg','조용하고 평화로운 취향 서가'),
('토리코티지X하시시박', '제주', '민박', '제주시 조천읍에 있는 토리코티지X하시시박은 독특한 색감 영감을 구현해내는 포토그래퍼 하시시박과 콜라보레이션으로 완성된 곳입니다. 하얀 벽의 이색적인 구조물로 엔트런스를 길게 만들어 천천히 걸어오며 둘러볼 수 있도록 의도하였습니다.', '제주', 4, 550000, 'img/main17.jpg','너른 대지 위 연속적인 동선과 흐름을 마주하다'),
('테일러센츠', '강원', '민박', '후각은 그 어떤 감각보다 우리의 감정과 기억에 깊은 영향을 줍니다. 그래서 우리는 향기를 통해 누군가를 떠올리기도 하고 공간을 기억하기도하죠 코끝에 신선한 바람이 불어오는 찰나의 가을 이 아름다운 계절의 여행을 깊이 추억할 수 있도록 여긴어때가 테일러센츠와 만나 고유한 향기를 제안합니다.', '양양', 4, 550000, 'img/main18.jpg','감정을 움직이는 공간과 향기 with 테일러센츠'),
('공간동백', '제주', '민박', '공간동백은 여행에서 만난 우리 집 처럼 편안함을 드립니다 여긴어때와 공간동백이 만나 편안한 여행을 제안합니다.', '제주', 4, 550000, 'img/main19.jpg','온전히 나에게 집중하는 공간');

SELECT * FROM user


