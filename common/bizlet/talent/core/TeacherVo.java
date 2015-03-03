/*
 * 创建日期 2007-1-11
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

import java.io.Serializable;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TeacherVo implements Serializable {
	
	
	public TeacherVo() {
		
	}
	
	public TeacherVo(long tId,String userId,String userName,int orgId,
			String firstChar,int workType,int position,String sex,int orgType) {
		
		this.tId = tId;
		this.userId = userId;
		this.userName = userName;
		this.orgId = orgId;
		this.firstChar = firstChar;
		this.workType = workType;
		this.position = position;
		this.sex = sex;
		this.orgType = orgType;
	}
	
	public TeacherVo(long tId,String userId,String userName,int orgId,
			String firstChar,int workType,int position,String sex,int orgType,int isLeave,int isDead,int isRetire) {
		
		this.tId = tId;
		this.userId = userId;
		this.userName = userName;
		this.orgId = orgId;
		this.firstChar = firstChar;
		this.workType = workType;
		this.position = position;
		this.sex = sex;
		this.orgType = orgType;
		this.isDead=isDead;
		this.isLeave=isLeave;
		this.isRetire=isRetire;
	}
	
	public TeacherVo(long tId,String userId,String userName,int orgId,
			String firstChar,int workType,int position,String sex,int orgType,String mobileNo) {//有电话的构造函数
		
		this.tId = tId;
		this.userId = userId;
		this.userName = userName;
		this.orgId = orgId;
		this.firstChar = firstChar;
		this.workType = workType;
		this.position = position;
		this.sex = sex;
		this.orgType = orgType;
		this.mobileNo=mobileNo;
		
	}
	
	public TeacherVo(long tId,String userId,String userName,int orgId,
			String firstChar,int workType,int position,String sex,String email,int orgType) {//有邮件的构造函数
		
		this.tId = tId;
		this.userId = userId;
		this.userName = userName;
		this.orgId = orgId;
		this.firstChar = firstChar;
		this.workType = workType;
		this.position = position;
		this.sex = sex;
		this.email=email;
		this.orgType = orgType;
		
	}
	
	public TeacherVo(long tId,String userId,String userName,int orgId,
			String firstChar,int workType,int position,String sex,String email,int orgType,int isLeave,int isDead,int isRetire) {//有邮件的构造函数
		
		this.tId = tId;
		this.userId = userId;
		this.userName = userName;
		this.orgId = orgId;
		this.firstChar = firstChar;
		this.workType = workType;
		this.position = position;
		this.sex = sex;
		this.email=email;
		this.orgType = orgType;
		this.isDead=isDead;
		this.isLeave=isLeave;
		this.isRetire=isRetire;
	}
	
	public String toString() {
		
		String result = "教师ID：" + this.tId + "，帐号：" + this.userId + "，教师名：" + this.userName + "，部门ID：" + this.orgId + "，名字首字母：" + this.firstChar + "\n" ;
		result += "，教师类型：" + this.workType + "，职位：" + this.position + ",性别:" + this.sex + ",部门类型:" + this.orgType + ",邮件地址：" + this.email;
		result+=",是否已退休："+this.isRetire+",是否已调离："+this.isLeave+",是否在世："+this.isDead;
		return result;
	}
	
	private long tId;//教师ID
	private String userId;//帐号
	private String userName;//教师名
	private int orgId;//部门ID
	private String firstChar;//名字首字母
	private String mobileNo;//电话号码
	private String email;//电子邮件
	private int isLeave=0;
	private int isDead=0;
	private int isRetire=0;
	/**
	 * @return 返回 isDead。
	 */
	public int getIsDead() {
		return isDead;
	}
	/**
	 * @param isDead 要设置的 isDead。
	 */
	public void setIsDead(int isDead) {
		this.isDead = isDead;
	}
	/**
	 * @return 返回 isLeave。
	 */
	public int getIsLeave() {
		return isLeave;
	}
	/**
	 * @param isLeave 要设置的 isLeave。
	 */
	public void setIsLeave(int isLeave) {
		this.isLeave = isLeave;
	}
	/**
	 * @return 返回 isRetire。
	 */
	public int getIsRetire() {
		return isRetire;
	}
	/**
	 * @param isRetire 要设置的 isRetire。
	 */
	public void setIsRetire(int isRetire) {
		this.isRetire = isRetire;
	}
	/**
	 * @return 返回 email。
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email 要设置的 email。
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return 返回 firstChar。
	 */
	public String getFirstChar() {
		return firstChar;
	}
	/**
	 * @param firstChar 要设置的 firstChar。
	 */
	public void setFirstChar(String firstChar) {
		this.firstChar = firstChar;
	}
	/**
	 * @return 返回 orgId。
	 */
	public int getOrgId() {
		return orgId;
	}
	/**
	 * @param orgId 要设置的 orgId。
	 */
	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}
	/**
	 * @return 返回 orgType。
	 */
	public int getOrgType() {
		return orgType;
	}
	/**
	 * @param orgType 要设置的 orgType。
	 */
	public void setOrgType(int orgType) {
		this.orgType = orgType;
	}
	/**
	 * @return 返回 position。
	 */
	public int getPosition() {
		return position;
	}
	/**
	 * @param position 要设置的 position。
	 */
	public void setPosition(int position) {
		this.position = position;
	}
	/**
	 * @return 返回 sex。
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param sex 要设置的 sex。
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * @return 返回 tId。
	 */
	public long getTId() {
		return tId;
	}
	/**
	 * @param id 要设置的 tId。
	 */
	public void setTId(long id) {
		tId = id;
	}
	/**
	 * @return 返回 userId。
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId 要设置的 userId。
	 */
	public void setUserId(String userId) {
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
	 * @return 返回 workType。
	 */
	public int getWorkType() {
		return workType;
	}
	/**
	 * @param workType 要设置的 workType。
	 */
	public void setWorkType(int workType) {
		this.workType = workType;
	}
	private int workType;//教师类型：本校，外请
	private int position;//职位
	private String sex;//性别
	private int orgType;//部门类型
	
	
	

	
	/**
	 * @return 返回 mobileNo。
	 */
	public String getMobileNo() {
		return mobileNo;
	}
	/**
	 * @param mobileNo 要设置的 mobileNo。
	 */
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
}
