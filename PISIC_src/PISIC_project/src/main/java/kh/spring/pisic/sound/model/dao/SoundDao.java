package kh.spring.pisic.sound.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.member.domain.Member;
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

	// 곡 상세조회
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
		map.put("memberVo", member);
		map.put("soundVo", sound);
		return session.insert("Sound.insertLike",map);
	}
}
