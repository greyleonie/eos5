/*
 * 创建日期 2005-4-30
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

/**
 * @author tim
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class ClassEnt {
	  private int classId;
	  private String className;
	  private String classRoom;
	  private int isHistoryClass;
	/**
	 * @return 返回 state。
	 */
	public String getState() {
		return state;
	}
	/**
	 * @param state 要设置的 state。
	 */
	public void setState(String state) {
		this.state = state;
	}
	  private String state;
	/**
	 * @return 返回 classId。
	 */
	public int getClassId() {
		return classId;
	}
	/**
	 * @param classId 要设置的 classId。
	 */
	public void setClassId(int classId) {
		this.classId = classId;
	}
	/**
	 * @return 返回 className。
	 */
	public String getClassName() {
		return className;
	}
	/**
	 * @param className 要设置的 className。
	 */
	public void setClassName(String className) {
		this.className = className;
	}
	/**
	 * @return 返回 classRoom。
	 */
	public String getClassRoom() {
		return classRoom;
	}
	/**
	 * @param classRoom 要设置的 classRoom。
	 */
	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}
	/**
	 * @return 返回 isHistoryClass。
	 */
	public int getIsHistoryClass() {
		return isHistoryClass;
	}
	/**
	 * @param isHistoryClass 要设置的 isHistoryClass。
	 */
	public void setIsHistoryClass(int isHistoryClass) {
		this.isHistoryClass = isHistoryClass;
	}
}
