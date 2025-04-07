package testproject.hello.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import testproject.hello.domain.Member;

@Mapper
public interface MemberMapper {

	public ArrayList<Member> findAll();
	
	public Member findById(Long id);

	public Member findByName(String username);
	
	public void save(Member member);
	
}
