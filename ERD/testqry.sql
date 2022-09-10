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
