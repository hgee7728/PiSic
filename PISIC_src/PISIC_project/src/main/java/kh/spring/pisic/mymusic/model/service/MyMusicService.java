package kh.spring.pisic.mymusic.model.service;

import java.util.List;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.sound.domain.Sound;

public interface MyMusicService {
	
	public List<MyMusic> selectPlaylist(String m_id);
	public int insertSound(List<Sound> soundList);
	public int deletePlaylist(List<MyMusic> mymusicList);
	public List<Sound> selectSoundRecent(String m_id);
	public List<Sound> selectSoundList(List<Sound> soundList);
	public int insertPlaylist(MyMusic mymusic, List<Sound> soundList);
}
