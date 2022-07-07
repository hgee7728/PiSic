package kh.spring.pisic.sound.domain;


import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class SoundRecomment {

	private int s_r_no;
	private String s_r_content;
	private String s_r_writer;
	private Timestamp s_r_date;
	private int s_no;
	private int a_no;
	private String m_id;
	
	private String m_profile;
	
	@Override
	public String toString() {
		return "SoundRecomment [s_r_no=" + s_r_no + ", s_r_content=" + s_r_content + ", s_r_writer=" + s_r_writer
				+ ", s_r_date=" + s_r_date + ", s_no=" + s_no + ", a_no=" + a_no + ", m_id=" + m_id + ", m_profile="
				+ m_profile + "]";
	}
	public int getS_r_no() {
		return s_r_no;
	}
	public void setS_r_no(int s_r_no) {
		this.s_r_no = s_r_no;
	}
	public String getS_r_content() {
		return s_r_content;
	}
	public void setS_r_content(String s_r_content) {
		this.s_r_content = s_r_content;
	}
	public String getS_r_writer() {
		return s_r_writer;
	}
	public void setS_r_writer(String s_r_writer) {
		this.s_r_writer = s_r_writer;
	}
	public Timestamp getS_r_date() {
		return s_r_date;
	}
	public void setS_r_date(Timestamp s_r_date) {
		this.s_r_date = s_r_date;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
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
