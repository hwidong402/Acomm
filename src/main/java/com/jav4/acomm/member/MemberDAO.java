package com.jav4.acomm.member;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.jav4.acomm.apt.AptVO;
@Component
public class MemberDAO implements MemberDAOInter {
    @Autowired
    SqlSessionTemplate my;
    @Override
	public MemberVO one(MemberVO vo) {
        return my.selectOne("member.one", vo);
    }
    //현재 내 정보값을 dao에서 부릅니다.
    // namespace= member // id=print
    @Override
	public MemberVO print(MemberVO vo) {
        return my.selectOne("member.print", vo);
    }
    //관리자가 회원정보를 볼 때 실행되는 all함수
    // namespace= member // id=all
    @Override
	public List<MemberVO> all(MemberVO vo) {
        return my.selectList("member.all", vo);
    }
    // 회원가입에 입력했던 정보를 insert로 넣음 return값 없음
    // namespace= member // id=create
    @Override
	public void insert(MemberVO vo) {
        my.insert("member.create", vo);
    }
    @Override
	public void delete(MemberVO vo) {
         my.delete("member.del", vo);
    }
    // 개인정보 수정할 때 실행되는 update문
    // namespace= member // id=up
    @Override
	public void update(MemberVO vo) {
        my.update("member.up", vo);
    }
    // 아이디와 비밀번호가 일치한 한 맴버에 대한 칼럼 모두 줌
    // namespace= member // id=login
    @Override
	public MemberVO login(MemberVO vo) {
        return my.selectOne("member.login", vo);
    }
    @Override
	public AptVO code2name(MemberVO vo) {
        return my.selectOne("member.code2name", vo);
    }
    // 아이디 중복검사하러 DB를 뒤져봅시다.
    @Override
	public MemberVO idck(MemberVO vo) {
        return my.selectOne("member.idck", vo);
    }
    // 닉네임 중복검사하러 DB를 뒤져봅시다.
    @Override
	public MemberVO nickck(MemberVO vo) {
    	return my.selectOne("member.nickck", vo);
    }
    @Override
	public int upstop(MemberVO vo) {
		return my.update("member.upstop", vo);
	}
}
