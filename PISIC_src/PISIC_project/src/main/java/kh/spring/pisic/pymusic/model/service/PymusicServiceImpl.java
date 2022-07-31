package kh.spring.pisic.pymusic.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.pymusic.model.dao.PymusicDao;
import kh.spring.pisic.sound.domain.PlayInfo;
import kh.spring.pisic.sound.domain.Sound;

@Service
public class PymusicServiceImpl implements PymusicService{

	@Autowired
	private PymusicDao dao;

	@Override
	public List<Sound> selectPyArea(int area_code) {
		return dao.selectPyArea(area_code);
	}

	@Override
	public List<Sound> selectPyGenre(int g_no) {
		return dao.selectPyGenre(g_no);
	}

	@Override
	public List<Sound> selectPyAgender(String agender) {
		return dao.selectPyAgender(agender);
	}
	
	@Override
	public List<PlayInfo> selectPyWeather(HashMap<String, Object> weather) {
		return dao.selectPyWeather(weather);
	}
	
	@Override
	public List<Sound> selectPyTime(String p_date) {
		return dao.selectPyTime(p_date);
	}

}
