package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class RealtorController {
	
	@Autowired
	private RealtorBO realtorBO;
	
	// http://localhost:8080/lesson04/quiz02/1
	@RequestMapping("/1")
	public String addRealtorView() {
		return "lesson04/addRealtorView";
	}
	
	// http://localhost/lesson04/quiz02/add_realtor
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) {
		
		// db insert => id key
		realtorBO.addRealtor(realtor);
		
		// db select
		realtor = realtorBO.getRealtorById(realtor.getId());
		
		// model 담고
		model.addAttribute("realtor", realtor);
		
		// return jsp
		return "lesson04/afterRealtorView";
	}
}
