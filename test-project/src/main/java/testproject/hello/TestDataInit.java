package testproject.hello;

import java.util.Date;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import testproject.hello.domain.Member;
import testproject.hello.domain.Menu;
import testproject.hello.repository.MemberRepository;
import testproject.hello.service.member.MemberService;
import testproject.hello.service.menu.MenuService;

@Slf4j
@Component
public class TestDataInit {

	private final MemberRepository memberRepository;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	private final MemberService memberService;
	private final MenuService menuService;

	public TestDataInit(MemberRepository memberRepository, BCryptPasswordEncoder bCryptPasswordEncoder, MemberService memberService, MenuService menuService) {
		super();
		this.memberRepository = memberRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
		this.memberService = memberService;
		this.menuService = menuService;
	}

//	@PostConstruct
	public void dataInit_member() {
		for(int i=0; i<5; i++) {
			Member member = new Member("user" + i, bCryptPasswordEncoder.encode("user" + i), "ROLE_USER");
			Member saveMember = memberRepository.save(member);
			log.info("saveMember: {}",  saveMember);
			memberService.save(saveMember);
		}

		for(int i=0; i<5; i++) {
			Member member = new Member("admin" + i, bCryptPasswordEncoder.encode("admin" + i), "ROLE_ADMIN");
			Member saveMember = memberRepository.save(member);
			log.info("saveMember: {}",  saveMember);
			memberService.save(saveMember);
		}
	}

//	@PostConstruct
	public void dataInit_menu() {
		String uuid = UUID.randomUUID().toString();
		Menu menu = new Menu(uuid, "정회원", "0", null, "root", "/menu", new Date(), "system");
		menuService.save(menu);
	}

}
