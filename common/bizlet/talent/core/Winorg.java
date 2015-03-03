/*
 * 创建日期 2006-6-8
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
public class Winorg {
	private int orgId;
	private String userId;
	
	public Winorg(){
		
	}
	
	public Winorg(int orgId,String userId){
		this.orgId = orgId;
		this.userId = userId;
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
}
