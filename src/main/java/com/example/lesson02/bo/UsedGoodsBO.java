package com.example.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.lesson02.dao.UsedGoodsDAO;
import com.example.lesson02.model.UsedGoods;

@Service
public class UsedGoodsBO {

	@Autowired	// new UsedGoodsDAO 같은 개념
	private UsedGoodsDAO usedGoodsDAO;	// DAO객체를 가져온다.
	
	// input: 없음
	// output: List<UsedGoods>
	public List<UsedGoods> getUsedGoodsList() {
		return usedGoodsDAO.selectUsedGoodsList();
	}
}
