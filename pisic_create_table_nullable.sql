DROP TABLE "ARTIST_LIKE"  CASCADE CONSTRAINTS;
DROP TABLE "SINGER"  CASCADE CONSTRAINTS;
DROP TABLE "SOUND_COMPOSER"  CASCADE CONSTRAINTS;
DROP TABLE "SOUND_WRITER"  CASCADE CONSTRAINTS;
DROP TABLE "ARTIST"  CASCADE CONSTRAINTS;
DROP TABLE "PLAYLIST_CONTENT"  CASCADE CONSTRAINTS;
DROP TABLE "SOUND_RECOMMENT"  CASCADE CONSTRAINTS;
DROP TABLE "SOUND_LIKE"  CASCADE CONSTRAINTS;
DROP TABLE "PLAYINFO"  CASCADE CONSTRAINTS;
DROP TABLE "AREA"  CASCADE CONSTRAINTS;
DROP TABLE "SOUND"  CASCADE CONSTRAINTS;
DROP TABLE "GENRE_LIKE"  CASCADE CONSTRAINTS;
DROP TABLE "GENRE"  CASCADE CONSTRAINTS;
DROP TABLE "ALBUM"  CASCADE CONSTRAINTS;
DROP TABLE "QNA"  CASCADE CONSTRAINTS;
DROP TABLE "FAQ"  CASCADE CONSTRAINTS;
DROP TABLE "MEMBERSHIP_INFO"  CASCADE CONSTRAINTS;
DROP TABLE "MEMBERSHIP"  CASCADE CONSTRAINTS;
DROP TABLE "BOARD_REPORT"  CASCADE CONSTRAINTS;
DROP TABLE "BOARD_LIKE"  CASCADE CONSTRAINTS;
DROP TABLE "RECOMMENT"  CASCADE CONSTRAINTS;
DROP TABLE "BOARD"  CASCADE CONSTRAINTS;
DROP TABLE "PLAYLIST"  CASCADE CONSTRAINTS;
DROP TABLE "MEMBER"  CASCADE CONSTRAINTS;



--CREATE TABLE "MEMBER" (
--	"M_ID"	VARCHAR2(10)		NOT NULL,
--	"M_PLATFORM"	VARCHAR2(50)		NULL,
--	"M_PLATFROM_ID"	VARCHAR2(100)		NULL,
--	"M_PASSWORD"	VARCHAR2(20)		NOT NULL,
--	"M_NAME"	VARCHAR2(30)		NOT NULL,
--	"M_NICKNAME"	VARCHAR2(30)		NOT NULL,
--	"M_PHONE"	VARCHAR2(13)		NOT NULL,
--	"M_ADDRESS"	VARCHAR2(200)		NOT NULL,
--	"M_ADDRESS_DETAIL"	VARCHAR2(200)		NOT NULL,
--	"M_DATE"		TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
--	"M_BIRTH"	NUMBER		NOT NULL,
--  "M_GENDER"	VARCHAR2(1)		NOT NULL,
--	"M_PROFILE"	VARCHAR2(300)		NOT NULL,
--	"M_DELETE_YN"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
--	"M_EMAIL"	VARCHAR2(100)		NOT NULL,
--	"M_MEMBERSHIP_YN"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
--	"M_GRADE"	NUMBER	DEFAULT 1	NOT NULL
--);

CREATE TABLE "MEMBER" (
	"M_ID"	VARCHAR2(20)		NOT NULL,
	"M_PLATFORM"	VARCHAR2(50)		NULL,
	"M_PLATFROM_ID"	VARCHAR2(100)		NULL,
	"M_PASSWORD"	VARCHAR2(25)		NOT NULL,
	"M_NAME"	VARCHAR2(30)		 NULL,
	"M_NICKNAME"	VARCHAR2(45)		 NULL,
	"M_PHONE"	VARCHAR2(11)		NULL,
	"M_ADDRESS"	VARCHAR2(200)		 NULL,
	"M_ADDRESS_DETAIL"	VARCHAR2(200)	 NULL,
	"M_DATE"		TIMESTAMP	DEFAULT SYSTIMESTAMP   NULL,
	"M_BIRTH"	NUMBER		NOT NULL,
    "M_GENDER"	VARCHAR2(1)		NOT NULL,
	"M_PROFILE"	VARCHAR2(300)		 NULL,
	"M_DELETE_YN"	VARCHAR2(1)	DEFAULT 'N'	 NULL,
	"M_EMAIL"	VARCHAR2(100)		 NULL,
	"M_MEMBERSHIP_YN"	VARCHAR2(1)	DEFAULT 'N'	 NULL,
	"M_GRADE"	NUMBER	DEFAULT 1	NULL
);

