--10대 이하
insert into member(m_id, m_password, m_birth, m_gender) values('lyr','1234', '20060204', 'M');
insert into member(m_id, m_password, m_birth, m_gender) values('pwh','1234', '20040305', 'M');
insert into member(m_id, m_password, m_birth, m_gender) values('jmg','1234', '20091127', 'F');
insert into member(m_id, m_password, m_birth, m_gender) values('pjm','1234', '20110905', 'F');
--20대
insert into member(m_id, m_password, m_birth, m_gender) values('jhg','1234', '19950728', 'M');
insert into member(m_id, m_password, m_birth, m_gender) values('chw','1234', '19940115', 'M');
insert into member(m_id, m_password, m_birth, m_gender) values('ljh','1234', '19941006', 'F');
insert into member(m_id, m_password, m_birth, m_gender) values('icg','1234', '19960126', 'F');

--30대
insert into member(m_id, m_password, m_birth, m_gender) values('shw','1234', '19920618', 'M');
insert into member(m_id, m_password, m_birth, m_gender) values('lmh','1234', '19931103', 'M');
insert into member(m_id, m_password, m_birth, m_gender) values('ykh','1234', '19931122', 'F');
insert into member(m_id, m_password, m_birth, m_gender) values('jje','1234', '19930101', 'F');

--40대
insert into member(m_id, m_password, m_birth, m_gender) values('kej','1234', '19750213', 'M');
insert into member(m_id, m_password, m_birth, m_gender) values('mst','1234', '19801231', 'M');
insert into member(m_id, m_password, m_birth, m_gender) values('ljj','1234', '19810906', 'F');
insert into member(m_id, m_password, m_birth, m_gender) values('syb','1234', '19831005', 'F');


--50대 이삳
insert into member(m_id, m_password, m_birth, m_gender) values('jkh','1234', '19580912', 'M');
insert into member(m_id, m_password, m_birth, m_gender) values('pgs','1234', '19591106', 'M');
insert into member(m_id, m_password, m_birth, m_gender) values('ydh','1234', '19650403', 'F');
insert into member(m_id, m_password, m_birth, m_gender) values('hjy','1234', '19640823', 'F');

commit;

insert into genre(g_no, g_name) values(1, '발라드');
insert into genre(g_no, g_name) values(2, '댄스');
insert into genre(g_no, g_name) values(3, '랩/힙합');
insert into genre(g_no, g_name) values(4, 'RnB/Soul');
insert into genre(g_no, g_name) values(5, '인디음악');
insert into genre(g_no, g_name) values(6, '트로트');
insert into genre(g_no, g_name) values(7, 'OST');
insert into genre(g_no, g_name) values(8, 'POP');

commit;

insert into artist(artist_no, artist_name) values(1, '몬스타엑스');
insert into artist(artist_no, artist_name) values(2, '민혁');
insert into artist(artist_no, artist_name) values(3, '장범준');

commit;

insert into album(a_no, a_name, a_cover, artist_no) values (1, 'shape of love', '사진경로',1);
insert into album(a_no, a_name, a_cover, artist_no) values (2, 'the code', '사진경로',1);
insert into album(a_no, a_name, a_cover, artist_no) values (3, 'connect', '사진경로',1);
insert into album(a_no, a_name, a_cover, artist_no) values (4, '꽃송이가', '사진경로',3);

insert into sound(s_no, a_no, s_name, s_path, g_no) values(1, 1, 'love', '음원파일', 2);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(2, 1, 'wildfire', '음원파일', 2);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(3, 1, 'burning up', '음원파일', 1);

insert into sound(s_no, a_no, s_name, s_path, g_no) values(1, 2, 'dramarama', '음원파일', 3);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(2, 2, 'hero', '음원파일', 4);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(3, 2, '신속히', '음원파일', 1);

commit;

insert into sound(s_no, a_no, s_name, s_path, g_no) values(1, 3, 'jealousy', '음원파일', 8);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(2, 3, 'lost in the dream', '음원파일', 7);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(3, 3, '옹심이', '음원파일', 6);

