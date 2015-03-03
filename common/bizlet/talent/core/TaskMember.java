/*
 * 创建日期 2006-8-1
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
public class TaskMember {
	private String taskId;
	private String actorId;
	private String operatorId;
	private String actorName;
	private String depName;
	
	public TaskMember() {
		
	}
	
	public TaskMember(String taskId,String actorId,String actorName,String depName,String operatorId) {
		this.taskId = taskId;
		this.actorId = actorId;
		this.actorName = actorName;
		this.depName = depName;
		this.operatorId = operatorId;
	
	}

	/**
	 * @return 返回 actorId。
	 */
	public String getActorId() {
		return actorId;
	}
	/**
	 * @param actorId 要设置的 actorId。
	 */
	public void setActorId(String actorId) {
		this.actorId = actorId;
	}
	/**
	 * @return 返回 actorName。
	 */
	public String getActorName() {
		return actorName;
	}
	/**
	 * @param actorName 要设置的 actorName。
	 */
	public void setActorName(String actorName) {
		this.actorName = actorName;
	}
	/**
	 * @return 返回 depName。
	 */
	public String getDepName() {
		return depName;
	}
	/**
	 * @param depName 要设置的 depName。
	 */
	public void setDepName(String depName) {
		this.depName = depName;
	}
	/**
	 * @return 返回 taskId。
	 */
	public String getTaskId() {
		return taskId;
	}
	/**
	 * @param taskId 要设置的 taskId。
	 */
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
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
}
