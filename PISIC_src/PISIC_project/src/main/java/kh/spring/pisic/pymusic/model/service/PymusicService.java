package kh.spring.pisic.pymusic.model.service;

import java.util.List;

import kh.spring.pisic.sound.domain.Sound;

public interface PymusicService {

	public List<Sound> selectPyArea(int area_code);
	public List<Sound> selectPyGenre(int g_no);
	public List<Sound> selectPyAgender(String agender);
	
	
}
