package kh.spring.pisic.mymusic.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.mymusic.domain.MyMusic;

@Repository
public class MyMusicDao {
	@Autowired
	private SqlSession session;
	
	public List<MyMusic> selectPlaylistName(String m_id) {
		return session.selectList("MyMusic.selectPlaylistName",m_id);
	}
	

}
