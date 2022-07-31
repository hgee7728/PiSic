package kh.spring.pisic.pymusic.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.pisic.pymusic.model.service.PymusicService;
import kh.spring.pisic.weather.util.Region;
import kh.spring.pisic.weather.util.WeatherData;

@Controller
@RequestMapping("/pymusic")
public class PymusicController {
	@Autowired
	private PymusicService service;
	
	@GetMapping(value = {"/", "/pymusicMain"})
	public String mainPage() {
		return "pymusic/pymusicMain";
	}

	@GetMapping("/area")
	public ModelAndView PyAreaPage (ModelAndView mv, Model model, int area_code) {
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 기준");
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("pyArea", service.selectPyArea(area_code));
		mv.setViewName("pymusic/area");
		model.addAttribute("serverTime", formattedDate);

		return mv;
		
	}
	
	@GetMapping("/genre")
	public ModelAndView PyGenrePage (ModelAndView mv, Model model, int g_no) {
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 기준");
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("pyGenre", service.selectPyGenre(g_no));
		mv.setViewName("pymusic/genre");
		model.addAttribute("serverTime", formattedDate);

		return mv;
		
	}
	
	@GetMapping("/agender")
	public ModelAndView PyAgenderPage (ModelAndView mv, Model model, String agender) {
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 기준");
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("pyAgender", service.selectPyAgender(agender));
		mv.addObject("agender", agender);
		mv.setViewName("pymusic/agender");
		model.addAttribute("serverTime", formattedDate);

		return mv;
		
	}
	
	@GetMapping("/weather")
	public ModelAndView selectPyWeather (ModelAndView mv, Model model
			,@RequestParam(name="sky",required = false) String sky
			,@RequestParam(name="pty",required = false) String pty
			,@RequestParam(name="currentLat",required = false) String currentLat
			,@RequestParam(name="currentLon",required = false) String currentLon
			) {
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 기준");
		String formattedDate = dateFormat.format(date);
		String nowTemperature = "";
		mv.addObject("serverTime", formattedDate);

		HashMap<String, Object> map = new HashMap<>();
		map.put("sky", sky);
		map.put("pty", pty);
		mv.addObject("PyWeather", service.selectPyWeather(map));
		mv.addObject("sky", sky);
		mv.addObject("pty", pty);

		
		// 입력한 지역의 경도, 위도 -> 행정구역코드 -> 격자 좌표 구할 클래스
		Region region = new Region();
		// 기상청 api를 통해 오늘의 날씨를 가져오는 클래스
		WeatherData wd = new WeatherData();
		// 결과를 model을 통해 view에 전달
		JSONObject jobWeather = null;  // 날씨 정보
		JSONObject jsonAddress = null; // 주소 정보
		try {
			jsonAddress = region.lookUpAddress(currentLat, currentLon);
			// 주소로 행정 코드(h_code) 찾는 메서드(카카오 api 사용)
			String hcode = region.lookUpHCode(jsonAddress.get("address_name").toString());
			jobWeather = wd.getWeatherData(region.getGridXY(hcode));   
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		System.out.println("[[[[[[[[[[[[[[[[[[[jobWeather"+jobWeather);
		System.out.println("[[[[[[[[[[[[[[[[[[[[[[[[jsonAddress"+jsonAddress);
		nowTemperature= (String)jobWeather.get("Temperature");
		System.out.println("여기여기여기....----------------"+nowTemperature);
		mv.addObject("nowlocation", jsonAddress.get("region_2depth_name").toString());
		
		mv.addObject("nowtemperature", nowTemperature);
		
		mv.addObject("nowsky", sky);
		mv.addObject("nowpty", pty);

		mv.setViewName("pymusic/weather");
		return mv;
		
	}
	
	@GetMapping("/time")
	public ModelAndView selectPyTime (ModelAndView mv, Model model, String p_date) {
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 기준");
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("PyTime", service.selectPyTime(p_date));
		mv.addObject("p_date", p_date);
		mv.setViewName("pymusic/time");
		model.addAttribute("serverTime", formattedDate);

		return mv;
		
	}
	



}
