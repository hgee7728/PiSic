package kh.spring.pisic.admin.model.service;

import java.util.List;

import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;

public interface AdminService {
	public List<Artist> selectArtistList();
	public Artist selectArtist(String artist_no);
	public List<Artist> selectArtistAjax(String keyword);
	public int insertArtist(Artist artist);
	public int updateArtist(Artist artist);
	public int deleteArtist(List<Artist> aritstList);
	public List<Album> selectAlbumList();
	public List<Album> selectSearchAlbumList(String keyword);
	public int insertAlbum(Album album);
	public Album selectAlbum(int a_no);
	public int updateAlbum(Album album);
	public int deleteAlbum(List<Album> albumList);
	public List<Sound> selectSoundList();
	public List<Sound> selectSearchSoundList(String keyword);
	public int insertSound(Sound sound, int[] singer_noArr, int[] writer_noArr, int[] composer_noArr);
	public Sound selectSound(Sound sound);
	public int updateSound(Sound sound, int[] singer_noArr, int[] writer_noArr, int[] composer_noArr);
	public int deleteSound(List<Sound> soundList);
}
