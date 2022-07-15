package kh.spring.pisic.sound.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.mymusic.model.dao.MyMusicDao;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.sound.domain.SoundRecomment;
import kh.spring.pisic.sound.model.dao.SoundDao;

@Service
public class SoundServiceImpl implements SoundService{

	@Autowired
	private SoundDao dao;
	
	@Autowired
	private MyMusicDao daoMyMusic;
	
	// 앨범 상세조회
	@Override
	public Album selectAlbum(String a_no) {
		return dao.selectAlbum(a_no);
	}
	// 곡 상세조회 - 곡정보
	@Override
	public Sound selectSound(Sound sound) {
		return  dao.selectSound(sound);
	}
	// 선택 재생
	@Override
	@Transactional
	public List<Sound> selectSoundList(List<Sound> soundList, Member member) {
		// 0번 플레이 리스트가 있는지 확인
		if(daoMyMusic.checkPlaylist0(member.getM_id()) == 0) { // 없다면
			daoMyMusic.insertPlaylist0(member.getM_id());
		} 
		
		daoMyMusic.insertSoundPlaylist0(soundList);
		return dao.selectSoundList(member);
	}
	// 노래 좋아요 - ajax
	@Override
	public int insertLike(Member member, Sound sound) {
		return dao.insertLike(member, sound);
	}
	// 곡 상세조회 - 수록 앨범
	@Override
	public Album selectSoundAlbum(Sound sound) {
		return dao.selectSoundAlbum(sound);
	}
	// 좋아요 여부 확인
	@Override
	public int checkLike(Member member, Sound sound) {
		return dao.checkLike(member, sound);
	}
	// 좋아요 취소
	@Override
	public int deleteLike(Member member, Sound sound) {
		return dao.deleteLike(member, sound);
	}
	// 관련 아티스트 앨범
	@Override
	public List<Album> selectRelArtistAlbum(Sound sound) {
		return dao.selectRelArtistAlbum(sound);
	}
	// 관련 플레이리스트 공유 게시판 
	@Override
	public List<PjBoard> selectRelPlaylistBoard(Sound sound) {
		return dao.selectRelPlaylistBoard(sound);
	}
	// 내가 처음 들은 날
	@Override
	public String selectSoundFirstDay(Member member, Sound sound) {
		return dao.selectSoundFirstDay(member, sound);
	}
	// 총 감상 횟수
	@Override
	public int selectTotalListen(Member member, Sound sound) {
		return dao.selectTotalListen(member, sound);
	}
	// 노래 댓글 쓰기 - ajax
	@Override
	public int insertSoundRecomment(Member member, SoundRecomment soundRecomment) {
		return dao.insertSoundRecomment(member, soundRecomment);
	}
	// 노래 댓글 삭제 - ajax
	@Override
	public int deleteSoundRecomment(Member member, SoundRecomment soundRecomment) {
		return dao.deleteSoundRecomment(member, soundRecomment);
	}
	// 아티스트 상세조회
	@Override
	public Artist selectArtist(String artist_no) {
		return dao.selectArtist(artist_no);
	}
	// 아티스트 참여앨범
	@Override
	public List<Album> selectArtistJoinAlbum(String artist_no) {
		return dao.selectArtistJoinAlbum(artist_no);
	}
	// 아티스트 참여곡
	@Override
	public List<Sound> selectArtistJoinSound(String artist_no) {
		return dao.selectArtistJoinSound(artist_no);
	}
	
	// 데일리 감상자수 
	@Override
	public String selectDailyListen(Sound sound) {
		return dao.selectDailyListen(sound);
	}
	
	// 어제의 차트 순위
	@Override
	public String selectYesterChart(Sound sound) {
		return dao.selectYesterChart(sound);
	}


}