COMMENT ON COLUMN "MEMBER"."M_GRADE" IS '관리자는 0';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"M_ID"
);

--CREATE TABLE "PLAYLIST" (
--	"L_NO"	NUMBER		NOT NULL,
--	"M_ID"	VARCHAR2(10)		NOT NULL,
--	"L_NAME"	VARCHAR2(50)		NOT NULL,
--	"L_PRIVATE_YN"	VARCHAR2(1)	DEFAULT 'Y'	NULL
--);

CREATE TABLE "PLAYLIST" (
	"L_NO"	NUMBER		NOT NULL,
	"M_ID"	VARCHAR2(10)		NOT NULL,
	"L_NAME"		VARCHAR2(50)		 NULL,
	"L_PRIVATE_YN"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"L_IMAGE"	VARCHAR2(300)	NULL
);

ALTER TABLE "PLAYLIST" ADD CONSTRAINT "PK_PLAYLIST" PRIMARY KEY (
	"L_NO",
	"M_ID"
);
ALTER TABLE "PLAYLIST" ADD CONSTRAINT "FK_MEMBER_TO_PLAYLIST_1" FOREIGN KEY (
	"M_ID"
)
REFERENCES "MEMBER" (
	"M_ID"
) ON DELETE CASCADE;

--CREATE TABLE "BOARD" (
--	"B_NO"	NUMBER		NOT NULL,
--	"B_TITLE"	VARCHAR2(100)		NOT NULL,
--	"B_CONTENT"	VARCHAR2(500)		NOT NULL,
--	"B_WRITER"	VARCHAR2(30)		NOT NULL,
--	"B_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
--	"B_CNT"	NUMBER	DEFAULT 0	NOT NULL,
--	"L_NO"	NUMBER		NOT NULL,
--	"M_ID"	VARCHAR2(10)		NOT NULL
--);

CREATE TABLE "BOARD" (
	"B_NO"	NUMBER		NOT NULL,
	"B_TITLE"	VARCHAR2(100)		 NULL,
	"B_CONTENT"	VARCHAR2(500)		 NULL,
	"B_WRITER"	VARCHAR2(30)		 NULL,
	"B_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"B_CNT"	NUMBER	DEFAULT 0	 NULL,
	"L_NO"	NUMBER		NOT NULL,
	"M_ID"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "BOARD"."B_WRITER" IS 'MEMBER(M_NICKNAME)';

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"B_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_PLAYLIST_TO_BOARD" FOREIGN KEY (
	"L_NO",
	"M_ID"
)
REFERENCES "PLAYLIST" (
	"L_NO",
	"M_ID"
) ON DELETE CASCADE;

--CREATE TABLE "RECOMMENT" (
--	"R_NO"	NUMBER		NOT NULL,
--	"R_CONTENT"	VARCHAR2(300)		NOT NULL,
--	"R_WRITER"	VARCHAR2(30)		NOT NULL,
--	"R_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
--	"B_NO"	NUMBER		NOT NULL
--);

CREATE TABLE "RECOMMENT" (
	"R_NO"	NUMBER		NOT NULL,
	"R_CONTENT"	VARCHAR2(300)		 NULL,
	"R_WRITER"	VARCHAR2(30)		 NULL,
	"R_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"B_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "RECOMMENT"."R_WRITER" IS 'MEMBER(M_NICKNAME)';

ALTER TABLE "RECOMMENT" ADD CONSTRAINT "PK_RECOMMENT" PRIMARY KEY (
	"R_NO"
);
ALTER TABLE "RECOMMENT" ADD CONSTRAINT "FK_BOARD_TO_RECOMMENT_1" FOREIGN KEY (
	"B_NO"
)
REFERENCES "BOARD" (
	"B_NO"
) ON DELETE CASCADE;

CREATE TABLE "BOARD_LIKE" (
	"B_NO"	NUMBER		NOT NULL,
	"M_ID"	VARCHAR2(10)		NOT NULL
);

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_BOARD_TO_BOARD_LIKE_1" FOREIGN KEY (
	"B_NO"
)
REFERENCES "BOARD" (
	"B_NO"
) ON DELETE CASCADE;

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_LIKE_1" FOREIGN KEY (
	"M_ID"
)
REFERENCES "MEMBER" (
	"M_ID"
) ON DELETE CASCADE;

