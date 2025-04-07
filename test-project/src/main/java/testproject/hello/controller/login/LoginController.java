package testproject.hello.controller.login;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import testproject.hello.service.login.LoginService;

@Slf4j
@Controller
@RequestMapping("/login")
public class LoginController {
	
	@GetMapping
	public String login() {
		log.info("Login Page");
		
		SecurityContext context = SecurityContextHolder.getContext();
		log.info("isAuthenticated :{}", context.getAuthentication().isAuthenticated());
		log.info("getName :{}", context.getAuthentication().getName());
		
		return "login/login";
	}
	
}
