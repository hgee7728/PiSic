package kh.spring.pisic.admin.model.dao;

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
	
	public int deleteArtist(String artist_no) {
		return session.delete("Admin.deleteArtist", artist_no);
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

	
}
