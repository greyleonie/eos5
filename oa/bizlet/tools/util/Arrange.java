package tools.util;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-11-1
 * @class_displayName Arrange
 */

public class Arrange {
 private int arrangeId;
 private String taskSum;
 private String calendar;
 
 
/**
 * @return ���� arrangeId��
 */
public int getArrangeId() {
	return arrangeId;
}
/**
 * @param arrangeId Ҫ���õ� arrangeId��
 */
public void setArrangeId(int arrangeId) {
	this.arrangeId = arrangeId;
}
/**
 * @return ���� calendar��
 */
public String getCalendar() {
	return calendar;
}
/**
 * @param calendar Ҫ���õ� calendar��
 */
public void setCalendar(String calendar) {
	this.calendar = calendar;
}
/**
 * @return ���� taskSum��
 */
public String getTaskSum() {
	return taskSum;
}
/**
 * @param taskSum Ҫ���õ� taskSum��
 */
public void setTaskSum(String taskSum) {
	this.taskSum = taskSum;
}
}