package kh.spring.pisic.sound.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.pjboard.domain.PjBoard;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Sound;

@Repository
public class SoundDao {
	
	@Autowired
	private SqlSession session;
	
	// 앨범 상세조회
	public Album selectAlbum(String a_no) {
		return session.selectOne("Sound.selectAlbum",a_no);
	}

	// 곡 상세조회 - 곡정보
	public Sound selectSound(Sound sound) {
		return session.selectOne("Sound.selectSound",sound);
	}
	
	// 선택 재생
	public List<Sound> selectSoundList(List<Sound> soundList) {
		return session.selectList("Sound.selectSoundList",soundList);
	}
	
	// 노래 좋아요 - ajax
	public int insertLike(Member member, Sound sound) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("sound", sound);
		return session.insert("Sound.insertLike",map);
	}
	
	// 곡 상세조회 - 수록 앨범
	public Album selectSoundAlbum(Sound sound) {
		return session.selectOne("Sound.selectSoundAlbum",sound.getA_no());
	}
	
	// 노래 좋아요 여부 확인
	public int checkLike(Member member, Sound sound) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("sound", sound);
		return session.selectOne("Sound.checkLike",map);
	}
	
	// 노래 좋아요 취소
	public int deleteLike(Member member, Sound sound) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("sound", sound);
		return session.delete("Sound.deleteLike",map);
	}
	
	// 관련 아티스트 앨범
	public List<Album> selectRelArtistAlbum(Sound sound){
		return session.selectList("Sound.selectRelArtistAlbum",sound);
	}
	
	// 관련 플레이리스트 공유 게시판
	public List<PjBoard> selectRelPlaylistBoard(Sound sound) {
		return session.selectList("Sound.selectRelPlaylistBoard",sound);
	}
	
	
	
	
	
}
