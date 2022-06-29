package kh.spring.pisic.sound.domain;

import java.util.List;

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
	private List<String> artist_names;
	private List<String> sound_writers;
	private List<String> sound_composers;
	private int cnt_like;
	
	private String a_cover;
	
	
//	crawling-field
	private String a_name;
	private String g_name;
	
	@Override
	public String toString() {
		return "Sound [s_no=" + s_no + ", a_no=" + a_no + ", s_name=" + s_name + ", s_lyrics1=" + s_lyrics1
				+ ", s_lyrics2=" + s_lyrics2 + ", s_age_yn=" + s_age_yn + ", s_path=" + s_path + ", g_no=" + g_no
				+ ", artist_names=" + artist_names + ", sound_writers=" + sound_writers + ", sound_composers="
				+ sound_composers + ", cnt_like=" + cnt_like + ", a_cover=" + a_cover + ", a_name=" + a_name
				+ ", g_name=" + g_name + "]";
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

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getA_cover() {
		return a_cover;
	}

	public void setA_cover(String a_cover) {
		this.a_cover = a_cover;
	}

	public List<String> getArtist_names() {
		return artist_names;
	}

	public void setArtist_names(List<String> artist_names) {
		this.artist_names = artist_names;
	}

	public List<String> getSound_writers() {
		return sound_writers;
	}

	public void setSound_writers(List<String> sound_writers) {
		this.sound_writers = sound_writers;
	}

	public List<String> getSound_composers() {
		return sound_composers;
	}

	public void setSound_composers(List<String> sound_composers) {
		this.sound_composers = sound_composers;
	}

	public int getCnt_like() {
		return cnt_like;
	}

	public void setCnt_like(int cnt_like) {
		this.cnt_like = cnt_like;
	}

	
	
}
