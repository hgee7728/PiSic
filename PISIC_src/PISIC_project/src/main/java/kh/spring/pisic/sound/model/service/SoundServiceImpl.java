package kh.spring.pisic.sound.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.member.domain.Member;
import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.sound.model.dao.SoundDao;

@Service
public class SoundServiceImpl implements SoundService{

	@Autowired
	private SoundDao dao;
	
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
	public List<Sound> selectSoundList(List<Sound> soundList) {
		return dao.selectSoundList(soundList);
	}
	// 노래 좋아요 - ajax
	@Override
	public int insertLike(Member member, Sound sound) {
		return dao.insertLike(member,sound);
	}
	// 곡 상세조회 - 수록 앨범
	@Override
	public Album selectSoundAlbum(Sound sound) {
		return dao.selectSoundAlbum(sound);
	}
	// 좋아요 여부 확인
	@Override
	public int checkLike(Member member, Sound sound) {
		return dao.checkLike(member,sound);
	}
	// 좋아요 취소
	@Override
	public int deleteLike(Member member, Sound sound) {
		return dao.deleteLike(member,sound);
	}

}
