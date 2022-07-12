package com.quiz.lesson06.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;   

	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public void deleteBookingById(int id) {
		bookingDAO.deleteBookingById(id);
	}
	
	public void addBooking(String name, Date date, 
			int day, int headcount, String phoneNumber) {
		
		bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public Booking getLastBookingByNameAndPhoneNumber(String name, String phoneNumber) {
		List<Booking> bookingList = bookingDAO.selectBookingListByNameAndPhoneNumber(name, phoneNumber);
		
		if (bookingList.isEmpty()) {
			return null;
		}
		
		return bookingList.get(0);
	}
}






