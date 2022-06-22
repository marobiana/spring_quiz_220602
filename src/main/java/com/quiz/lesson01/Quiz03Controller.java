package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Quiz03Controller {

	// http://localhost:8080/lesson01/quiz03/1
	@RequestMapping("/lesson01/quiz03/1")
	public String quiz03_1() {
		//    /WEB-INF/jsp/lesson01/quiz03.jsp
		//    /WEB-INF/jsp/   lesson01/quiz03    .jsp
		return "lesson01/quiz03";
	}
}