insert into sound(s_no, a_no, s_name, s_path, g_no) values(1, 4, '흩들리는 꽃들 속에서', '음원파일', 4);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(2, 4, '벚꽃엔딩', '음원파일', 8);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(3, 4, '처음에 사랑이란게', '음원파일', 5);

insert into sound(s_no, a_no, s_name, s_path, g_no) values(4, 4, '발라드곡1', '음원파일', 1);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(5, 4, '발라드곡2', '음원파일', 1);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(6, 4, '발라드곡3', '음원파일', 1);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(7, 4, '발라드곡4', '음원파일', 1);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(8, 4, '발라드곡5', '음원파일', 1);

commit;

insert into sound(s_no, a_no, s_name, s_path, g_no) values(4, 2, '댄스곡1', '음원파일', 2);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(5, 2, '댄스곡2', '음원파일', 2);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(6, 2, '댄스곡3', '음원파일', 2);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(7, 2, '댄스곡4', '음원파일', 2);
insert into sound(s_no, a_no, s_name, s_path, g_no) values(8, 2, '댄스곡5', '음원파일', 2);



insert into singer values (1,1,1);
insert into singer values (2,1,1);
insert into singer values (3,1,1);

insert into singer values (1,2,1);
insert into singer values (2,2,1);
insert into singer values (3,2,1);
insert into singer values (4,2,1);
insert into singer values (5,2,1);
insert into singer values (6,2,1);
insert into singer values (7,2,1);
insert into singer values (8,2,1);

commit;

insert into singer values (1,3,1);
insert into singer values (2,3,1);
insert into singer values (3,3,2);

insert into singer values (1,4,3);
insert into singer values (2,4,3);
insert into singer values (3,4,3);
insert into singer values (4,4,3);
insert into singer values (5,4,3);
insert into singer values (6,4,3);
insert into singer values (7,4,3);
insert into singer values (8,4,3);

insert into area values (1, '강남구');
insert into area values (2, '종로구');
insert into area values (3, '광진구');
insert into area values (4, '중랑구');


commit;

insert into playinfo values(1, 1, 1, 'lyr', 1, default,  '맑음', '10%', '25');
insert into playinfo values(2, 2, 1, 'lyr', 1, default,  '맑음', '10%', '25');
insert into playinfo values(3, 1, 3, 'lyr', 1, default, '맑음', '10%', '25');
insert into playinfo values(4, 2, 2, 'lyr', 1, default, '맑음', '10%', '25');
insert into playinfo values(5, 2, 3, 'lyr', 1, default,  '맑음', '10%', '25');
insert into playinfo values(6, 3, 4, 'lyr', 1, default,  '맑음', '10%', '25');


insert into playinfo values(7, 3, 3, 'pwh', 2, default, '맑음', '10%', '25');
insert into playinfo values(8, 2, 2, 'pwh', 2, default,  '맑음', '10%', '25');
insert into playinfo values(9, 3, 2, 'pwh', 3, default,  '맑음', '10%', '25');
insert into playinfo values(10, 2, 1, 'pwh', 3, default,  '맑음', '10%', '25');
insert into playinfo values(11, 2, 4, 'pwh', 4, default, '맑음', '10%', '25');
insert into playinfo values(12, 1, 4, 'pwh', 4, default,  '맑음', '10%', '25');

commit;

--10대가 들은 노래
insert into playinfo values(13, 1, 1, 'jmg', 2, default,  '비', '50%', '21');
insert into playinfo values(14, 1, 1, 'jmg', 2, default,  '비', '50%', '21');
insert into playinfo values(15, 1, 1, 'jmg', 3, default,  '비', '50%', '21');
insert into playinfo values(16, 1, 2, 'jmg', 3, default, '비', '50%', '21');
insert into playinfo values(17, 1, 2, 'jmg', 4, default,  '비', '50%', '21');
insert into playinfo values(18, 1, 2, 'jmg', 4, default,  '비', '50%', '21');

