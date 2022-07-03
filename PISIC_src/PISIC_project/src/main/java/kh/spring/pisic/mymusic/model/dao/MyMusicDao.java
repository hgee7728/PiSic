package kh.spring.pisic.mymusic.model.dao;

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

}
