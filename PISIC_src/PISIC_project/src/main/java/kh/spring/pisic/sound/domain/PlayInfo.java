package kh.spring.pisic.sound.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class PlayInfo {
	
	private int p_no;
	private int s_no;
	private int a_no;
	private String m_id;
	private int area_code;
	private String area_name;
	private Timestamp p_date;
	private String sky;
	private String pty;
	private String tmp;
	
	private String s_name;
	private String a_name;
	private String s_age_yn;
	private String s_path;
	private int g_no;
	private String g_name;
	private List<Singer> singers;
	private int cnt_like;
	private int l_no;
	private String a_cover;
	
	private int chart;
	
	
	
	@Override
	public String toString() {
		return "PlayInfo [p_no=" + p_no + ", s_no=" + s_no + ", a_no=" + a_no + ", m_id=" + m_id + ", area_code="
				+ area_code + ", area_name=" + area_name + ", p_date=" + p_date + ", sky=" + sky + ", pty=" + pty
				+ ", tmp=" + tmp + ", s_name=" + s_name + ", a_name=" + a_name + ", s_age_yn=" + s_age_yn + ", s_path="
				+ s_path + ", g_no=" + g_no + ", g_name=" + g_name + ", singers=" + singers + ", cnt_like=" + cnt_like
				+ ", l_no=" + l_no + ", a_cover=" + a_cover + ", chart=" + chart + "]";
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
	public String getTmp() {
		return tmp;
	}
	public void setTmp(String tmp) {
		this.tmp = tmp;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}


	public String getS_name() {
		return s_name;
	}


	public void setS_name(String s_name) {
		this.s_name = s_name;
	}


	public String getA_name() {
		return a_name;
	}


	public void setA_name(String a_name) {
		this.a_name = a_name;
	}


	public String getS_age_yn() {
		return s_age_yn;
	}


	public void setS_age_yn(String s_age_yn) {
		this.s_age_yn = s_age_yn;
	}


	public String getS_path() {
		return s_path;
	}


	public void setS_path(String s_path) {
		this.s_path = s_path;
	}


	public int getG_no() {
		return g_no;
	}


	public void setG_no(int g_no) {
		this.g_no = g_no;
	}


	public String getG_name() {
		return g_name;
	}


	public void setG_name(String g_name) {
		this.g_name = g_name;
	}


	public List<Singer> getSingers() {
		return singers;
	}


	public void setSingers(List<Singer> singers) {
		this.singers = singers;
	}


	public int getCnt_like() {
		return cnt_like;
	}


	public void setCnt_like(int cnt_like) {
		this.cnt_like = cnt_like;
	}


	public int getL_no() {
		return l_no;
	}


	public void setL_no(int l_no) {
		this.l_no = l_no;
	}


	public String getA_cover() {
		return a_cover;
	}


	public void setA_cover(String a_cover) {
		this.a_cover = a_cover;
	}


	public int getChart() {
		return chart;
	}


	public void setChart(int chart) {
		this.chart = chart;
	}
	
	
}
