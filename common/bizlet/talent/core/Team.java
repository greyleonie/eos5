/*
 * �������� 2007-5-17
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
public class Team {
int classId;
String teamName;
String roomName;
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
 * @return ���� roomName��
 */
public String getRoomName() {
	return roomName;
}
/**
 * @param roomName Ҫ���õ� roomName��
 */
public void setRoomName(String roomName) {
	this.roomName = roomName;
}
/**
 * @return ���� teamName��
 */
public String getTeamName() {
	return teamName;
}
/**
 * @param teamName Ҫ���õ� teamName��
 */
public void setTeamName(String teamName) {
	this.teamName = teamName;
}
}