--CREATE TABLE "BOARD_REPORT" (
--	"B_R_NO"	NUMBER		NOT NULL,
--	"B_R_CONTENT"	VARCHAR2(500)		NOT NULL,
--	"B_R_WRITER"	VARCHAR2(30)		NOT NULL,
--	"B_R_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
--	"B_NO"	NUMBER		NOT NULL,
--	"M_ID"	VARCHAR2(10)		NOT NULL
--);

CREATE TABLE "BOARD_REPORT" (
	"B_R_NO"	NUMBER		NOT NULL,
	"B_R_CONTENT"	VARCHAR2(500)		 NULL,
	"B_R_WRITER"	VARCHAR2(30)		 NULL,
	"B_R_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"B_NO"	NUMBER		 NULL,
	"M_ID"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "BOARD_REPORT"."B_R_WRITER" IS 'MEMBER(M_NICKNAME)';

ALTER TABLE "BOARD_REPORT" ADD CONSTRAINT "PK_BOARD_REPORT" PRIMARY KEY (
	"B_R_NO"
);
ALTER TABLE "BOARD_REPORT" ADD CONSTRAINT "FK_BOARD_TO_BOARD_REPORT_1" FOREIGN KEY (
	"B_NO"
)
REFERENCES "BOARD" (
	"B_NO"
) ON DELETE CASCADE;

ALTER TABLE "BOARD_REPORT" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_REPORT_1" FOREIGN KEY (
	"M_ID"
)
REFERENCES "MEMBER" (
	"M_ID"
) ON DELETE CASCADE;

--CREATE TABLE "MEMBERSHIP" (
--	"MS_NO"	NUMBER		NOT NULL,
--	"MS_NAME"	VARCHAR2(100)		NOT NULL,
--	"MS_PRICE"	NUMBER		NOT NULL,
--	"MS_PERIOD"	NUMBER		NOT NULL
--);

CREATE TABLE "MEMBERSHIP" (
	"MS_NO"	NUMBER		NOT NULL,
	"MS_NAME"	VARCHAR2(100)		 NULL,
	"MS_PRICE"	NUMBER		 NULL,
	"MS_PERIOD"	NUMBER		 NULL
);

COMMENT ON COLUMN "MEMBERSHIP"."MS_NO" IS 'seq';

ALTER TABLE "MEMBERSHIP" ADD CONSTRAINT "PK_MEMBERSHIP" PRIMARY KEY (
	"MS_NO"
);

--CREATE TABLE "MEMBERSHIP_INFO" (
--	"MS_I_NO"	VARCHAR(255)		NOT NULL,
--	"M_ID"	VARCHAR2(10)		NOT NULL,
--	"MS_NO"	NUMBER		NOT NULL,
--	"MS_I_PG"	VARCHAR2(100)		NOT NULL,
--	"MS_I_CARD"	VARCHAR2(100)		NULL,
--	"MS_P_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
--	"MS_S_DATE"	TIMESTAMP		NOT NULL,
--	"MS_D_DATE"	TIMESTAMP		NOT NULL
--);

