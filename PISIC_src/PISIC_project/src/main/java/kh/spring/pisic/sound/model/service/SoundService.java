package kh.spring.pisic.sound.model.service;

import kh.spring.pisic.sound.domain.Album;
import kh.spring.pisic.sound.domain.Sound;

public interface SoundService {
	
	public Album selectAlbum(String a_no);
	public String selectSound(Sound sound);
	
}
