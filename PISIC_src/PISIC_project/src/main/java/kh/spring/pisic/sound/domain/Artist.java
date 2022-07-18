package kh.spring.pisic.sound.domain;

import org.springframework.stereotype.Component;

@Component
public class Artist {
	private int artist_no;
	private String artist_name;
	private String artist_nation;
	private String artist_company;
	private String artist_type;
	private String artist_group;
	private String artist_member;
	private String artist_profile;
	private String artist_info1;
	private String artist_info2;
	private String m_id;
	private int like_cnt;
	
	
	//검색 필터
	private String keyword;
	
	private String artist_profile_rename;
	


	@Override
	public String toString() {
		return "Artist [artist_no=" + artist_no + ", artist_name=" + artist_name + ", artist_nation=" + artist_nation
				+ ", artist_company=" + artist_company + ", artist_type=" + artist_type + ", artist_group="
				+ artist_group + ", artist_member=" + artist_member + ", artist_profile=" + artist_profile
				+ ", artist_info1=" + artist_info1 + ", artist_info2=" + artist_info2 + ", m_id=" + m_id + ", like_cnt="
				+ like_cnt + ", keyword=" + keyword + ", artist_profile_rename=" + artist_profile_rename + "]";
	}
	
	

	public int getArtist_no() {
		return artist_no;
	}

	public void setArtist_no(int artist_no) {
		this.artist_no = artist_no;
	}

	public String getArtist_name() {
		return artist_name;
	}

	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}

	public String getArtist_nation() {
		return artist_nation;
	}

	public void setArtist_nation(String artist_nation) {
		this.artist_nation = artist_nation;
	}

	public String getArtist_company() {
		return artist_company;
	}

	public void setArtist_company(String artist_company) {
		this.artist_company = artist_company;
	}

	public String getArtist_type() {
		return artist_type;
	}

	public void setArtist_type(String artist_type) {
		this.artist_type = artist_type;
	}

	public String getArtist_group() {
		return artist_group;
	}

	public void setArtist_group(String artist_group) {
		this.artist_group = artist_group;
	}

	public String getArtist_member() {
		return artist_member;
	}

	public void setArtist_member(String artist_member) {
		this.artist_member = artist_member;
	}

	public String getArtist_profile() {
		return artist_profile;
	}

	public void setArtist_profile(String artist_profile) {
		this.artist_profile = artist_profile;
	}

	public String getArtist_info1() {
		return artist_info1;
	}

	public void setArtist_info1(String artist_info1) {
		this.artist_info1 = artist_info1;
	}

	public String getArtist_info2() {
		return artist_info2;
	}

	public void setArtist_info2(String artist_info2) {
		this.artist_info2 = artist_info2;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}



	public String getArtist_profile_rename() {
		return artist_profile_rename;
	}

	public void setArtist_profile_rename(String artist_profile_rename) {
		this.artist_profile_rename = artist_profile_rename;
	}
	
	
}
