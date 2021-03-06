package kh.spring.pisic.chart.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.chart.model.service.ChartService;

@Controller
@RequestMapping("/chart")
public class ChartController {
	@Autowired
	private ChartService service;

	@GetMapping(value = {"/", "/chartMain"})
	public ModelAndView MainPage(ModelAndView mv) {
	
		mv.addObject("chartTopten", service.selectChartTopTen("top", 3));
		mv.addObject("monthlyTopten", service.selectChartTopTen("monthly", 3));
		mv.addObject("weeklyTopten", service.selectChartTopTen("weekly", 3));
		mv.addObject("dailyTopten", service.selectChartTopTen("daily", 3));
		mv.addObject("likeTopten", service.selectChartTopTen("like", 3));

		mv.setViewName("chart/chartMain");

		return mv;
	}

	@GetMapping("/chartDetail")
	public ModelAndView DetailPage(ModelAndView mv, Model model, String chartType) {

		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 기준");
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("chartDetail", service.selectChartTopTen(chartType, 10));
		mv.addObject("chartType" ,chartType);

		model.addAttribute("serverTime", formattedDate);
		mv.setViewName("chart/chartDetail");

		return mv;
	}

}
