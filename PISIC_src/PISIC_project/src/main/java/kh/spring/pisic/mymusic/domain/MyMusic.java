package kh.spring.pisic.mymusic.domain;

import java.util.List;

import org.springframework.stereotype.Component;

import kh.spring.pisic.sound.domain.Sound;

@Component
public class MyMusic {
	private int l_no;
	private String m_id;
	private String l_name;
	private String l_private_yn;
	private String l_image;
	private List<Sound> sounds;
	private int sound_cnt;
	private int s_no;
	private int a_no;
	private String a_name;
	private String m_nickname;
	@Override
	public String toString() {
		return "MyMusic [l_no=" + l_no + ", m_id=" + m_id + ", l_name=" + l_name + ", l_private_yn=" + l_private_yn
				+ ", l_image=" + l_image + ", sounds=" + sounds + ", sound_cnt=" + sound_cnt + ", s_no=" + s_no
				+ ", a_no=" + a_no + ", a_name=" + a_name + ", m_nickname=" + m_nickname + "]";
	}
	public int getL_no() {
		return l_no;
	}
	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getL_private_yn() {
		return l_private_yn;
	}
	public void setL_private_yn(String l_private_yn) {
		this.l_private_yn = l_private_yn;
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
	public int getSound_cnt() {
		return sound_cnt;
	}
	public void setSound_cnt(int sound_cnt) {
		this.sound_cnt = sound_cnt;
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
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	
	
	
}
