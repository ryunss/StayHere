-- 샘플 글
INSERT INTO qnaboard (user_num, qna_subject, qna_content) VALUES
(1, '제목입니다1', '내용입니다1'),
(1, '제목입니다2', '내용입니다2'),
(3, '제목입니다3', '내용입니다3'),
(3, '제목입니다4', '내용입니다4')
;

SELECT q.qna_num, q.qna_subject, q.qna_content, q.qna_regdate,
	u.user_num, u.user_id, u.user_name, u.authorities, u.user_regdate 
FROM qnaboard q, `user` u
WHERE q.user_num  = u.user_num
ORDER BY q.qna_num DESC
;

INSERT INTO qna_comment (user_num, qna_num, qc_content) VALUES
(1, 1, '1. user1이 1번글에 댓글 작성.'),
(1, 1, '2. user1이 1번글에 댓글 작성.'),
(1, 2, '3. user1이 2번글에 댓글 작성.'),
(1, 2, '4. user1이 2번글에 댓글 작성.'),
(1, 3, '5. user1이 3번글에 댓글 작성.'),
(1, 3, '6. user1이 3번글에 댓글 작성.'),
(1, 4, '7. user1이 4번글에 댓글 작성.'),
(1, 4, '8. user1이 4번글에 댓글 작성.'),
(3, 1, '9. admin1이 1번글에 댓글 작성.'),
(3, 1, '10. admin1이 1번글에 댓글 작성.'),
(3, 2, '11. admin1이 2번글에 댓글 작성.'),
(3, 2, '12. admin1이 2번글에 댓글 작성.'),
(3, 3, '13. admin1이 3번글에 댓글 작성.'),
(3, 3, '14. admin1이 3번글에 댓글 작성.'),
(3, 4, '15. admin1이 4번글에 댓글 작성.'),
(3, 4, '16. admin1이 4번글에 댓글 작성.')
;

INSERT INTO `user`  (user_id , user_password ,user_name, authorities) VALUES
('USER1', '1234', '회원1', 'ROLE_MEMBER')
;