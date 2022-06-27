package kh.spring.pisic.faq.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class FaqBoard {
//	"FAQ_NO"	NUMBER		NOT NULL,
//	"FAQ_TITLE"	VARCHAR2(100)		NOT NULL,
//	"FAQ_CONTENT"	VARCHAR2(500)		NOT NULL,
//	"FAQ_CNT"	NUMBER	DEFAULT 0	NOT NULL,
//	"M_ID"	VARCHAR2(10)		NOT NULL,
//	"FAQ_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL
	
	private int faq_no;
	private String faq_title;
	private String faq_content;
	private int faq_cnt;
	private String m_id;
	private Timestamp faq_date;
	@Override
	public String toString() {
		return "FaqBoard [faq_no=" + faq_no + ", faq_title=" + faq_title + ", faq_content=" + faq_content + ", faq_cnt="
				+ faq_cnt + ", m_id=" + m_id + ", faq_date=" + faq_date + "]";
	}
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public int getFaq_cnt() {
		return faq_cnt;
	}
	public void setFaq_cnt(int faq_cnt) {
		this.faq_cnt = faq_cnt;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Timestamp getFaq_date() {
		return faq_date;
	}
	public void setFaq_date(Timestamp faq_date) {
		this.faq_date = faq_date;
	}
	
	
	
	

}
