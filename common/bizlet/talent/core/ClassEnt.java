/*
 * �������� 2005-4-30
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

/**
 * @author tim
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class ClassEnt {
	  private int classId;
	  private String className;
	  private String classRoom;
	  private int isHistoryClass;
	/**
	 * @return ���� state��
	 */
	public String getState() {
		return state;
	}
	/**
	 * @param state Ҫ���õ� state��
	 */
	public void setState(String state) {
		this.state = state;
	}
	  private String state;
	/**
	 * @return ���� classId��
	 */
	public int getClassId() {
		return classId;
	}
	/**
	 * @param classId Ҫ���õ� classId��
	 */
	public void setClassId(int classId) {
		this.classId = classId;
	}
	/**
	 * @return ���� className��
	 */
	public String getClassName() {
		return className;
	}
	/**
	 * @param className Ҫ���õ� className��
	 */
	public void setClassName(String className) {
		this.className = className;
	}
	/**
	 * @return ���� classRoom��
	 */
	public String getClassRoom() {
		return classRoom;
	}
	/**
	 * @param classRoom Ҫ���õ� classRoom��
	 */
	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}
	/**
	 * @return ���� isHistoryClass��
	 */
	public int getIsHistoryClass() {
		return isHistoryClass;
	}
	/**
	 * @param isHistoryClass Ҫ���õ� isHistoryClass��
	 */
	public void setIsHistoryClass(int isHistoryClass) {
		this.isHistoryClass = isHistoryClass;
	}
}
