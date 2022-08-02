package kh.spring.pisic.mymusic.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.mymusic.domain.MyMusic;
import kh.spring.pisic.mymusic.model.dao.MyMusicDao;
import kh.spring.pisic.sound.domain.Artist;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.sound.model.dao.SoundDao;

@Service
public class MyMusicServiceImpl implements MyMusicService{

	@Autowired
	private MyMusicDao dao;
	@Autowired
	private SoundDao soundDao;
	
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
	
	// 플레이 리스트 만들기(담을 곡 들고 가기) - ajax
	@Override
	public List<Sound> selectSoundList(List<Sound> soundList){
		List<Sound> resultSoundList = new ArrayList<Sound>();
		for(int i = 0 ; i < soundList.size() ; i ++) {
			resultSoundList.add(dao.selectSoundList(soundList.get(i)));
		}
		return resultSoundList;
	}

	// 플레이 리스트 만들기 - ajax
	@Override
	public int insertPlaylist(MyMusic mymusic, List<Sound> soundList) {
		return dao.insertPlaylist(mymusic, soundList);
	}
	
	// 플레이 리스트에 담긴 곡 조회 - ajax
	@Override
	public List<Sound> selectPlaylistSound(MyMusic mymusic) {
		return dao.selectPlaylistSound(mymusic);
	}
	
	// 플레이 리스트에 담긴 곡 갯수 - ajax
	@Override
	public int totalCntPlaylistSound(MyMusic mymusic) {
		return dao.totalCntPlaylistSound(mymusic);
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

	// 내가 좋아하는 아티스트 목록
	@Override
	public List<Artist> selectArtistLikeList(String m_id) {
		return dao.selectArtistLikeList(m_id);
	}

	// 아티스트 좋아요 취소
	@Override
	public int deleteArtistLike(Artist artist) {
		return dao.deleteArtistLike(artist);
	}

	// 좋아하는 노래 목록
	@Override
	public List<Sound> selectSoundLikeList(String m_id) {
		return dao.selectSoundLikeList(m_id);
	}
	
	// 좋아하는 노래 총 갯수
	@Override
	public int selectSoundLikeTotalCnt(String m_id) {
		return dao.selectSoundLikeTotalCnt(m_id);
	}

	// 최근에 들은 노래 총 갯수
	@Override
	public int selectSoundRecentTotalCnt(String m_id) {
		return dao.selectSoundRecentTotalCnt(m_id);
	}

	// 플레이 리스트 정보 변경하기
	@Override
	@Transactional
	public int updatePlaylist(MyMusic mymusic, List<Sound> soundList) {
		
		// 기존에 담겨 있는 노래들 다 삭제
		dao.deletePlaylistSound(mymusic);
		
		// 새로 들고 온 노래 데이터 삽입
		dao.insertSound(soundList);
		
		// 새로 변경된 기본 정보 업데이트
		return dao.updatePlaylist(mymusic);
	}

	// 아티스트 좋아요 확인
	@Override
	public int checkArtistLike(Artist artist) {
		return dao.checkArtistLike(artist);
	}

	// 아티스트 좋아요
	@Override
	public int insertArtistLike(Artist artist) {
		return dao.insertArtistLike(artist);
	}

	// 현재 플레이 리스트 확인
	@Override
	public int checkPlaylist0(String m_id) {
		return dao.checkPlaylist0(m_id);
	}

	// 현재 플레이 리스트 만들기
	@Override
	public int insertPlaylist0(String m_id) {
		return dao.insertPlaylist0(m_id);
	}

	// 현재 플레이 리스트에서 노래 삭제
	@Override
	@Transactional
	public int deleteSoundPlaylist0(Sound sound) {
		
		// 0번 플레이리스트에서 삭제
		int result = dao.deleteSoundPlaylist0(sound);
		
		// 순서 다시 맞추기
		dao.updateSoundOrder(sound); 
		return result;
	}

	// 셔플 기능 작동하면 현재 플레이 리스트 순서 맞추기
	@Override
	@Transactional
	public List<Sound> insertPlaylist0Order(List<Sound> soundList, Member member) {
		
		// 현재 플레이 리스트 모두 삭제
		dao.deleteAllPlaylist0(member.getM_id());
		
		// 받아온 노래 데이터로 다시 현재 플레이 리스트에 삽입
		dao.insertSoundPlaylist0(soundList, member);
		
		// 삽입된 노래 정보 가져오기
		return soundDao.selectSoundList(member);
	}

	



}
