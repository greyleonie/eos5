/*
 * �������� 2006-2-15
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.util;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class SysRoleModule {
	private String moduleId;
	private String operateId;


	/**
	 * @return ���� moduleId��
	 */
	public String getModuleId() {
		return moduleId;
	}
	/**
	 * @param moduleId Ҫ���õ� moduleId��
	 */
	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}
	/**
	 * @return ���� operateId��
	 */
	public String getOperateId() {
		return operateId;
	}
	/**
	 * @param operateId Ҫ���õ� operateId��
	 */
	public void setOperateId(String operateId) {
		this.operateId = operateId;
	}
	
	public SysRoleModule(String moduleId,String operateId){
		this.moduleId = moduleId;
		this.operateId = operateId;
	}

}
