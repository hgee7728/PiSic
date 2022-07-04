package kh.spring.pisic.chart.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.pisic.sound.domain.Sound;

@Repository
public class ChartDao {

	@Autowired
	private SqlSession session;
	
	public List<Sound> selectChartMain(){
		return session.selectList("Chart.selectChartMain");
	}
}
