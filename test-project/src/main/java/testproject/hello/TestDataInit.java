package testproject.hello;

import javax.annotation.PostConstruct;

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

	@PostConstruct
	public void dataInit() {
		for(int i=0; i<5; i++) {
			Member member = new Member("user" + i, bCryptPasswordEncoder.encode("user" + i), "ROLE_USER");
			memberRepository.save(member);
		}
		
		for(int i=0; i<5; i++) {
			Member member = new Member("admin" + i, bCryptPasswordEncoder.encode("admin" + i), "ROLE_ADMIN");
			memberRepository.save(member);
		}
	}
}
