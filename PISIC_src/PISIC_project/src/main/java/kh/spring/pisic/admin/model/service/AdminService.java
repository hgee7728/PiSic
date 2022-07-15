package kh.spring.pisic.admin.model.service;

import java.util.List;

import kh.spring.pisic.sound.domain.Artist;

public interface AdminService {
	public List<Artist> selectArtistList();
	public Artist selectArtist(String artist_no);
	public List<Artist> selectArtistAjax(String keyword);
}
