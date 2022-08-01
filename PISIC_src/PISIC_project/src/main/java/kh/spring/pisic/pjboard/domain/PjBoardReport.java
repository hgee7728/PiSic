package kh.spring.pisic.pjboard.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class PjBoardReport {
//	B_R_NO      NOT NULL NUMBER        
//	B_R_CONTENT          VARCHAR2(500) 
//	B_R_WRITER           VARCHAR2(30)  
//	B_R_DATE             TIMESTAMP(6)  
//	B_NO                 NUMBER        
//	M_ID        NOT NULL VARCHAR2(10) 
	
	private int b_r_no;
	private String b_r_content;
	private String b_r_writer;
	private Timestamp b_r_date;
	private int b_no;
	private String m_id;
	
	
	@Override
	public String toString() {
		return "PjBoardReport [b_r_no=" + b_r_no + ", b_r_content=" + b_r_content + ", b_r_writer=" + b_r_writer
				+ ", b_r_date=" + b_r_date + ", b_no=" + b_no + ", m_id=" + m_id + "]";
	}
	public int getB_r_no() {
		return b_r_no;
	}
	public void setB_r_no(int b_r_no) {
		this.b_r_no = b_r_no;
	}
	public String getB_r_content() {
		return b_r_content;
	}
	public void setB_r_content(String b_r_content) {
		this.b_r_content = b_r_content;
	}
	public String getB_r_writer() {
		return b_r_writer;
	}
	public void setB_r_writer(String b_r_writer) {
		this.b_r_writer = b_r_writer;
	}
	public Timestamp getB_r_date() {
		return b_r_date;
	}
	public void setB_r_date(Timestamp b_r_date) {
		this.b_r_date = b_r_date;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
}
