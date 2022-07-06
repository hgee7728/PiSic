package kh.spring.pisic.sound.model.service;

import java.util.List;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Sound;

public interface SoundService {
	
	public Album selectAlbum(String a_no);
	public Sound selectSound(Sound sound);
	public List<Sound> selectSoundList(List<Sound> soundList);
	public int insertLike(Member member, Sound sound);
	public Album selectSoundAlbum(Sound sound);
	public int checkLike(Member member, Sound sound);
	public int deleteLike(Member member, Sound sound);
	public List<Album> selectRelArtistAlbum(Sound sound);
	public List<PjBoard> selectRelPlaylistBoard(Sound sound);
	
}
