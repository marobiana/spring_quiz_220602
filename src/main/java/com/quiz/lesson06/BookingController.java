package com.quiz.lesson06;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	// 3-1 목록 화면
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
	
	// 예약하기 화면
//	@RequestMapping("/reservation_view")
//	public String reservationView() {
//		return "lesson06/reservationView";
//	}
	
	// 예약하기 화면
	@RequestMapping("/reservation_view")
	public String reservationView() {
		return "lesson06/reservationView";
	}
	
	// AJAX 요청
	@ResponseBody
	@PostMapping("/add_booking")
	public Map<String, Object> addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		// insert into `booking` (필드) values ('2022-07-13')
		bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		result.put("result_code", 200);
		
		return result;
	}
	
	// 예약조회
	@RequestMapping("/main_view")
	public String main() {
		return "lesson06/mainView";
	}
	
	// AJAX 요청
	@ResponseBody
	@PostMapping("/get_booking")
	public Map<String, Object> getBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		// name, phoneNumber  디비 조회
		Booking booking = bookingBO.getLastBookingByNameAndPhoneNumber(name, phoneNumber);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		result.put("booking", booking);
		
		// {"result":"success", "booking":{"name":"OO"}}
		// {"result":"success", "booking":null}
		
		return result;
	}
}