CREATE TABLE "MEMBERSHIP_INFO" (
	"MS_I_NO"	VARCHAR(255)		NOT NULL,
	"M_ID"	VARCHAR2(10)		NOT NULL,
	"MS_NO"	NUMBER		NOT NULL,
	"MS_I_PG"	VARCHAR2(100)		 NULL,
	"MS_I_CARD"	VARCHAR2(100)		NULL,
	"MS_P_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	 NULL,
	"MS_S_DATE"	TIMESTAMP		 NULL,
	"MS_D_DATE"	TIMESTAMP		 NULL
);

COMMENT ON COLUMN "MEMBERSHIP_INFO"."MS_NO" IS 'seq';

COMMENT ON COLUMN "MEMBERSHIP_INFO"."MS_I_CARD" IS 'NULL';

ALTER TABLE "MEMBERSHIP_INFO" ADD CONSTRAINT "PK_MEMBERSHIP_INFO" PRIMARY KEY (
	"MS_I_NO"
);

--CREATE TABLE "FAQ" (
--	"FAQ_NO"	NUMBER		NOT NULL,
--	"FAQ_TITLE"	VARCHAR2(100)		NOT NULL,
--	"FAQ_CONTENT"	VARCHAR2(500)		NOT NULL,
--	"FAQ_CNT"	NUMBER	DEFAULT 0	NOT NULL,
--	"M_ID"	VARCHAR2(10)		NOT NULL,
--	"FAQ_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL
--);

CREATE TABLE "FAQ" (
	"FAQ_NO"	NUMBER		NOT NULL,
	"FAQ_TITLE"	VARCHAR2(100)		 NULL,
	"FAQ_CONTENT"	VARCHAR2(500)		 NULL,
	"FAQ_CNT"	NUMBER	DEFAULT 0	 NULL,
	"M_ID"	VARCHAR2(10)		NOT NULL,
	"FAQ_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL
);

ALTER TABLE "FAQ" ADD CONSTRAINT "FK_MEMBER_TO_FAQ_1" FOREIGN KEY (
	"M_ID"
)
REFERENCES "MEMBER" (
	"M_ID"
) ON DELETE CASCADE;
ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"FAQ_NO"
);
--
--CREATE TABLE "QNA" (
--	"QNA_NO"	NUMBER		NOT NULL,
--	"QNA_TITLE"	VARCHAR2(100)		NOT NULL,
--	"QNA_CONTENT"	VARCHAR2(500)		NOT NULL,
--	"QNA_PASSWORD"	NUMBER		NOT NULL,
--	"M_ID"	VARCHAR2(10)		NOT NULL,
--	"QNA_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL
--	"ORIGIN_NO"	NUMBER		NOT NULL,
--	"GR_ORD"	NUMBER	DEFAULT 0	NOT NULL,
--	"GR_LAYER"	NUMBER	DEFAULT 0	NOT NULL
--);


CREATE TABLE "QNA" (
	"QNA_NO"	NUMBER		NOT NULL,
	"QNA_TITLE"	VARCHAR2(100)		NOT NULL,
	"QNA_CONTENT"	VARCHAR2(500)		NOT NULL,
	"QNA_SECRET"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL,
	"M_ID"	VARCHAR2(10)		NOT NULL,
	"QNA_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"ORIGIN_NO"	NUMBER		NOT NULL,
	"GR_ORD"	NUMBER	DEFAULT 0	NOT NULL,
	"GR_LAYER"	NUMBER	DEFAULT 0	NOT NULL
);

ALTER TABLE "QNA" ADD CONSTRAINT "FK_MEMBER_TO_QNA_1" FOREIGN KEY (
	"M_ID"
)
REFERENCES "MEMBER" (
	"M_ID"
) ON DELETE CASCADE;

ALTER TABLE "QNA" ADD CONSTRAINT "PK_QNA" PRIMARY KEY (
	"QNA_NO"
);


REFERENCES "MEMBER" (
	"M_ID"
) ON DELETE CASCADE;

