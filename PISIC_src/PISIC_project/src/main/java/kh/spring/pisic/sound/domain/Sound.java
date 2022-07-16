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
	private List<Singer> singers;
	private List<Writer> sound_writers;
	private List<Composer> sound_composers;
	private int cnt_like;
	private int l_no;
	private String m_id;
	private int s_order;
	private String a_cover;
	private List<SoundRecomment> soundRecomment;
	
	private int chart;
	private List<PlayInfo> playInfo;
	
	//	crawling-field
	private String a_name;
	private String g_name;
	
	@Override
	public String toString() {
		return "Sound [s_no=" + s_no + ", a_no=" + a_no + ", s_name=" + s_name + ", s_lyrics1=" + s_lyrics1
				+ ", s_lyrics2=" + s_lyrics2 + ", s_age_yn=" + s_age_yn + ", s_path=" + s_path + ", g_no=" + g_no
				+ ", singers=" + singers + ", sound_writers=" + sound_writers + ", sound_composers=" + sound_composers
				+ ", cnt_like=" + cnt_like + ", l_no=" + l_no + ", m_id=" + m_id + ", s_order=" + s_order + ", a_cover="
				+ a_cover + ", soundRecomment=" + soundRecomment + ", chart=" + chart + ", playInfo=" + playInfo
				+ ", a_name=" + a_name + ", g_name=" + g_name + "]";
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
	public List<Singer> getSingers() {
		return singers;
	}
	public void setSingers(List<Singer> singers) {
		this.singers = singers;
	}
	public List<Writer> getSound_writers() {
		return sound_writers;
	}
	public void setSound_writers(List<Writer> sound_writers) {
		this.sound_writers = sound_writers;
	}
	public List<Composer> getSound_composers() {
		return sound_composers;
	}
	public void setSound_composers(List<Composer> sound_composers) {
		this.sound_composers = sound_composers;
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
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getS_order() {
		return s_order;
	}
	public void setS_order(int s_order) {
		this.s_order = s_order;
	}
	public String getA_cover() {
		return a_cover;
	}
	public void setA_cover(String a_cover) {
		this.a_cover = a_cover;
	}
	public List<SoundRecomment> getSoundRecomment() {
		return soundRecomment;
	}
	public void setSoundRecomment(List<SoundRecomment> soundRecomment) {
		this.soundRecomment = soundRecomment;
	}
	public int getChart() {
		return chart;
	}
	public void setChart(int chart) {
		this.chart = chart;
	}
	public List<PlayInfo> getPlayInfo() {
		return playInfo;
	}
	public void setPlayInfo(List<PlayInfo> playInfo) {
		this.playInfo = playInfo;
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
	
	
	
}