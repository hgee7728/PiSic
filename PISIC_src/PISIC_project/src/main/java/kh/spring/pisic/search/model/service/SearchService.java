package kh.spring.pisic.search.model.service;

import java.util.List;

import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Criteria;
import kh.spring.pisic.sound.domain.Sound;

public interface SearchService {

	public List<Sound> selectSearchSound(String keyword);
	public List<Album> selectSearchAlbum(String keyword);
	public List<Artist> selectSearchArtist(String keyword);
	public List<PjBoard> selectSearchBoard(String keyword);
	public List<Sound> selectSearchSoundAll(String keyword, Criteria cri);
	public int totalCntSearchSound(String keyword);
	public List<Album> selectSearchAlbumAll(String keyword, Criteria cri);
	public int totalCntSearchAlbum(String keyword);
	public List<Artist> selectSearchArtistAll(String keyword, Criteria cri);
	public int totalCntSearchArtist(String keyword);
	public List<PjBoard> selectSearchBoardAll(String keyword, Criteria cri);
	public int totalCntSearchBoard(String keyword);
	public List<Sound> selectSearchSoundPlaylist(String keyword);
	
}
