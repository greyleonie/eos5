/*
 * 创建日期 2006-4-24
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
public class PersonToPos {
	private String posId;
	private String operatorId;
	

	/**
	 * @return 返回 operatorId。
	 */
	public String getOperatorId() {
		return operatorId;
	}
	/**
	 * @param operatorId 要设置的 operatorId。
	 */
	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}
	/**
	 * @return 返回 posId。
	 */
	public String getPosId() {
		return posId;
	}
	/**
	 * @param posId 要设置的 posId。
	 */
	public void setPosId(String posId) {
		this.posId = posId;
	}
	
	public PersonToPos(String posId,String operatorId) {
		this.posId =posId;
		this.operatorId = operatorId;
	
	}
}
