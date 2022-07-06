package com.quiz.lesson05;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/lesson05")
@Controller
public class WeatherHistoryController {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@RequestMapping("/weather_history_view")
	public String weatherHistoryView(Model model) {
		List<WeatherHistory> weatherHistoryList = weatherHistoryBO.getWeatherHistoryList();
		model.addAttribute("resultList", weatherHistoryList);
		return "lesson05/weatherHistoryView";
	}
	
	@RequestMapping("/add_weather_view")
	public String addWeatherView() {
		return "lesson05/addWeatherView";
	}
	
	@PostMapping("/add_weather")
	public String addWeather(
			@RequestParam("date") @DateTimeFormat(pattern = "yyyy-mm-dd") Date date,
			@RequestParam("weather") String weather,
			@RequestParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation, 
			@RequestParam("microDust") String microDust,
			@RequestParam("windSpeed") double windSpeed) {
		
		// insert db
		// bo -> dao -> query
		weatherHistoryBO.addWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);
		
		// redirect 날씨 목록 페이지
		return "redirect:/lesson05/weather_history_view";
	}
}




