package com.example.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.lesson03.bo.ReviewBO;
import com.example.lesson03.model.Review;

@RestController
public class Lesson03Ex01RestController {
	
	@Autowired
	private ReviewBO reviewBO;
	// 요청url: http://localhost/lesson03/ex01
	// 요청url: http://localhost/lesson03/ex01?id=5
	@RequestMapping("/lesson03/ex01")
	public Review ex01(
			@RequestParam("id") int id // 필수 파라미터	
			// @RequestParam(value="id") int id 	// 필수 파라미터
			// @RequestParam(value="id", required=true) int id	// 필수 파라미터
			// @RequestParam(value="id", required=false) Integer id // 비필수 파라미터 일때는 null이 허용되어야함 int말고 integer. 500에러 BO가 int값이라 에러 발생
			// @RequestParam(value="id", defaultValue="1") int id	// 비필수 파라미터, id값이 없으면 디폴트값 1로 지정
			
	) {
		return reviewBO.getReviewById(id);
	}
}
