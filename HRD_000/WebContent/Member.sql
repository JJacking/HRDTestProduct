CREATE TABLE member_tbl_02(
    custno number(6) primary key,
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindate date,
    grade char(1),
    city char(2)
);

CREATE TABLE money_tbl_02(
    custno number(6) not null,
    salenol number(8) not null,
    pcost number(8),
    amount number(4),
    price number(8),
    pcode varchar2(4),
    sdate date,
    CONSTRAINT monney_pk PRIMARY KEY(custno,salenol)
);

CREATE SEQUENCE member_seq
start with 100001
INCREMENT by 1
nocache;

SELECT m1.custno, m1.custname, m1.grade, sum(m2.price)
FROM member_tbl_02 m1 join money_tbl_02 m2
ON m1.custno = m2.custno
GROUP BY (m1.custno, m1.custname, m1.grade)
ORDER BY sum(m2.price) DESC;


insert into member_tbl_02
VALUES(member_seq.nextval,'김행복','010-1111-2222','서울 동대문구 휘경1동','20151202','A','01');
insert into member_tbl_02
VALUES(member_seq.nextval,'이축복','010-1111-3333','서울 동대문구 휘경2동','20151206','B','01');
insert into member_tbl_02
VALUES(member_seq.nextval,'장믿음','010-1111-4444','울릉군 울릉읍 독도1리','20151001','B','30');
insert into member_tbl_02
VALUES(member_seq.nextval,'최사랑','010-1111-5555','울릉군 울릉읍 독도2리','20151113','A','30');
insert into member_tbl_02
VALUES(member_seq.nextval,'진평화','010-1111-6666','제주도 제주시 외나무골','20151225','B','60');
insert into member_tbl_02
VALUES(member_seq.nextval,'차공단','010-1111-7777','제주도 제주시 감나무골','20151211','C','60');

INSERT INTO money_tbl_02
VALUES(100001,20160001,500,5,2500,'A001','20160101');
INSERT INTO money_tbl_02
VALUES(100001,20160002,1000,4,4000,'A002','20160101');
INSERT INTO money_tbl_02
VALUES(100001,20160003,500,3,1500,'A008','20160101');
INSERT INTO money_tbl_02
VALUES(100002,20160004,2000,1,2000,'A004','20160102');
INSERT INTO money_tbl_02
VALUES(100002,20160005,500,1,500,'A001','20160103');
INSERT INTO money_tbl_02
VALUES(100003,20160006,1500,2,3000,'A003','20160103');
INSERT INTO money_tbl_02
VALUES(100004,20160007,500,2,1000,'A001','20160104');
INSERT INTO money_tbl_02
VALUES(100004,20160008,300,1,300,'A005','20160104');
INSERT INTO money_tbl_02
VALUES(100004,20160009,600,1,600,'A006','20160104');
INSERT INTO money_tbl_02
VALUES(100004,20160010,3000,1,3000,'A007','20160106');

COMMIT;

SELECT * FROM money_tbl_02;

SELECT * FROM member_tbl_02;



SELECT m1.custno, m1.custname, m1.grade, sum(m2.price)
FROM member_tbl_02 m1 join money_tbl_02 m2
ON m1.custno = m2.custno
GROUP BY (m1.custno, m1.custname, m1.grade)
ORDER BY sum(m2.price) DESC;

UPDATE member_tbl_02
SET custname=?, phone=?, address=?, grade=?, city=?, joindate=? 
WHERE custno = ?
