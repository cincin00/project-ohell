-- 테이블과 시퀀스 만들기
-- 팀 작업 메모(2016.04 마지막 버전)를 그대로 옮긴 것입니다.
-- 참고: 이 시점의 places, festival, board 테이블은 소스 코드(MyBatis 매퍼)와
--       칼럼이 일부 다릅니다. 최종 ERD에서는 places에 name, tel, detail, lon, lat,
--       placenum 칼럼이, festival에 title 칼럼이 더 있습니다.

create table client(
 id varchar2(15) primary key,
 passwd varchar2(15) not null,
 name varchar2(20) not null,
 email varchar2(30),
 age number not null,
 address varchar2(20) not null,
 phone varchar2(15) not null,
 num number not null,
 zipcode varchar2(50) not null,
 sex number not null,
 able number not null,
 ask varchar2(60) not null,
 answer varchar2(60) not null
);

create table plan(
 id_day varchar2(30) primary key,
 id varchar2(15) not null,
 start_day date not null,
 day number not null,
 constraint id_fk foreign key(id) references client(id)
);

create table places(
 placeid varchar2(15) primary key,
 id_day varchar2(30) not null,
 url varchar2(100) not null,
 day number not null,
 constraint id_day_fk foreign key(id_day) references plan(id_day)
);

create table board(
 boardnum number primary key,
 id_day varchar2(30) not null,
 like_num number,
 review varchar2(50),
 subject varchar2(30) not null,
 id varchar2(15),
 img_path varchar2(500),
 plan_calendar number(1),
 constraint id_day_fk2 foreign key(id_day) references plan(id_day),
 constraint id_client_fk2 foreign key(id) references client(id)
);

create table coment(
 coment_num number primary key,
 content_num number not null,
 comenter varchar2(15) not null,
 coment varchar2(50),
 like_num number default 0,
 constraint content_num_fk foreign key(content_num) references board(boardnum)
);

create table admin(
 id_admin varchar2(15) primary key,
 clientnum number,
 boardnum number,
 comentnum number
);

create table festival(
 id varchar2(100) primary key,
 start_date date not null,
 end_date date not null,
 location varchar2(200) not null,
 url varchar2(500) not null,
 imgurl varchar2(300) not null,
 text varchar2(500),
 season number(1)
);

create table zipcode(
 zipcode varchar2(10),
 area1 varchar2(100),
 area2 varchar2(500),
 area3 varchar2(500),
 area4 varchar2(2000)
);

create sequence client_num;
create sequence board_num;
create sequence coment_num;
create sequence festival_num;
