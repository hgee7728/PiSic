package kh.spring.pisic.mymusic.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.mymusic.model.dao.MyMusicDao;

@Service
public class MyMusicServiceImpl implements MyMusicService{

	@Autowired
	private MyMusicDao dao;
	
	@Override
	public List<MyMusic> selectPlaylistName(String m_id) {
		return dao.selectPlaylistName(m_id);
	}

}
