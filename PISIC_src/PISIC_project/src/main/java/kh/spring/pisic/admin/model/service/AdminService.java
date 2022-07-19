package kh.spring.pisic.admin.model.service;

import java.util.List;

import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;

public interface AdminService {
	public List<Artist> selectArtistList();
	public Artist selectArtist(String artist_no);
	public List<Artist> selectArtistAjax(String keyword);
	public int insertArtist(Artist artist);
	public int updateArtist(Artist artist);
	public int deleteArtist(String artist_no);
	public List<Album> selectAlbumList();
	public List<Album> selectSearchAlbumList(String keyword);
	public int insertAlbum(Album album);
}
