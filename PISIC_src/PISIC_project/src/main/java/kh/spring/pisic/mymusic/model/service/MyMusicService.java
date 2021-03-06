package kh.spring.pisic.mymusic.model.service;

import java.util.List;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;

public interface MyMusicService {
	
	public List<MyMusic> selectPlaylist(String m_id);
	public int insertSound(List<Sound> soundList);
	public int deletePlaylist(List<MyMusic> mymusicList);
	public int updatePlaylist(MyMusic mymusic, List<Sound> soundList);
	public List<Sound> selectPlaylistSound(MyMusic mymusic);
	public int totalCntPlaylistSound(MyMusic mymusic);
	public List<Sound> selectSoundRecent(String m_id);
	public List<Sound> selectSoundOften(String m_id);
	public List<Sound> selectSoundLike(String m_id);
	public List<Sound> selectSoundList(List<Sound> soundList);
	public int insertPlaylist(MyMusic mymusic, List<Sound> soundList);
	public MyMusic selectPlaylistDetail(MyMusic mymusic);
	public List<Artist> selectArtistLikeList(String m_id);
	public int deleteArtistLike(Artist artist);
	public List<Sound> selectSoundLikeList(String m_id);
	public int selectSoundLikeTotalCnt(String m_id);
	public int selectSoundRecentTotalCnt(String m_id);
	public int checkArtistLike(Artist artist);
	public int insertArtistLike(Artist artist);
	public int checkPlaylist0(String m_id);
	public int insertPlaylist0(String m_id);
	public int deleteSoundPlaylist0(Sound sound);
	public List<Sound> insertPlaylist0Order(List<Sound> soundList, Member member);
	
}
