package kh.spring.pisic.mymusic.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.mymusic.model.dao.MyMusicDao;
import kh.spring.pisic.sound.domain.Sound;

@Service
public class MyMusicServiceImpl implements MyMusicService{

	@Autowired
	private MyMusicDao dao;
	
	// 플레이 리스트 목록 조회
	@Override
	public List<MyMusic> selectPlaylist(String m_id) {
		return dao.selectPlaylist(m_id);
	}
	
	// 플레이 리스트 상세조회
	@Override
	public MyMusic selectPlaylistDetail(MyMusic mymusic) {
		return dao.selectPlaylistDetail(mymusic);
	}
	
	// 플레이 리스트에 노래 담기
	@Override
	public int insertSound(List<Sound> soundList) {
		return dao.insertSound(soundList);
	}

	// 플레이 리스트 삭제
	@Override
	public int deletePlaylist(List<MyMusic> mymusicList) {
		return dao.deletePlaylist(mymusicList);
	}
	
	// 플레이 리스트 만들기(담을 곡으로 옮기기) - ajax
	@Override
	public List<Sound> selectSoundList(List<Sound> soundList){
		return dao.selectSoundList(soundList);
	}

	// 플레이 리스트 만들기 - ajax
	@Override
	//@Transactional
	public int insertPlaylist(MyMusic mymusic, List<Sound> soundList) {
		//dao.insertSound(soundList);
		return dao.insertPlaylist(mymusic, soundList);
	}
	
	// 플레이 리스트에 담긴 곡 조회 - ajax
	@Override
	public List<Sound> selectPlaylistSound(MyMusic mymusic) {
		return dao.selectPlaylistSound(mymusic);
	}
	
	// 최근 들은 곡 조회 - ajax
	@Override
	public List<Sound> selectSoundRecent(String m_id) {
		return dao.selectSoundRecent(m_id);
	}

	// 자주 들은 곡 조회 - ajax
	@Override
	public List<Sound> selectSoundOften(String m_id) {
		return dao.selectSoundOften(m_id);
	}

	// 좋아요 곡 조회 - ajax
	@Override
	public List<Sound> selectSoundLike(String m_id) {
		return dao.selectSoundLike(m_id);
	}



}
