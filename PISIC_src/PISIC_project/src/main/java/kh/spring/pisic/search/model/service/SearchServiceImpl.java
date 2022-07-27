package kh.spring.pisic.search.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.search.model.dao.SearchDao;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Criteria;
import kh.spring.pisic.sound.domain.Sound;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	private SearchDao dao;
	
	// 곡 검색 - 요약
	@Override
	public List<Sound> selectSearchSound(String keyword) {
		return dao.selectSearchSound(keyword);
	}
	
	// 앨범 검색 - 요약
	@Override
	public List<Album> selectSearchAlbum(String keyword) {
		return dao.selectSearchAlbum(keyword);
	}
	
	// 아티스트 검색 - 요약
	@Override
	public List<Artist> selectSearchArtist(String keyword) {
		return dao.selectSearchArtist(keyword);
	}
	
	// 플리 게시판 검색 - 요약
	@Override
	public List<PjBoard> selectSearchBoard(String keyword) {
		return dao.selectSearchBoard(keyword);
	}

	// 곡 검색 - 전체 - 페이징
	@Override
	public List<Sound> selectSearchSoundAll(String keyword, Criteria cri) {
		return dao.selectSearchSoundAll(keyword, cri);
	}
	
	// 곡 검색 - 전체 갯수
	@Override
	public int totalCntSearchSound(String keyword) {
		return dao.totalCntSearchSound(keyword);
	}

	// 앨범 검색 - 전체 - 페이징
	@Override
	public List<Album> selectSearchAlbumAll(String keyword, Criteria cri) {
		return dao.selectSearchAlbumAll(keyword, cri);
	}
	
	// 앨범 검색 - 전체 갯수
	@Override
	public int totalCntSearchAlbum(String keyword) {
		return dao.totalCntSearchAlbum(keyword);
	}
	
	// 아티스트 검색 - 전체 - 페이징
	@Override
	public List<Artist> selectSearchArtistAll(String keyword, Criteria cri) {
		return dao.selectSearchArtistAll(keyword, cri);
	}
	
	// 아티스트 검색 - 전체 갯수
	@Override
	public int totalCntSearchArtist(String keyword) {
		return dao.totalCntSearchArtist(keyword);
	}
	
	// 플리 게시판 검색 - 전체 - 페이징
	@Override
	public List<PjBoard> selectSearchBoardAll(String keyword, Criteria cri) {
		return dao.selectSearchBoardAll(keyword, cri);
	}

	// 플리 게시판 검색 - 전체 갯수
	@Override
	public int totalCntSearchBoard(String keyword) {
		return dao.totalCntSearchBoard(keyword);
	}

	// 플레이 리스트 만들기 - 곡 검색
	@Override
	public List<Sound> selectSearchSoundPlaylist(String keyword) {
		return dao.selectSearchSoundPlaylist(keyword);
	}
}
