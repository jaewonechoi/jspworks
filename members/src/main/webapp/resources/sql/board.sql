-- board 테이블 생성
CREATE TABLE board(
    bno         NUMBER PRIMARY KEY,
    title       VARCHAR2(100) NOT NULL,
    content     CLOB NOT NULL,
    createdate  TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate  TIMESTAMP,
    hit         NUMBER DEFAULT 0,
    filename    VARCHAR2(50),
    id          VARCHAR2(20) NOT NULL,
    FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE
);

CREATE SEQUENCE seq_bno NOCACHE;

INSERT INTO board (bno, title, content, id)
VALUES (seq_bno.NEXTVAL, '글제목', '글내용입니다', 'khit');

COMMIT;

SELECT * FROM board;

SELECT * FROM board ORDER BY createdate DESC;

DELETE FROM board WHERE bno = 3;

-- 글 번호가 5번인 제목을 '공지사항 수정', 내용을 '공지사항 수정입니다.'
UPDATE board SET title = '공지사항 수정', content = '공지사항 수정입니다.'
WHERE bno = 5;

-- 글 번호가 5번인 게시글의 추천수를 1증가
UPDATE board SET hit = hit + 1
WHERE bno = 5;