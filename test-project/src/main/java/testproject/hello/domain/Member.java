package testproject.hello.domain;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Member implements Serializable {

	private static final long serialVersionUID = -2427890326629845900L;
	
	private Long id;
	private String username;
	private String password;
	private String role;
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", username=" + username + ", password=" + password + ", role=" + role + "]";
	}
	
}
