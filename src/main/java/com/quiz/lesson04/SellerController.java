package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;

	// http://localhost:8080/lesson04/quiz01/1
	@RequestMapping("/1")
	public String addSellerView() {
		return "lesson04/addSeller";   // 판매자 추가 jsp
	}
	
	// http://localhost:8080/lesson04/quiz01/add_seller
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		// db params insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		// jsp => response
		return "lesson04/afterAddSeller";
	}
	
	// http://localhost:8080/lesson04/quiz01/seller_info
	// http://localhost:8080/lesson04/quiz01/seller_info?id=5
	@RequestMapping("/seller_info")
	public String sellerInfo(
			@RequestParam(value="id", required=false) Integer id,
			Model model) {
		
		Seller seller = null;
		if (id == null) {
			seller = sellerBO.getLastSeller();
		} else {
			seller = sellerBO.getSellerById(id);
		}
		model.addAttribute("seller", seller);
		
		return "lesson04/sellerInfo";
	}
}






