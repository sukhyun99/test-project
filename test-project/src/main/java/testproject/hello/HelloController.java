package testproject.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HelloController {

	@GetMapping("/")
	public String main() {
		log.info("redirect to login");
		return "redirect:/login";
	}
}
