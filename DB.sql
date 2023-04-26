#DB 생성
DROP DATABASE IF EXISTS SB_AM_04;
CREATE DATABASE SB_AM_04;
USE SB_AM_04;

# 게시물 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

# 회원 테이블 생성
CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId  CHAR(20) NOT NULL,
    loginPw CHAR(60) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨(3=일반,7=관리자)',
    `name` CHAR(20) NOT NULL,
    nickname CHAR(20) NOT NULL,
    cellphoneNum CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부(0=탈퇴 전, 1 = 탈퇴 후 )',
    delDate DATETIME COMMENT '탈퇴날짜'
);

# 게시물 테스트데이터 생성
INSERT INTO article 
SET regDate = NOW(),
updateDate = NOW(),
title = '제목 1',
`body` = '내용 1';

INSERT INTO article 
SET regDate = NOW(),
updateDate = NOW(),
title = '제목 2',
`body` = '내용 2';

INSERT INTO article 
SET regDate = NOW(),
updateDate = NOW(),
title = '제목 3',
`body` = '내용 3';

# 회원  테스트데이터 생성

INSERT INTO `member` 
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authLevel` = 7,
`name` = '관리자',
nickname = '관리자',
cellphoneNum = '01012341234',
email = 'abcdef@gmail.com';



INSERT INTO `member` 
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = 'test1',
`authLevel` = 3,
`name` = 'test1',
nickname = 'test1',
cellphoneNum = '01012341235',
email = 'aadwq@gmail.com';


INSERT INTO `member` 
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`authLevel` = 3,
`name` = 'test2',
nickname = 'test2',
cellphoneNum = '01012341236',
email = 'absdfsdf@gmail.com';


# 게시물 테이블 구조 변경 memberID 추가

ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER `updateDate`;


UPDATE article
SET memberId = 2
WHERE id IN(1,2);

UPDATE article
SET memberId = 3
WHERE id =3;




# 게시판  테이블 생성
CREATE TABLE board(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(20) NOT NULL UNIQUE COMMENT 'notice(공지사항), free(자유), qna(질의응답)',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부(0=삭제 전, 1 = 삭제 후 )',
    delDate DATETIME COMMENT '삭제날짜'
);



INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'NOTICE',
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE',
`name` = '자유';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'QnA',
`name` = '질의응답';


ALTER TABLE article ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;

UPDATE article
SET boardId =1
WHERE id IN (1,2);

UPDATE article
SET boardId =2
WHERE id =3;

###게시물 갯수 늘리기
UPDATE article
SET `body` = '내용4'
WHERE id = 1;

UPDATE article
SET `body` = '내용5'
WHERE id = 2;

UPDATE article
SET `body` = '내용6'
WHERE id = 3;

INSERT INTO article 
(
    regDate,updateDate , memberId , boardId , title, `body`
) 
SELECT NOW(),NOW(),
FLOOR(RAND() * 2) + 2,  
FLOOR(RAND() * 2) + 1, 
CONCAT('제목_' ,RAND()),CONCAT( '내용_',RAND())
FROM article;

SELECT *
FROM article
WHERE boardId = 1
ORDER BY id DESC
LIMIT 0, 10



select now()

SELECT floor(rand() * 2) + 1
###테이블 확인

SELECT * FROM article;
select * from `member`;
SELECT * FROM board;

DESC `article`;
desc `member`;
DESC `board`;

SELECT COUNT(*) > 0
FROM `member`
WHERE `name` = '관리자'
AND email = 'abcdef@gmail.com';


SELECT A.*, M.name AS 작성자
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
WHERE A.id = M.id;

############################################

SELECT A.id,A.memberId, B.code AS 게시판이름
FROM article AS A
INNER JOIN `board` AS B
ON A.boardId = B.id
WHERE A.id = B.id;



SELECT LAST_INSERT_ID();