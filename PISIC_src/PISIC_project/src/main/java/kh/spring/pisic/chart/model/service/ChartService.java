package kh.spring.pisic.chart.model.service;

import java.util.List;

import kh.spring.pisic.sound.domain.Sound;

public interface ChartService {
	
	public List<Sound> selectChartTopTen(String chartType, int limit);
	

}
