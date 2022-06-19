package kh.spring.pisic.sound.domain;

import org.springframework.stereotype.Component;

@Component
public class AssociationAS {
	private int s_no;
	private int a_no;
	private int artist_no;
	
//	crawling-field
	private String s_name;
	private String a_name;
	private String artist_name;
	
	
	@Override
	public String toString() {
		return "Singer [s_no=" + s_no + ", a_no=" + a_no + ", artist_no=" + artist_no + "]";
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

	public int getArtist_no() {
		return artist_no;
	}

	public void setArtist_no(int artist_no) {
		this.artist_no = artist_no;
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

	public String getArtist_name() {
		return artist_name;
	}

	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}
	
}
