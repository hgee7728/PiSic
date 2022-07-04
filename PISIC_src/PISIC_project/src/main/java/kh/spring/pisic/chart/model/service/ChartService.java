package kh.spring.pisic.chart.model.service;

import java.util.List;

import kh.spring.pisic.sound.domain.Sound;

public interface ChartService {
	public List<Sound> selectChartMain();
	
	public List<Sound> selectMainTopten();

}
