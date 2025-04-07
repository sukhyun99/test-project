package testproject.hello.domain;

import java.util.Date;

import lombok.Getter;

@Getter
public class Menu {

	private String menuId;
	private String menuName;
	private String menuCode;
	private String menuAuth;
	private String menuUpperCode;
	private String menuPath;
	private Date createDatetime;
	private String createUser;
	private Date updateDatetime;
	private String updateUser;

	public Menu() {
		// TODO Auto-generated constructor stub
	}

	public Menu(String menuId, String menuName, String menuCode, String menuAuth, String menuUpperCode, String menuPath, Date createDatetime, String createUser) {
		super();
		this.menuId = menuId;
		this.menuName = menuName;
		this.menuCode = menuCode;
		this.menuAuth = menuAuth;
		this.menuUpperCode = menuUpperCode;
		this.menuPath = menuPath;
		this.createDatetime = createDatetime;
		this.createUser = createUser;
	}

	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", menuName=" + menuName + ", menuCode=" + menuCode + ", menuAuth=" + menuAuth
				+ ", menuUpperCode=" + menuUpperCode + ", menuPath=" + menuPath + ", createDatetime=" + createDatetime
				+ ", createUser=" + createUser + ", updateDatetime=" + updateDatetime + ", updateUser=" + updateUser
				+ "]";
	}

}