--CREATE TABLE "ARTIST" (
--	"ARTIST_NO"	NUMBER		NOT NULL,
--	"ARTIST_NAME"	VARCHAR2(100)		NOT NULL,
--	"ARTIST_NATION"	VARCHAR2(100)		NOT NULL,
--	"ARTIST_COMPANY"	VARCHAR2(100)		NOT NULL,
--	"ARTIST_TYPE"	VARCHAR2(100)		NOT NULL,
--	"ARTIST_GROUP"	VARCHAR2(100)		NULL,
--	"ARTIST_MEMBER"	VARCHAR2(300)		NULL,
--	"ARTIST_PROFILE"	VARCHAR2(300)		NOT NULL,
--	"ARTIST_INFO1"	VARCHAR2(4000)		NOT NULL,
--	"ARTIST_INFO2"	VARCHAR2(4000)		NOT NULL
--);

CREATE TABLE "ARTIST" (
	"ARTIST_NO"	NUMBER		NOT NULL,
	"ARTIST_NAME"	VARCHAR2(100)		NOT NULL,
	"ARTIST_NATION"	VARCHAR2(100)		 NULL,
	"ARTIST_COMPANY"	VARCHAR2(100)		 NULL,
	"ARTIST_TYPE"	VARCHAR2(100)		 NULL,
	"ARTIST_GROUP"	VARCHAR2(200)		NULL,
	"ARTIST_MEMBER"	VARCHAR2(300)		NULL,
	"ARTIST_PROFILE"	VARCHAR2(300)		 NULL,
	"ARTIST_INFO1"	VARCHAR2(4000)		 NULL,
	"ARTIST_INFO2"	VARCHAR2(4000)		 NULL
);

COMMENT ON COLUMN "ARTIST"."ARTIST_TYPE" IS '솔로, 그룹';

ALTER TABLE "ARTIST" ADD CONSTRAINT "PK_ARTIST" PRIMARY KEY (
	"ARTIST_NO"
);


--CREATE TABLE "ALBUM" (
--	"A_NO"	NUMBER		NOT NULL,
--	"A_NAME"	VARCHAR2(100)		NOT NULL,
--	"A_COVER"	VARCHAR2(300)		NOT NULL,
--	"A_DATE"	DATE		NOT NULL,
--	"A_PUBLISHING"	VARCHAR2(100)		NOT NULL,
--	"A_AGENCY"	VARCHAR2(100)		NOT NULL,
--	"A_INTRODUCE1"	VARCHAR2(4000)		NOT NULL,
--	"A_INTRODUCE2"	VARCHAR2(4000)		NOT NULL,
--	"ARTIST_NO"	NUMBER		NOT NULL
--);

CREATE TABLE "ALBUM" (
	"A_NO"	NUMBER		NOT NULL,
	"A_NAME"	VARCHAR2(100)		NOT NULL,
	"A_COVER"	VARCHAR2(300)		 NULL,
	"A_DATE"	DATE		 NULL,
	"A_PUBLISHING"	VARCHAR2(100)		 NULL,
	"A_AGENCY"	VARCHAR2(100)		 NULL,
	"A_INTRODUCE1"	VARCHAR2(4000)		 NULL,
	"A_INTRODUCE2"	VARCHAR2(4000)		 NULL,
	"ARTIST_NO"	NUMBER		NOT NULL
);

ALTER TABLE "ALBUM" ADD CONSTRAINT "PK_ALBUM" PRIMARY KEY (
	"A_NO"
);

ALTER TABLE "ALBUM" ADD CONSTRAINT "FK_ARTIST_TO_ALBUM_1" FOREIGN KEY (
	"ARTIST_NO"
)
REFERENCES "ARTIST" (
	"ARTIST_NO"
) ON DELETE CASCADE;

CREATE TABLE "GENRE" (
	"G_NO"	NUMBER		NOT NULL,
	"G_NAME"	VARCHAR2(50)		NOT NULL
);

ALTER TABLE "GENRE" ADD CONSTRAINT "PK_GENRE" PRIMARY KEY (
	"G_NO"
);

