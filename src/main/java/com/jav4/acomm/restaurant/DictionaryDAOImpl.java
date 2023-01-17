package com.jav4.acomm.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class DictionaryDAOImpl implements DictionaryDAO {

	@Autowired
	MongoTemplate mongoTemplate;

	@Override
	public DictionaryVO one(String word) {
		System.out.println(word);
		Query query = new Query(new Criteria("word").is(word));
		DictionaryVO vo =  mongoTemplate.findOne(query, DictionaryVO.class, "dictionary");
		System.out.println("dao    >> " + vo);
		return vo;
	}

}