insert into playinfo values(19, 6, 4, 'pjm', 2, default,  '비', '50%', '21');
insert into playinfo values(20, 6, 4, 'pjm', 2, default,  '비', '50%', '21');
insert into playinfo values(21, 7, 4, 'pjm', 3, default,  '비', '50%', '21');
insert into playinfo values(22, 7, 4, 'pjm', 3, default, '비', '50%', '21');
insert into playinfo values(23, 8, 4, 'pjm', 4, default,  '비', '50%', '21');
insert into playinfo values(24, 8, 4, 'pjm', 4, default,  '비', '50%', '21');
insert into playinfo values(25, 8, 4, 'pjm', 2, default,  '비', '50%', '21');
insert into playinfo values(26, 8, 4, 'pjm', 2, default,  '비', '50%', '21');

commit;
--20대가 들은 노래

insert into playinfo values(27, 8, 4, 'icg', 3, default,  '비', '50%', '21');
insert into playinfo values(28, 5, 4, 'icg', 3, default,  '비', '50%', '21');
insert into playinfo values(29, 5, 4, 'icg', 4, default,  '비', '50%', '21');
insert into playinfo values(30, 5, 4, 'jhg', 4, default,  '비', '50%', '21');
insert into playinfo values(31, 6, 4, 'jhg', 2, default,  '비', '50%', '21');
insert into playinfo values(32, 6, 4, 'icg', 2, default,  '비', '50%', '21');
insert into playinfo values(33, 7, 4, 'jhg', 3, default,  '비', '50%', '21');
insert into playinfo values(34, 7, 4, 'icg', 3, default,  '비', '50%', '21');
insert into playinfo values(35, 8, 4, 'icg', 4, default,  '비', '50%', '21');
insert into playinfo values(36, 8, 4, 'icg', 4, default,  '비', '50%', '21');

insert into playinfo values(37, 1, 1, 'jhg', 2, default,  '눈', '50%', '21');
insert into playinfo values(38, 1, 2, 'jhg', 2, default,  '눈', '50%', '21');
insert into playinfo values(39, 1, 2, 'jhg', 3, default,  '눈', '50%', '21');
insert into playinfo values(40, 1, 3, 'icg', 3, default,  '눈', '50%', '21');
insert into playinfo values(41, 1, 3, 'jhg', 4, default,  '눈', '50%', '21');
insert into playinfo values(42, 1, 3, 'jhg', 4, default,  '눈', '50%', '21');
insert into playinfo values(43, 1, 4, 'icg', 2, default,  '눈', '50%', '21');
insert into playinfo values(44, 1, 4, 'icg', 2, default,  '눈', '50%', '21');
insert into playinfo values(45, 3, 4, 'icg', 3, default,  '눈', '50%', '21');
insert into playinfo values(46, 3, 4, 'icg', 3, default,  '눈', '50%', '21');
insert into playinfo values(47, 2, 1, 'icg', 4, default,  '눈', '50%', '21');
insert into playinfo values(48, 2, 1, 'icg', 4, default, '눈', '50%', '21');
insert into playinfo values(49, 2, 1, 'ljh', 2, default, '눈', '50%', '21');
insert into playinfo values(50, 6, 4, 'ljh', 2, default,  '눈', '50%', '21');
insert into playinfo values(51, 7, 4, 'ljh', 3, default,  '눈', '50%', '21');
insert into playinfo values(52, 7, 4, 'ljh', 3, default, '눈', '50%', '21');
insert into playinfo values(53, 8, 4, 'ljh', 4, default,  '눈', '50%', '21');
insert into playinfo values(54, 8, 4, 'ljh', 4, default,  '눈', '50%', '21');

commit;

--좋아요
insert into sound_like values('shw',1,1);
insert into sound_like values('jhg',1,1);
insert into sound_like values('icg',1,1);
insert into sound_like values('ljh',1,1);
insert into sound_like values('chw',1,1);

insert into sound_like values('shw',2,1);
insert into sound_like values('jhg',2,1);

insert into sound_like values('icg',3,1);
insert into sound_like values('ljh',3,1);
insert into sound_like values('chw',3,1);
commit;
