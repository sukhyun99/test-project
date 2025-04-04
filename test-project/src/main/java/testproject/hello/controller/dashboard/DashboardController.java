package testproject.hello.controller.dashboard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/dash")
public class DashboardController {
	
	@GetMapping
	public String dashboard() {
		log.info("go dashboard");
		
		return "dashboard/dashboard";
	}

}
