package kh.spring.pisic.mymusic.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.sound.domain.Sound;

@Repository
public class MyMusicDao {
	@Autowired
	private SqlSession session;
	
	// 플레이 리스트 목록 조회 - ajax
	public List<MyMusic> selectPlaylist(String m_id) {
		return session.selectList("MyMusic.selectPlaylist",m_id);
	}
	
	// 플레이 리스트에 노래 담기
	public int insertSound(List<Sound> soundList) {
		return session.insert("MyMusic.insertSound",soundList);
	}

	// 플레이 리스트 삭제
	public int deletePlaylist(List<MyMusic> mymusicList) {
		return session.delete("MyMusic.deletePlaylist", mymusicList);
	}
	
	// 최근 들은 곡 조회
	public List<Sound> selectSoundRecent(String m_id) {
		return session.selectList("MyMusic.selectSoundRecent",m_id);
	}
}
