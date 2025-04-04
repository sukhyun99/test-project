package testproject.hello.config;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;
import testproject.hello.dto.CustomUserDetails;

@Slf4j
@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.authorizeHttpRequests(auth -> auth.antMatchers("/", "/login", "/doLogin", "/css/**", "/img/**", "/ico/**", "/fonts/**", "/js/**").permitAll()
//											   .antMatchers("/admin").hasRole("ADMIN")
											   .anyRequest().authenticated()
											   );
		
		http.formLogin(form -> form.loginPage("/login")
								   .loginProcessingUrl("/doLogin").permitAll()
								   .successHandler(new AuthenticationSuccessHandler() {
									
									@Override
									public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
											Authentication authentication) throws IOException, ServletException {
										log.info("successHandler");
										
										SecurityContext context = SecurityContextHolder.getContext();
										log.info("isAuthenticated :{}", context.getAuthentication().isAuthenticated());
										log.info("getName :{}", context.getAuthentication().getName());
										Collection<? extends GrantedAuthority> authorities = context.getAuthentication().getAuthorities();
										for (GrantedAuthority grantedAuthority : authorities) {
											log.info("getAuthority :{}", grantedAuthority.getAuthority());
										}
										log.info("getDetails :{}", context.getAuthentication().getDetails().toString());
										CustomUserDetails principal = (CustomUserDetails) context.getAuthentication().getPrincipal();
										log.info("getPrincipal :{}", principal.getMember());
										
										response.sendRedirect("/dash");
									}
								})
								   );
		
//		http.authorizeHttpRequests(auth -> auth.anyRequest().permitAll());
		
		http.csrf(csrf -> csrf.disable());
		
		return http.build();
	}
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
