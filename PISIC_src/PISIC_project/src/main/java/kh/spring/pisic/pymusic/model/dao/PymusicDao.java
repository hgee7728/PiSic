package kh.spring.pisic.pymusic.model.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.sound.domain.Sound;

@Repository
public class PymusicDao {
	@Autowired
	private SqlSession session;
	
	public List<Sound> selectPyArea(int area_code) {
		return session.selectList("Pymusic.selectPyArea", area_code);
	}
	
	public List<Sound> selectPyGenre(int g_no) {
		return session.selectList("Pymusic.selectPyGenre", g_no);
	}
	
	public List<Sound> selectPyAgender(String agender) {
		return session.selectList("Pymusic.selectPyAgender", agender);
	}
	
	public List<Sound> selectPyWeather(String weather){
		return session.selectList("Pymusic.selectPyWeather", weather);
	}

	public List<Sound> selectPyTime(String p_date) {
		return session.selectList("Pymusic.selectPyTime", p_date);
	}
}
