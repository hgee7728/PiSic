package kh.spring.pisic.weather.controller;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.pisic.weather.util.Region;
import kh.spring.pisic.weather.util.WeatherData;


@Controller
@RequestMapping("/weather")
public class WeatherController {
	
	@GetMapping
	public String pageSearch() {
		return "weather/search";
	}
	 	

		@PostMapping(value="/{city}/{gu}", produces= "text/plain;charset=UTF-8")
		@ResponseBody
		public String searchWeather(
				@PathVariable(name ="city") String city, 
				@PathVariable(name ="gu") String gu
				) {
			// 입력한 지역의 경도, 위도 -> 행정구역코드 -> 격자 좌표 구할 클래스
			Region region = new Region();
			// 기상청 api를 통해 오늘의 날씨를 가져오는 클래스
			WeatherData wd = new WeatherData();
			// 결과를 model을 통해 view에 전달
			JSONObject jobj = null;
			try {
				jobj = wd.getWeatherData(region.lookUpRegion(city, gu));
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			System.out.println(jobj);
			
			//ajax 결과로 jsp에 전달할 값 없어요
			return "";
		}
		
		// 에러 페이지 처리
		@ExceptionHandler(Exception.class)
		public String handle404(Exception ex) {
			
			return "error";
		}
	
}
