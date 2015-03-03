/*
 * 创建日期 2006-2-15
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.util;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class SysRoleModule {
	private String moduleId;
	private String operateId;


	/**
	 * @return 返回 moduleId。
	 */
	public String getModuleId() {
		return moduleId;
	}
	/**
	 * @param moduleId 要设置的 moduleId。
	 */
	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}
	/**
	 * @return 返回 operateId。
	 */
	public String getOperateId() {
		return operateId;
	}
	/**
	 * @param operateId 要设置的 operateId。
	 */
	public void setOperateId(String operateId) {
		this.operateId = operateId;
	}
	
	public SysRoleModule(String moduleId,String operateId){
		this.moduleId = moduleId;
		this.operateId = operateId;
	}

}
