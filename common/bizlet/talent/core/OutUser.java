/*
 * �������� 2006-11-3
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
	 * @return ���� cardId��
	 */
	public String getCardId() {
		return cardId;
	}
	/**
	 * @param cardId Ҫ���õ� cardId��
	 */
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	/**
	 * @return ���� pwd��
	 */
	public String getPwd() {
		return pwd;
	}
	/**
	 * @param pwd Ҫ���õ� pwd��
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	/**
	 * @return ���� state��
	 */
	public int getState() {
		return state;
	}
	/**
	 * @param state Ҫ���õ� state��
	 */
	public void setState(int state) {
		this.state = state;
	}
	/**
	 * @return ���� userAccount��
	 */
	public String getUserAccount() {
		return userAccount;
	}
	/**
	 * @param userAccount Ҫ���õ� userAccount��
	 */
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	/**
	 * @return ���� userId��
	 */
	public long getUserId() {
		return userId;
	}
	/**
	 * @param userId Ҫ���õ� userId��
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * @return ���� userName��
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName Ҫ���õ� userName��
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return ���� userType��
	 */
	public int getUserType() {
		return userType;
	}
	/**
	 * @param userType Ҫ���õ� userType��
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
