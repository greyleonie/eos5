/*
 * 创建日期 2006-11-3
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class OutUser {
	private long userId;
	private int userType;
	private String cardId;
	private String userAccount;
	private String pwd;
	private String userName;
	private int state;

	/**
	 * @return 返回 cardId。
	 */
	public String getCardId() {
		return cardId;
	}
	/**
	 * @param cardId 要设置的 cardId。
	 */
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	/**
	 * @return 返回 pwd。
	 */
	public String getPwd() {
		return pwd;
	}
	/**
	 * @param pwd 要设置的 pwd。
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	/**
	 * @return 返回 state。
	 */
	public int getState() {
		return state;
	}
	/**
	 * @param state 要设置的 state。
	 */
	public void setState(int state) {
		this.state = state;
	}
	/**
	 * @return 返回 userAccount。
	 */
	public String getUserAccount() {
		return userAccount;
	}
	/**
	 * @param userAccount 要设置的 userAccount。
	 */
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	/**
	 * @return 返回 userId。
	 */
	public long getUserId() {
		return userId;
	}
	/**
	 * @param userId 要设置的 userId。
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * @return 返回 userName。
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName 要设置的 userName。
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return 返回 userType。
	 */
	public int getUserType() {
		return userType;
	}
	/**
	 * @param userType 要设置的 userType。
	 */
	public void setUserType(int userType) {
		this.userType = userType;
	}
	
	public OutUser(long userId,int userType,String cardId,String userAccount,String pwd,String userName,int state) {
		this.userId = userId;
		this.userType = userType;
		this.cardId = cardId;
		this.userAccount = userAccount;
		this.pwd = pwd;
		this.userName = userName;
		this.state = state;
		
	}
}
