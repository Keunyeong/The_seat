package com.star.seat.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.star.seat.order.dto.OrderDto;
import com.star.seat.review.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired
	private SqlSession session;
	
	// sequence의 다음 숫자를 가져오는 method
	@Override
	public int getSequence() {
		return session.selectOne("getSequence");
	}
	
	// 작성한 리뷰 정보를 추가하는 method
	@Override
	public void addReview(ReviewDto dto) {
		session.insert("addReview", dto);	
	}
	
	// 해당 매장 리뷰 정보를 가져오는 method
	@Override
	public List<ReviewDto> getReviewList(ReviewDto dto) {
		return session.selectList("getReviewList", dto);
	}

	// 해당 DB번호의 리뷰 정보를 삭제하는 method
	@Override
	public void deleteReview(ReviewDto dto) {
		session.delete("deleteReview", dto);
	}
	
	// 해당 DB번호의 리뷰 정보를 가져오는 method
	@Override
	public ReviewDto getReviewData(ReviewDto dto) {
		return session.selectOne("getReviewData", dto);
	}
	
	// 해당 DB번호의 리뷰 정보를 수정하는 method
	@Override
	public void updateReview(ReviewDto dto) {
		session.update("updateReview", dto);	
	}
	
	// 해당 주문 번호에 해당하는 review 존재 여부를 조정하는 method
	@Override
	public void reviewExist(OrderDto dto) {
		session.update("reviewExist", dto);
	}
	
	// 해당 리뷰 번호로 되어있는 targetNum 정보가 있는지 여부를 알아내는 method
	@Override
	public ReviewDto getMyReview(ReviewDto dto) {
		
		return session.selectOne("getMyReview", dto);
	}
}
