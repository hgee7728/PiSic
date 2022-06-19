package kh.spring.pisic.sound.domain;

import org.springframework.stereotype.Component;

@Component
public class Sound {
	private int s_no;
	private int a_no;
	private String s_name;
	private String s_lyrics1;
	private String s_lyrics2;
	private String s_age_yn;
	private String s_path;
	private int g_no;
	
	@Override
	public String toString() {
		return "Sound [s_no=" + s_no + ", a_no=" + a_no + ", s_name=" + s_name + ", s_lyrics1=" + s_lyrics1
				+ ", s_lyrics2=" + s_lyrics2 + ", s_age_yn=" + s_age_yn + ", s_path=" + s_path + ", g_no=" + g_no + "]";
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

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_lyrics1() {
		return s_lyrics1;
	}

	public void setS_lyrics1(String s_lyrics1) {
		this.s_lyrics1 = s_lyrics1;
	}

	public String getS_lyrics2() {
		return s_lyrics2;
	}

	public void setS_lyrics2(String s_lyrics2) {
		this.s_lyrics2 = s_lyrics2;
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
}
