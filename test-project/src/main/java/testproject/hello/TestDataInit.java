package testproject.hello;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import testproject.hello.domain.Member;
import testproject.hello.repository.MemberRepository;

@Slf4j
@Component
public class TestDataInit {

	private final MemberRepository memberRepository;
	private final BCryptPasswordEncoder bCryptPasswordEncoder; 

	public TestDataInit(MemberRepository memberRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
		super();
		this.memberRepository = memberRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}

	public void dataInit() {
		for(int i=0; i<5; i++) {
			Member member = new Member();
			member.setUsername("user" + i);
			member.setPassword(bCryptPasswordEncoder.encode("user" + i));
			member.setRole("ROLE_USER");
			memberRepository.save(member);
		}
		
		for(int i=0; i<5; i++) {
			Member member = new Member();
			member.setUsername("admin" + i);
			member.setPassword(bCryptPasswordEncoder.encode("admin" + i));
			member.setRole("ROLE_ADMIN");
			memberRepository.save(member);
		}
	}
}
