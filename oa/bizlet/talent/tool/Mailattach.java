/*
 * 创建日期 2005-9-17
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.tool;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class Mailattach {
	/**
	 * @return 返回 attachId。
	 */
	public int getAttachId() {
		return attachId;
	}
	/**
	 * @param attachId 要设置的 attachId。
	 */
	public void setAttachId(int attachId) {
		this.attachId = attachId;
	}
	/**
	 * @return 返回 attachName。
	 */
	public String getAttachName() {
		return attachName;
	}
	/**
	 * @param attachName 要设置的 attachName。
	 */
	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}
	/**
	 * @return 返回 filePath。
	 */
	public String getFilePath() {
		return filePath;
	}
	/**
	 * @param filePath 要设置的 filePath。
	 */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	/**
	 * @return 返回 mailId。
	 */
	public int getMailId() {
		return mailId;
	}
	/**
	 * @param mailId 要设置的 mailId。
	 */
	public void setMailId(int mailId) {
		this.mailId = mailId;
	}
	/**
	 * @return 返回 remark。
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark 要设置的 remark。
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	private int attachId;
	private int mailId;
	private String attachName;
	private String filePath;
	private String remark;
	
	public Mailattach(){
		
	}
	
	public Mailattach(int attachId,int mailId,String attachName,String filePath,String remark){
		this.attachId = attachId;
		this.mailId = mailId;
		this.attachName = attachName;
		this.filePath = filePath;
		this.remark = remark;
	}
	
	public Mailattach(String attachName,String filePath,String remark){
		
		this.attachName = attachName;
		this.filePath = filePath;
		this.remark = remark;
	}
	
}
