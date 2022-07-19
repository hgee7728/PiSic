package kh.spring.pisic.sound.domain;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;


@Component
public class Album {
	private int a_no;
	private String a_name;
	private String a_cover;
	private Date a_date;
	private String a_publishing;
	private String a_agency;
	private String a_introduce1;
	private String a_introduce2;
	private int artist_no;
	private List<Sound> sounds;
	
//	crawling-field
	private String artist_name;
	
	// 검색
	private String keyword;
	@Override
	public String toString() {
		return "Album [a_no=" + a_no + ", a_name=" + a_name + ", a_cover=" + a_cover + ", a_date=" + a_date
				+ ", a_publishing=" + a_publishing + ", a_agency=" + a_agency + ", a_introduce1=" + a_introduce1
				+ ", a_introduce2=" + a_introduce2 + ", artist_no=" + artist_no + ", sounds=" + sounds
				+ ", artist_name=" + artist_name + ", keyword=" + keyword + "]";
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

	public String getA_cover() {
		return a_cover;
	}

	public void setA_cover(String a_cover) {
		this.a_cover = a_cover;
	}

	public Date getA_date() {
		return a_date;
	}

	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}

	public String getA_publishing() {
		return a_publishing;
	}

	public void setA_publishing(String a_publishing) {
		this.a_publishing = a_publishing;
	}

	public String getA_agency() {
		return a_agency;
	}

	public void setA_agency(String a_agency) {
		this.a_agency = a_agency;
	}

	public String getA_introduce1() {
		return a_introduce1;
	}

	public void setA_introduce1(String a_introduce1) {
		this.a_introduce1 = a_introduce1;
	}

	public String getA_introduce2() {
		return a_introduce2;
	}

	public void setA_introduce2(String a_introduce2) {
		this.a_introduce2 = a_introduce2;
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


	public List<Sound> getSounds() {
		return sounds;
	}


	public void setSounds(List<Sound> sounds) {
		this.sounds = sounds;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	
}
