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
    loginId  CHAR(100) NOT NULL,
    loginPw CHAR(100) NOT NULL,
    `name` TEXT NOT NULL,
    nickname TEXT NOT NULL,
    cellphonenum INT(100) NOT NULL,
    email TEXT NOT NULL
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
loginId = 'test1',
loginPw = 'test1',
`name` = 'test1',
nickname = 'test1',
cellphonenum = '1234',
email = 'test1';


INSERT INTO `member` 
SET regDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = 'test2',
nickname = 'test2',
cellphonenum = '12345',
email = 'test2';


INSERT INTO `member` 
SET regDate = NOW(),
loginId = 'test3',
loginPw = 'test3',
`name` = 'test3',
nickname = 'test3',
cellphonenum = '123456',
email = 'test3';




SELECT * FROM article;

SELECT * FROM `member`;




SELECT LAST_INSERT_ID();