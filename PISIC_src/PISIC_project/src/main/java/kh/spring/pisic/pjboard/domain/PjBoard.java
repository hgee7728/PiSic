package kh.spring.pisic.pjboard.domain;

import java.sql.Timestamp;
import java.util.List;

import kh.spring.pisic.sound.domain.Sound;

public class PjBoard {
//	B_NO      NOT NULL NUMBER        
//	B_TITLE            VARCHAR2(100) 
//	B_CONTENT          VARCHAR2(500) 
//	B_WRITER           VARCHAR2(30)  
//	B_DATE             TIMESTAMP(6)  
//	B_CNT              NUMBER        
//	L_NO      NOT NULL NUMBER        
//	M_ID      NOT NULL VARCHAR2(10)  

	private int b_no;
	private String b_title;
	private String b_content;
	private String b_writer;
	private int b_cnt;
	private String m_id;
	private Timestamp b_date;
	private String l_no;
	private String l_image;	
	private List<Sound> sounds;
	private int cnt_like;
	
	
	@Override
	public String toString() {
		return "PjBoard [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", b_writer=" + b_writer
				+ ", b_cnt=" + b_cnt + ", m_id=" + m_id + ", b_date=" + b_date + ", l_no=" + l_no + ", l_image="
				+ l_image + ", sounds=" + sounds + ", cnt_like=" + cnt_like + "]";
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public int getB_cnt() {
		return b_cnt;
	}
	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Timestamp getB_date() {
		return b_date;
	}
	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}
	public String getL_no() {
		return l_no;
	}
	public void setL_no(String l_no) {
		this.l_no = l_no;
	}
	public String getL_image() {
		return l_image;
	}
	public void setL_image(String l_image) {
		this.l_image = l_image;
	}
	public List<Sound> getSounds() {
		return sounds;
	}
	public void setSounds(List<Sound> sounds) {
		this.sounds = sounds;
	}
	public int getCnt_like() {
		return cnt_like;
	}
	public void setCnt_like(int cnt_like) {
		this.cnt_like = cnt_like;
	}
	
	
}
