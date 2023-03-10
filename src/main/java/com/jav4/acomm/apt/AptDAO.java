package com.jav4.acomm.apt;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jav4.acomm.apt.AptVO;

@Repository 
public class AptDAO implements AptDAOInter {
		
	@Autowired
	SqlSessionTemplate my;
	@Override
	public List<AptVO> readall(AptVO vo) {  //아파트 18000개의 데이터를 처리해서 가져올겁니다.
		return my.selectList("apt.all",vo); //mapper로 가서 값을 담아오자 namespace=apt 이고 id 값은 all)
	}
	
	@Override
	public List<AptVO> readcode(AptVO vo){ // 위에거와 실행로직은 동일!
		return my.selectList("apt.code",vo);
	}
	
	@Override
	public AptVO city(AptVO vo) { //로그인 시 세션 대신 모델로 도시 불러오기 위함
		return my.selectOne("apt.city", vo);
	}
}
