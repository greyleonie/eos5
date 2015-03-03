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
 * @return 返回 arrangeId。
 */
public int getArrangeId() {
	return arrangeId;
}
/**
 * @param arrangeId 要设置的 arrangeId。
 */
public void setArrangeId(int arrangeId) {
	this.arrangeId = arrangeId;
}
/**
 * @return 返回 calendar。
 */
public String getCalendar() {
	return calendar;
}
/**
 * @param calendar 要设置的 calendar。
 */
public void setCalendar(String calendar) {
	this.calendar = calendar;
}
/**
 * @return 返回 taskSum。
 */
public String getTaskSum() {
	return taskSum;
}
/**
 * @param taskSum 要设置的 taskSum。
 */
public void setTaskSum(String taskSum) {
	this.taskSum = taskSum;
}
}