CREATE TABLE "GENRE_LIKE" (
	"M_ID"	VARCHAR2(10)		NOT NULL,
	"G_NO"	NUMBER		NOT NULL
);

ALTER TABLE "GENRE_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_GENRE_LIKE_1" FOREIGN KEY (
	"M_ID"
)
REFERENCES "MEMBER" (
	"M_ID"
) ON DELETE CASCADE;

ALTER TABLE "GENRE_LIKE" ADD CONSTRAINT "FK_GENRE_TO_GENRE_LIKE_1" FOREIGN KEY (
	"G_NO"
)
REFERENCES "GENRE" (
	"G_NO"
) ON DELETE CASCADE;
--
--CREATE TABLE "SOUND" (
--	"S_NO"	NUMBER		NOT NULL,
--	"A_NO"	NUMBER		NOT NULL,
--	"S_NAME"	VARCHAR2(100)		NOT NULL,
--	"S_LYRICS1"	VARCHAR2(4000)		NOT NULL,
--	"S_LYRICS2"	VARCHAR2(4000)		NOT NULL,
--	"S_AGE_YN"	VARCHAR2(1)	DEFAULT 'N'	NULL,
--	"S_PATH"	VARCHAR2(300)		NOT NULL,
--	"G_NO"	NUMBER		NOT NULL
--);

CREATE TABLE "SOUND" (
	"S_NO"	NUMBER		NOT NULL,
	"A_NO"	NUMBER		NOT NULL,
	"S_NAME"	VARCHAR2(100)		NOT NULL,
	"S_LYRICS1"	VARCHAR2(4000)		 NULL,
	"S_LYRICS2"	VARCHAR2(4000)		 NULL,
	"S_AGE_YN"	VARCHAR2(1)	DEFAULT 'N'	NULL,
	"S_PATH"	VARCHAR2(300)		 NULL,
	"G_NO"	NUMBER		NOT NULL
);


ALTER TABLE "SOUND" ADD CONSTRAINT "FK_ALBUM_TO_SOUND_1" FOREIGN KEY (
	"A_NO"
)
REFERENCES "ALBUM" (
	"A_NO"
) ON DELETE CASCADE;

ALTER TABLE "SOUND" ADD CONSTRAINT "PK_SOUND" PRIMARY KEY (
	"S_NO",
	"A_NO"
);
ALTER TABLE "SOUND" ADD CONSTRAINT "FK_GENRE_TO_SOUND_1" FOREIGN KEY (
	"G_NO"
)
REFERENCES "GENRE" (
	"G_NO"
) ON DELETE CASCADE;

CREATE TABLE "AREA" (
	"AREA_CODE"	NUMBER		NOT NULL,
	"AREA_NAME"	VARCHAR2(20)		NOT NULL
);

ALTER TABLE "AREA" ADD CONSTRAINT "PK_AREA" PRIMARY KEY (
	"AREA_CODE"
);

--CREATE TABLE "PLAYINFO" (
--	"P_NO"	NUMBER		NOT NULL,
--	"S_NO"	NUMBER		NOT NULL,
--	"A_NO"	NUMBER		NOT NULL,
--	"M_ID"	VARCHAR2(10)		NOT NULL,
--	"AREA_CODE"	NUMBER		NOT NULL,
--	"P_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
--	"P_LOCATION"	VARCHAR2(30)	DEFAULT '종로구'	NOT NULL,
--	"SKY"	VARCHAR2(20)		NOT NULL,
--	"PTY"	VARCHAR2(20)		NOT NULL,
--	"TMP"	NUMBER		NOT NULL
--);

CREATE TABLE "PLAYINFO" (
	"P_NO"	NUMBER		NOT NULL,
	"S_NO"	NUMBER		NOT NULL,
	"A_NO"	NUMBER		NOT NULL,
	"M_ID"	VARCHAR2(10)		NOT NULL,
	"AREA_CODE"	NUMBER		NOT NULL,
	"P_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	 NULL,
	"SKY"	VARCHAR2(20)		 NULL,
	"PTY"	VARCHAR2(20)		 NULL,
	"TMP"	NUMBER		 NULL
);

