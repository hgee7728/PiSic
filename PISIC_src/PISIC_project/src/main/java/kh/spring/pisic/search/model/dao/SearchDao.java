package kh.spring.pisic.search.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Criteria;
import kh.spring.pisic.sound.domain.Sound;

@Repository
public class SearchDao {
	
	@Autowired
	private SqlSession session;
	
	// 곡 검색 - 요약
	public List<Sound> selectSearchSound(String keyword) {
		return session.selectList("Search.selectSearchSound", keyword);
	}
	
	// 앨범 검색 - 요약
	public List<Album> selectSearchAlbum(String keyword) {
		return session.selectList("Search.selectSearchAlbum", keyword);
	}
	
	// 아티스트 검색 - 요약
	public List<Artist> selectSearchArtist(String keyword) {
		return session.selectList("Search.selectSearchArtist", keyword);
	}
	
	// 플리 게시판 검색 - 요약
	public List<PjBoard> selectSearchBoard(String keyword) {
		return session.selectList("Search.selectSearchBoard", keyword);
	}
	
	// 곡 검색 - 전체 - 페이징
	public List<Sound> selectSearchSoundAll(String keyword, Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("cri", cri);
		return session.selectList("Search.selectSearchSoundAll", map);
	}
	
	// 곡 검색 - 전체 갯수
	public int totalCntSearchSound(String keyword) {
		return session.selectOne("Search.totalCntSearchSound", keyword);
	}

	// 앨범 검색 - 전체 - 페이징
	public List<Album> selectSearchAlbumAll(String keyword, Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("cri", cri);
		return session.selectList("Search.selectSearchAlbumAll", map);
	}
	
	// 앨범 검색 - 전체 갯수
	public int totalCntSearchAlbum(String keyword) {
		return session.selectOne("Search.totalCntSearchAlbum", keyword);
	}

	// 아티스트 검색 - 전체 - 페이징
	public List<Artist> selectSearchArtistAll(String keyword, Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("cri", cri);
		return session.selectList("Search.selectSearchArtistAll", map);
	}
	
	// 아티스트 검색 - 전체 갯수
	public int totalCntSearchArtist(String keyword) {
		return session.selectOne("Search.totalCntSearchArtist", keyword);
	}

	// 플리 게시판 검색 - 전체 - 페이징
	public List<PjBoard> selectSearchBoardAll(String keyword, Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("cri", cri);
		return session.selectList("Search.selectSearchBoardAll", map);
	}
	
	// 플리 게시판 검색 - 전체 갯수
	public int totalCntSearchBoard(String keyword) {
		return session.selectOne("Search.totalCntSearchBoard", keyword);
	}
	
	// 플레이 리스트 만들기 - 곡 검색
	public List<Sound> selectSearchSoundPlaylist(String keyword) {
		return session.selectList("Search.selectSearchSoundPlaylist", keyword);
	}
	
	// pjBoard 검색 - 검색된 총 갯수
	public int totalCntSearchBoardWithType(String keyword, int type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("type", type);
		return session.selectOne("Search.totalCntSearchBoardWithType", map);
	}

	// pjBoard 검색 - 페이징
	public List<PjBoard> selectSearchBoardWithType(String keyword, Criteria cri, int type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("cri", cri);
		map.put("type", type);
		return session.selectList("Search.selectSearchBoardWithType", map);
	}
}
