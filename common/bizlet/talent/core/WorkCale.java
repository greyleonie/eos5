/*
 * 创建日期 2006-6-7
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
 * TOOLS_WORKCALE
 */
public class WorkCale {
	private String restDate;
	private String type;

	/**
	 * @return 返回 restDate。
	 */
	public String getRestDate() {
		return restDate;
	}
	/**
	 * @param restDate 要设置的 restDate。
	 */
	public void setRestDate(String restDate) {
		this.restDate = restDate;
	}
	/**
	 * @return 返回 type。
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type 要设置的 type。
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	public WorkCale(String s1,String s2) {
		this.restDate = s1;
		this.type = s2;
	}
	
	
}
