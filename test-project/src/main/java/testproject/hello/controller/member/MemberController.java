package testproject.hello.controller.member;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import testproject.hello.domain.Member;
import testproject.hello.service.member.MemberService;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

	private final MemberService memberService;

	public MemberController(MemberService memberService) {
		super();
		this.memberService = memberService;
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		ArrayList<Member> list = memberService.findAll();
		model.addAttribute("list", list);
		
		return "member/list";
	}
}
