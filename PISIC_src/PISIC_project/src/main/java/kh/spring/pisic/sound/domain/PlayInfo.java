package kh.spring.pisic.sound.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class PlayInfo {

	private int p_no;
	private int s_no;
	private int a_no;
	private String m_id;
	private int area_code;
	private Timestamp p_date;
	private String sky;
	private String pty;
	private int tmp;
	
	private String area_name;
	
	
	@Override
	public String toString() {
		return "PlayInfo [p_no=" + p_no + ", s_no=" + s_no + ", a_no=" + a_no + ", m_id=" + m_id + ", area_code="
				+ area_code + ", p_date=" + p_date + ", sky=" + sky + ", pty=" + pty + ", tmp=" + tmp + ", area_name="
				+ area_name + "]";
	}
	
	
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
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
	public int getArea_code() {
		return area_code;
	}
	public void setArea_code(int area_code) {
		this.area_code = area_code;
	}
	public Timestamp getP_date() {
		return p_date;
	}
	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}
	public String getSky() {
		return sky;
	}
	public void setSky(String sky) {
		this.sky = sky;
	}
	public String getPty() {
		return pty;
	}
	public void setPty(String pty) {
		this.pty = pty;
	}
	public int getTmp() {
		return tmp;
	}
	public void setTmp(int tmp) {
		this.tmp = tmp;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	
	
}
