package kh.spring.pisic.pymusic.model.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import kh.spring.pisic.sound.domain.PlayInfo;
import kh.spring.pisic.sound.domain.Sound;

public interface PymusicService {

	public List<Sound> selectPyArea(int area_code);
	public List<Sound> selectPyGenre(int g_no);
	public List<Sound> selectPyAgender(String agender);
	public List<PlayInfo> selectPyWeather(HashMap<String, Object> weather);
	public List<Sound> selectPyTime(String p_date);
	
}
