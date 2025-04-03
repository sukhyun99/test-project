package testproject.hello.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//		http.authorizeHttpRequests(auth -> auth.antMatchers("/", "/login", "/doLogin").permitAll()
//											   .antMatchers("/admin").hasRole("ADMIN")
//											   .anyRequest().authenticated()
//											   );
//		
//		http.formLogin(form -> form.loginPage("/login")
//								   .loginProcessingUrl("/doLogin").permitAll()
//								   );
		
		http.authorizeHttpRequests(auth -> auth.anyRequest().permitAll());
		
		http.csrf(csrf -> csrf.disable());
		
		return http.build();
	}
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
