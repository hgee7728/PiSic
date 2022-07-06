package kh.spring.pisic.chart.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.sound.domain.Sound;

@Repository
public class ChartDao {

	@Autowired
	private SqlSession session;
	
	public List<Sound> selectChartDetail(){
		return session.selectList("Chart.selectChartDetail");
	}
	
	public List<Sound> selectMainTopten(){
		return session.selectList("Chart.selectMainTopten");
	}
	public List<Sound> selectChartTopTen(String chartType, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("chartType", chartType);
		map.put("limit", limit);
		return session.selectList("Chart.selectChartTopTen", map);
	}

}
