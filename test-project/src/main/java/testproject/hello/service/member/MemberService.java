package testproject.hello.service.member;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import testproject.hello.domain.Member;
import testproject.hello.mapper.MemberMapper;

@Slf4j
@Service
public class MemberService {

	private final MemberMapper memberMapper;

	public MemberService(MemberMapper memberMapper) {
		super();
		this.memberMapper = memberMapper;
	}
	
	public ArrayList<Member> findAll() {
		return memberMapper.findAll();
	}
	
	public Member findById(Long id) {
		return memberMapper.findById(id);
	}
	
	public Member findByName(String username) {
		return memberMapper.findByName(username);
	}
	
	public void save(Member member) {
		memberMapper.save(member);
	}
	
}
