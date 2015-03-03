package tools.util;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-11-2
 * @class_displayName WorkArrange
 */

public class WorkArrange {
 private int id;
 private String taskSum;
 private String taskContent;
 
 
/**
 * @return 返回 id。
 */
public int getId() {
	return id;
}
/**
 * @param id 要设置的 id。
 */
public void setId(int id) {
	this.id = id;
}
/**
 * @return 返回 taskContent。
 */
public String getTaskContent() {
	return taskContent;
}
/**
 * @param taskContent 要设置的 taskContent。
 */
public void setTaskContent(String taskContent) {
	this.taskContent = taskContent;
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