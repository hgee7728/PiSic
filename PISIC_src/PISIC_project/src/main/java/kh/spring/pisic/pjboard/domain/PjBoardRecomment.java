package kh.spring.pisic.pjboard.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;


@Component
public class PjBoardRecomment {
	private int r_no;
	private String r_content;
	private String r_writer;
	private Timestamp r_date;
	private int b_no;
	private String m_id;
	private String m_profile;
	
	
	@Override
	public String toString() {
		return "PjBoardRecomment [r_no=" + r_no + ", r_content=" + r_content + ", r_writer=" + r_writer + ", r_date="
				+ r_date + ", b_no=" + b_no + ", m_id=" + m_id + ", m_profile=" + m_profile + "]";
	}


	public int getR_no() {
		return r_no;
	}


	public void setR_no(int r_no) {
		this.r_no = r_no;
	}


	public String getR_content() {
		return r_content;
	}


	public void setR_content(String r_content) {
		this.r_content = r_content;
	}


	public String getR_writer() {
		return r_writer;
	}


	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}


	public Timestamp getR_date() {
		return r_date;
	}


	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
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


	public String getM_profile() {
		return m_profile;
	}


	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	
}
