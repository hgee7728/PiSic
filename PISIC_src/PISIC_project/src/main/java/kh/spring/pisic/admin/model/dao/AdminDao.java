package kh.spring.pisic.admin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession session;
	
	public List<Artist> selectArtistList() {
		return session.selectList("Admin.selectArtistList");
	}
	
	public Artist selectArtist(String artist_no) {
		return session.selectOne("Admin.selectArtist", artist_no);
	}
	
	public List<Artist> selectArtistAjax(String keyword) {
		return session.selectList("Admin.selectSearchArtist", keyword);
	}
	
	public int insertArtist(Artist artist) {
		return session.insert("Admin.insertArtist", artist);
	}

	public int updateArtist(Artist artist) {
		return session.update("Admin.updateArtist", artist);
	}
	
	public int deleteArtist(List<Artist> aritstList) {
		return session.delete("Admin.deleteArtist", aritstList);
	}
	
	// 앨범 목록 조회
	public List<Album> selectAlbumList() {
		return session.selectList("Admin.selectAlbumList");
	}
	
	// 앨범 검색
	public List<Album> selectSearchAlbumList(String keyword) {
		return session.selectList("Admin.selectSearchAlbumList", keyword);
	}

	// 앨범 추가하기
	public int insertAlbum(Album album) {
		return session.insert("Admin.insertAlbum", album);
	}

	// 앨범 수정하기 - 앨범 조회
	public Album selectAlbum(int a_no) {
		return session.selectOne("Admin.selectAlbum", a_no);
	}
	
	// 앨범 정보 수정
	public int updateAlbum(Album album) {
		return session.update("Admin.updateAlbum", album);
	}
	
	// 앨범 삭제
	public int deleteAlbum(List<Album> albumList) {
		return session.delete("Admin.deleteAlbum", albumList);
	}
	
	// 곡 목록 조회
	public List<Sound> selectSoundList() {
		return session.selectList("Admin.selectSoundList");
	}
	
	// 곡 검색
	public List<Sound> selectSearchSoundList(String keyword) {
		return session.selectList("Admin.selectSearchSoundList", keyword);
	}
	
	// 곡 추가
	public int insertSound(Sound sound, int[] singer_noArr, int[] writer_noArr, int[] composer_noArr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sound", sound);
		map.put("singers", singer_noArr);
		map.put("writers", writer_noArr);
		map.put("composers", composer_noArr);
		return session.insert("Admin.insertSound", map);
	}

	// 곡 수정하기 - 곡 조회
	public Sound selectSound(Sound sound) {
		return session.selectOne("Admin.selectSound", sound);
	}
	
	// 곡 수정하기 - 가수 삭제
	public int deleteSinger(Sound sound) {
		return session.delete("Admin.deleteSinger", sound);
	}
	
	// 곡 수정하기 - 가수 삽입
	public int insertSinger(Sound sound, int[] singer_noArr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sound", sound);
		map.put("singers", singer_noArr);
		return session.delete("Admin.insertSinger", map);
	}
	
	// 곡 수정하기 - 작사가 삭제
	public int deleteWriter(Sound sound) {
		return session.delete("Admin.deleteWriter", sound);
	}
	
	// 곡 수정하기 - 작사가 삽입
	public int insertWriter(Sound sound, int[] writer_noArr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sound", sound);
		map.put("writers", writer_noArr);
		return session.delete("Admin.insertWriter", map);
	}
	
	// 곡 수정하기 - 작곡가 삭제
	public int deleteComposer(Sound sound) {
		return session.delete("Admin.deleteComposer", sound);
	}
	
	// 곡 수정하기 - 작곡가 삽입
	public int insertComposer(Sound sound, int[] composer_noArr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sound", sound);
		map.put("composers", composer_noArr);
		return session.delete("Admin.insertComposer", map);
	}
	
	// 앨범 정보 수정
	public int updateSound(Sound sound) {
		return session.update("Admin.updateSound", sound);
	}
}
