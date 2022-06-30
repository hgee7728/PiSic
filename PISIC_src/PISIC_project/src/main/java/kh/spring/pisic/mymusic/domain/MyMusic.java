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
	
	@Override
	public String toString() {
		return "MyMusic [l_no=" + l_no + ", m_id=" + m_id + ", l_name=" + l_name + ", l_private_yn=" + l_private_yn
				+ ", l_image=" + l_image + ", sounds=" + sounds + "]";
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
	
	
}
