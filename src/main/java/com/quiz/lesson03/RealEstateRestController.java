package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RequestMapping("/lesson03")
@RestController
public class RealEstateRestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	// http://localhost:8080/lesson03/quiz01/1?id=20
	@RequestMapping("/quiz01/1")
	public RealEstate quiz01_1(
			@RequestParam("id") int id) {
		
		return realEstateBO.getRealEstateById(id);
	}
	
	// http://localhost:8080/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/quiz01/2")
	public List<RealEstate> quiz01_2(
			@RequestParam("rent_price") int rentPrice) {
		
		return realEstateBO.getRealEstateListByRentPrice(rentPrice);
	}
	
	// http://localhost:8080/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/quiz01/3")
	public List<RealEstate> quiz01_3(
			@RequestParam("area") int area,
			@RequestParam("price") int price) {
		
		return realEstateBO.getRealEstateListByAreaAndPrice(area, price);
	}
	
	// http://localhost:8080/lesson03/quiz02/1
	@RequestMapping("/quiz02/1")
	public String quiz02_1() {
//		realtorId : 3
//		address : 푸르지용 리버 303동 1104호
//		area : 89
//		type : 매매
//		price : 100000
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int row = realEstateBO.addRealEstate(realEstate);
		return "입력성공:" + row; 
	}
	
	// http://localhost:8080/lesson03/quiz02/2?realtor_id=5
	@RequestMapping("/quiz02/2")
	public String quiz02_2(
			@RequestParam("realtor_id") int realtorId) {
//      realtorId : ?
//		address : 썅떼빌리버 오피스텔 814호
//		area : 45
//		type : 월세
//		price : 100000
//		rentPrice : 120
		int row = realEstateBO.addRealEstateAsField(realtorId, "썅떼빌리버 오피스텔 814호", 
				45, "월세", 100000, 120);
		return "입력 성공:" + row;
	}
	
	// http://localhost:8080/lesson03/quiz03/1?id=8&type=전세&price=70000
	@RequestMapping("/quiz03/1")
	public String quiz03_1(
			@RequestParam("id") int id,
			@RequestParam("type") String type,
			@RequestParam("price") int price) {
		
		realEstateBO.updateRealEstateById(id, type, price);
		return "수정 성공";
	}
	
	// http://localhost:8080/lesson03/quiz04/1?id=21
	@RequestMapping("/quiz04/1")
	public String quiz04_1(
			@RequestParam("id") int id) {
		
		realEstateBO.deleteRealEstateById(id);
		return "삭제 성공";
	}
}





