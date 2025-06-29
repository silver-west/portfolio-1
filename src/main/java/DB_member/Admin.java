package DB_member;

public class Admin {
	private String adminId;
	private String adminPw;
	private String adminNickName;
	
	public Admin(String adminId, String adminPw, String adminNickName) {
		super();
		this.adminId = adminId;
		this.adminPw = adminPw;
		this.adminNickName = adminNickName;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getAdminNickName() {
		return adminNickName;
	}
	public void setAdminNickName(String adminNickName) {
		this.adminNickName = adminNickName;
	}
	
	
}
