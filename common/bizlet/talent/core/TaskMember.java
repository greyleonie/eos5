/*
 * �������� 2006-8-1
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
	 * @return ���� actorId��
	 */
	public String getActorId() {
		return actorId;
	}
	/**
	 * @param actorId Ҫ���õ� actorId��
	 */
	public void setActorId(String actorId) {
		this.actorId = actorId;
	}
	/**
	 * @return ���� actorName��
	 */
	public String getActorName() {
		return actorName;
	}
	/**
	 * @param actorName Ҫ���õ� actorName��
	 */
	public void setActorName(String actorName) {
		this.actorName = actorName;
	}
	/**
	 * @return ���� depName��
	 */
	public String getDepName() {
		return depName;
	}
	/**
	 * @param depName Ҫ���õ� depName��
	 */
	public void setDepName(String depName) {
		this.depName = depName;
	}
	/**
	 * @return ���� taskId��
	 */
	public String getTaskId() {
		return taskId;
	}
	/**
	 * @param taskId Ҫ���õ� taskId��
	 */
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	/**
	 * @return ���� operatorId��
	 */
	public String getOperatorId() {
		return operatorId;
	}
	/**
	 * @param operatorId Ҫ���õ� operatorId��
	 */
	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}
}
