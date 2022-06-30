package kh.spring.pisic.qna.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class QnaBoard {
	
//	"QNA_NO"	NUMBER		NOT NULL,
//	"QNA_TITLE"	VARCHAR2(100)		 NULL,
//	"QNA_CONTENT"	VARCHAR2(500)	 NULL,
//	"QNA_SECRET"	VARCHAR2(1) DEFAULT 'Y'		 NULL,
//	"M_ID"	VARCHAR2(10)		NOT NULL,
//	"QNA_DATE"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL
	
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String qna_secreat;
	private String m_id;
	private Date qna_date;
	private int orgin_no;
	private int gr_ord;
	private int gr_layer;
	@Override
	public String toString() {
		return "QnaBoard [qna_no=" + qna_no + ", qna_title=" + qna_title + ", qna_content=" + qna_content
				+ ", qna_secreat=" + qna_secreat + ", m_id=" + m_id + ", qna_date=" + qna_date + ", orgin_no="
				+ orgin_no + ", gr_ord=" + gr_ord + ", gr_layer=" + gr_layer + "]";
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_secreat() {
		return qna_secreat;
	}
	public void setQna_secreat(String qna_secreat) {
		this.qna_secreat = qna_secreat;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public int getOrgin_no() {
		return orgin_no;
	}
	public void setOrgin_no(int orgin_no) {
		this.orgin_no = orgin_no;
	}
	public int getGr_ord() {
		return gr_ord;
	}
	public void setGr_ord(int gr_ord) {
		this.gr_ord = gr_ord;
	}
	public int getGr_layer() {
		return gr_layer;
	}
	public void setGr_layer(int gr_layer) {
		this.gr_layer = gr_layer;
	}
	
	

}
