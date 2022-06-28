package kh.spring.pisic.sound.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Sound;
import kh.spring.pisic.sound.model.dao.SoundDao;

@Service
public class SoundServiceImpl implements SoundService{

	@Autowired
	private SoundDao dao;
	
	@Override
	public Album selectAlbum(String a_no) {
		return dao.selectAlbum(a_no);
	}

	@Override
	public Sound selectSound(Sound sound) {
		return  dao.selectSound(sound);
	}

	@Override
	public List<Sound> selectSoundList(List<Sound> soundList) {
		return dao.selectSoundList(soundList);
	}

}
