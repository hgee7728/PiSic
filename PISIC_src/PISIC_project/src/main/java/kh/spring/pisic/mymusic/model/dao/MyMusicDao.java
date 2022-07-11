package kh.spring.pisic.mymusic.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;

@Repository
public class MyMusicDao {
	@Autowired
	private SqlSession session;
	
	// 플레이 리스트 목록 조회 - ajax
	public List<MyMusic> selectPlaylist(String m_id) {
		return session.selectList("MyMusic.selectPlaylist", m_id);
	}
	
	// 플레이 리스트 상세조회
	public MyMusic selectPlaylistDetail(MyMusic mymusic) {
		return session.selectOne("MyMusic.selectPlaylistDetail", mymusic);
	}
		
	// 플레이 리스트에 노래 담기
	public int insertSound(List<Sound> soundList) {
		return session.insert("MyMusic.insertSound", soundList);
	}

	// 플레이 리스트 삭제
	public int deletePlaylist(List<MyMusic> mymusicList) {
		return session.delete("MyMusic.deletePlaylist", mymusicList);
	}
	
	// 플레이 리스트 만들기(담을 곡으로 옮기기) - ajax
	public List<Sound> selectSoundList(List<Sound> soundList){
		return session.selectList("MyMusic.selectSoundList", soundList);
	}
	
	// 플레이 리스트 만들기
	public int insertPlaylist(MyMusic mymusic, List<Sound> soundList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("MyMusic", mymusic);
		map.put("soundList", soundList);
		return session.insert("MyMusic.insertPlaylist", map);
	}
	
	// 플레이 리스트에 담긴 곡 조회 - ajax
	public List<Sound> selectPlaylistSound(MyMusic mymusic) {
		return session.selectList("MyMusic.selectPlaylistSound", mymusic);
	}

	// 최근 들은 곡 조회 - ajax
	public List<Sound> selectSoundRecent(String m_id) {
		return session.selectList("MyMusic.selectSoundRecent", m_id);
	}
	
	// 자주 들은 곡 조회 - ajax
	public List<Sound> selectSoundOften(String m_id) {
		return session.selectList("MyMusic.selectSoundOften", m_id);
	}
	
	// 좋아요 곡 조회 - ajax
	public List<Sound> selectSoundLike(String m_id) {
		return session.selectList("MyMusic.selectSoundLike", m_id);
	}
	
	// 내가 좋아하는 아티스트 목록
	public List<Artist> selectArtistLikeList(String m_id) {
		return session.selectList("MyMusic.selectArtistLikeList", m_id);
	}
	
	// 아티스트 좋아요 취소
	public int deleteArtistLike(Artist artist) {
		return session.delete("MyMusic.deleteArtistLike", artist);
	}
	
	// 좋아하는 노래 목록
	public List<Sound> selectSoundLikeList(String m_id) {
		return session.selectList("MyMusic.selectSoundLikeList", m_id);
	}
	
	// 좋아하는 노래 총 갯수
	public int selectSoundLikeTotalCnt(String m_id) {
		return session.selectOne("MyMusic.selectSoundLikeTotalCnt", m_id);
	}
	
	// 최근에 들은 노래 총 갯수
	public int selectSoundRecentTotalCnt(String m_id) {
		return session.selectOne("MyMusic.selectSoundRecentTotalCnt", m_id);
	}
	
	
}
