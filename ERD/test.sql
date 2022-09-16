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
	authorities varchar(200),
	business_num varchar(10),
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
	ON DELETE RESTRICT
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

SELECT * FROM 'user'  ORDER BY user_num  DESC;
INSERT INTO `user`  (user_id , user_password ,user_name  , authorities) VALUES
('USER', '1234', '회원1', 'ROLE_MEMBER'),
('USER2', '1234', '회원2', null),
('ADMIN1', '1234', '관리자1', 'ROLE_MEMBER,ROLE_ADMIN')
;





SELECT * FROM room  ORDER BY room_num DESC;
SELECT * FROM qnaboard  ORDER BY qna_num  DESC;