COMMENT ON COLUMN "PLAYINFO"."P_DATE" IS '들은 시간';


ALTER TABLE "PLAYINFO" ADD CONSTRAINT "PK_PLAYINFO" PRIMARY KEY (
	"P_NO"
);
ALTER TABLE "PLAYINFO" ADD CONSTRAINT "FK_SOUND_TO_PLAYINFO" FOREIGN KEY (
	"S_NO",
	"A_NO"
)
REFERENCES "SOUND" (
	"S_NO",
	"A_NO"
) ON DELETE CASCADE;

ALTER TABLE "PLAYINFO" ADD CONSTRAINT "FK_MEMBER_TO_PLAYINFO_1" FOREIGN KEY (
	"M_ID"
)
REFERENCES "MEMBER" (
	"M_ID"
) ON DELETE CASCADE;

ALTER TABLE "PLAYINFO" ADD CONSTRAINT "FK_AREA_TO_PLAYINFO_1" FOREIGN KEY (
	"AREA_CODE"
)
REFERENCES "AREA" (
	"AREA_CODE"
) ON DELETE CASCADE;

CREATE TABLE "SOUND_LIKE" (
	"M_ID"	VARCHAR2(10)		NOT NULL,
	"S_NO"	NUMBER		NOT NULL,
	"A_NO"	NUMBER		NOT NULL
);

ALTER TABLE "SOUND_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_SOUND_LIKE_1" FOREIGN KEY (
	"M_ID"
)
REFERENCES "MEMBER" (
	"M_ID"
) ON DELETE CASCADE;

ALTER TABLE "SOUND_LIKE" ADD CONSTRAINT "FK_SOUND_TO_SOUND_LIKE" FOREIGN KEY (
	"S_NO",
	"A_NO"
)
REFERENCES "SOUND" (
	"S_NO",
	"A_NO"
) ON DELETE CASCADE;

--CREATE TABLE "SOUND_RECOMMENT" (
--	"S_R_NO"	NUMBER		NOT NULL,
--	"S_R_CONTENT"	VARCHAR2(300)		NOT NULL,
--	"S_R_WRITER"	VARCHAR2(30)		NOT NULL,
--	"S_R_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
--	"S_NO"	NUMBER		NOT NULL,
--	"A_NO"	NUMBER		NOT NULL,
--	"M_ID"	VARCHAR2(10)		NOT NULL
--);

