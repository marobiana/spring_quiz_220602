package com.quiz.lesson06;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson05")
@Controller
public class WeatherHistoryController {
	
	@RequestMapping("/weather_history_view")
	public String weatherHistoryView() {
		return "lesson05/weatherHistoryView";
	}
}
