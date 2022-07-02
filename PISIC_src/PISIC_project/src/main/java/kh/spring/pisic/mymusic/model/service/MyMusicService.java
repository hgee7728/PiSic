package kh.spring.pisic.mymusic.model.service;

import java.util.List;

import kh.spring.pisic.mymusic.domain.MyMusic;

public interface MyMusicService {
	
	public List<MyMusic> selectPlaylistName(String m_id);
}
