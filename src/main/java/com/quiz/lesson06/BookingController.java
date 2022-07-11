package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06/quiz03")
@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;

	@RequestMapping("/booking_list_view")
	public String bookingListView(Model model) {
		// db select
		List<Booking> bookingList = bookingBO.getBookingList();
		
		// model 
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/bookingListView";
	}
	
	// POST / GET       PUT DELETE      RESTFUL API
	// AJAX 통신
	@ResponseBody
	@DeleteMapping("/delete_booking")
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id) {
		
		// db delete
		bookingBO.deleteBookingById(id);
		
		// 성공 여부 map -> json
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	@RequestMapping("/reservation_view")
	public String reservationView() {
		return "lesson06/reservationView";
	}
}








