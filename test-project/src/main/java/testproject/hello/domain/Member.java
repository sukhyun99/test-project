package testproject.hello.domain;

import java.io.Serializable;

import lombok.Getter;

@Getter
public class Member implements Serializable {

	private static final long serialVersionUID = -2427890326629845900L;
	
	private Long id;
	private String username;
	private String password;
	private String role;
	
	public Member() {
	}
	
	public Member(String username, String password, String role) {
		this.username = username;
		this.password = password;
		this.role = role;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", username=" + username + ", password=" + password + ", role=" + role + "]";
	}
	
}
