package kh.spring.pisic.sound.model.service;

import java.util.List;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.sound.domain.SoundRecomment;

public interface SoundService {
	
	public Album selectAlbum(String a_no);
	public Sound selectSound(Sound sound);
	public Artist selectArtist(String artist_no);
	public List<Album> selectArtistJoinAlbum(String artist_no);
	public List<Sound> selectArtistJoinSound(String artist_no);
	public List<Sound> selectSoundList(List<Sound> soundList);
	public int insertLike(Member member, Sound sound);
	public Album selectSoundAlbum(Sound sound);
	public int checkLike(Member member, Sound sound);
	public int deleteLike(Member member, Sound sound);
	public List<Album> selectRelArtistAlbum(Sound sound);
	public List<PjBoard> selectRelPlaylistBoard(Sound sound);
	public String selectSoundFirstDay(Member member, Sound sound);
	public int selectTotalListen(Member member, Sound sound);
	public int insertSoundRecomment(Member member, SoundRecomment soundRecomment);
	public int deleteSoundRecomment(Member member, SoundRecomment soundRecomment);
	
}
