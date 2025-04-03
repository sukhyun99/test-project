package testproject.hello.service;

import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import testproject.hello.domain.Member;
import testproject.hello.dto.CustomUserDetails;
import testproject.hello.repository.MemberRepository;

@Slf4j
@Service
public class CustomUserDetailService implements UserDetailsService {
	
	private final MemberRepository memberRepository;
	
	public CustomUserDetailService(MemberRepository memberRepository) {
		super();
		this.memberRepository = memberRepository;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("username: " + username);
		Optional<Member> optionalMember = memberRepository.findByLoginId(username);
		if (optionalMember.isEmpty()) {
			return null;
		}
		Member findMember = optionalMember.get();
		return new CustomUserDetails(findMember);
	}

}
