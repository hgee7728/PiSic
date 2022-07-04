package kh.spring.pisic.chart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.pisic.chart.model.dao.ChartDao;
import kh.spring.pisic.sound.domain.Sound;

@Service
public class ChartServiceImpl implements ChartService{
	@Autowired
	private ChartDao dao;

	@Override
	public List<Sound> selectChartMain() {
		return dao.selectChartMain();
	}

	@Override
	public List<Sound> selectMainTopten() {
		return dao.selectMainTopten();
	}

}
