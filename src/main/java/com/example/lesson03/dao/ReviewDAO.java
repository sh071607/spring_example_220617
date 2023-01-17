package com.example.lesson03.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.lesson03.model.Review;

@Repository
public interface ReviewDAO {
	
	public Review selectReviewById(int id);
	
	public int insertReview(Review review); // review 객체의 내용을 row(record)로 추가, 객체가 여러개면 @Param 사용
	
	public int insertReviewAsField(
			@Param("storeId") int storeId, 
			@Param("menu") String menu, 
			@Param("userName") String userName, 
			@Param("point") Double point, 
			@Param("review") String review // 여러 파라미터들을 row로 추가
		);
	
	public int updateReviewById(
			@Param("id") int id, 
			@Param("review") String review111);
	
	public void deleteReviewById(int id); // 파라미터 갯수가 1개라 맵으로 묶을 필요없음 @Param 어노테이션 필요없음
}