CREATE TABLE "SOUND_RECOMMENT" (
	"S_R_NO"	NUMBER		NOT NULL,
	"S_R_CONTENT"	VARCHAR2(300)		 NULL,
	"S_R_WRITER"	VARCHAR2(30)		 NULL,
	"S_R_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	"S_NO"	NUMBER		NOT NULL,
	"A_NO"	NUMBER		NOT NULL,
	"M_ID"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "SOUND_RECOMMENT"."S_R_WRITER" IS 'MEMBER(M_NICKNAME)';

ALTER TABLE "SOUND_RECOMMENT" ADD CONSTRAINT "PK_SOUND_RECOMMENT" PRIMARY KEY (
	"S_R_NO"
);

ALTER TABLE "SOUND_RECOMMENT" ADD CONSTRAINT "FK_SOUND_TO_SOUND_RECOMMENT" FOREIGN KEY (
	"S_NO",
	"A_NO"
)
REFERENCES "SOUND" (
	"S_NO",
	"A_NO"
) ON DELETE CASCADE;

ALTER TABLE "SOUND_RECOMMENT" ADD CONSTRAINT "FK_MEMBER_TO_SOUND_RECOMMENT_1" FOREIGN KEY (
	"M_ID"
)
REFERENCES "MEMBER" (
	"M_ID"
) ON DELETE CASCADE;

CREATE TABLE "PLAYLIST_CONTENT" (
	"L_NO"	NUMBER		NOT NULL,
	"M_ID"	VARCHAR2(10)		NOT NULL,
	"S_NO"	NUMBER		NOT NULL,
	"A_NO"	NUMBER		NOT NULL
);

ALTER TABLE "PLAYLIST_CONTENT" ADD CONSTRAINT "FK_PLIST_TO_PLIST_CONTENT" FOREIGN KEY (
	"L_NO",
	"M_ID"
)
REFERENCES "PLAYLIST" (
	"L_NO",
	"M_ID"
) ON DELETE CASCADE;

ALTER TABLE "PLAYLIST_CONTENT" ADD CONSTRAINT "FK_SOUND_TO_PLAYLIST_CONTENT" FOREIGN KEY (
	"S_NO",
	"A_NO"
)
REFERENCES "SOUND" (
	"S_NO",
	"A_NO"
) ON DELETE CASCADE;


CREATE TABLE "SOUND_WRITER" (
	"S_NO"	NUMBER		NOT NULL,
	"A_NO"	NUMBER		NOT NULL,
	"ARTIST_NO"	NUMBER		NOT NULL
);

ALTER TABLE "SOUND_WRITER" ADD CONSTRAINT "FK_SOUND_TO_SOUND_WRITER" FOREIGN KEY (
	"S_NO",
	"A_NO"
)
REFERENCES "SOUND" (
	"S_NO",
	"A_NO"
) ON DELETE CASCADE;

ALTER TABLE "SOUND_WRITER" ADD CONSTRAINT "FK_ARTIST_TO_SOUND_WRITER_1" FOREIGN KEY (
	"ARTIST_NO"
)
REFERENCES "ARTIST" (
	"ARTIST_NO"
) ON DELETE CASCADE;

CREATE TABLE "SOUND_COMPOSER" (
	"S_NO"	NUMBER		NOT NULL,
	"A_NO"	NUMBER		NOT NULL,
	"ARTIST_NO"	NUMBER		NOT NULL
);

ALTER TABLE "SOUND_COMPOSER" ADD CONSTRAINT "FK_SOUND_TO_SOUND_COMPOSER" FOREIGN KEY (
	"S_NO",
	"A_NO"
)
REFERENCES "SOUND" (
	"S_NO",
	"A_NO"
) ON DELETE CASCADE;


ALTER TABLE "SOUND_COMPOSER" ADD CONSTRAINT "FK_ARTIST_TO_SOUND_COMPOSER_1" FOREIGN KEY (
	"ARTIST_NO"
)
REFERENCES "ARTIST" (
	"ARTIST_NO"
) ON DELETE CASCADE;

CREATE TABLE "SINGER" (
	"S_NO"	NUMBER		NOT NULL,
	"A_NO"	NUMBER		NOT NULL,
	"ARTIST_NO"	NUMBER		NOT NULL
);
ALTER TABLE "SINGER" ADD CONSTRAINT "FK_SOUND_TO_SINGER" FOREIGN KEY (
	"S_NO",
	"A_NO"
)
REFERENCES "SOUND" (
	"S_NO",
	"A_NO"
) ON DELETE CASCADE;

ALTER TABLE "SINGER" ADD CONSTRAINT "FK_ARTIST_TO_SINGER_1" FOREIGN KEY (
	"ARTIST_NO"
)
REFERENCES "ARTIST" (
	"ARTIST_NO"
) ON DELETE CASCADE;

CREATE TABLE "ARTIST_LIKE" (
	"ARTIST_NO"	NUMBER		NOT NULL,
	"M_ID"	VARCHAR2(10)		NOT NULL
);
ALTER TABLE "ARTIST_LIKE" ADD CONSTRAINT "FK_ARTIST_TO_ARTIST_LIKE_1" FOREIGN KEY (
	"ARTIST_NO"
)
REFERENCES "ARTIST" (
	"ARTIST_NO"
) ON DELETE CASCADE;

ALTER TABLE "ARTIST_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_ARTIST_LIKE_1" FOREIGN KEY (
	"M_ID"
)
REFERENCES "MEMBER" (
	"M_ID"
) ON DELETE CASCADE;