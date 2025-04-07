package testproject.hello.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import testproject.hello.domain.Member;
import testproject.hello.dto.CustomUserDetails;
import testproject.hello.service.member.MemberService;

@Slf4j
@Service
public class CustomUserDetailService implements UserDetailsService {
	
	private final MemberService memberService;
	
	public CustomUserDetailService(MemberService memberService) {
		super();
		this.memberService = memberService;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("username: " + username);
//		Optional<Member> optionalMember = memberRepository.findByLoginId(username);
//		if (optionalMember.isEmpty()) {
//			return null;
//		}
//		Member findMember = optionalMember.get();
		Member findMember = memberService.findByName(username);
		log.info("findMember: " + findMember);
		return new CustomUserDetails(findMember);
	}

}
