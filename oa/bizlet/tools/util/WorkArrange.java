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
 * @return ���� id��
 */
public int getId() {
	return id;
}
/**
 * @param id Ҫ���õ� id��
 */
public void setId(int id) {
	this.id = id;
}
/**
 * @return ���� taskContent��
 */
public String getTaskContent() {
	return taskContent;
}
/**
 * @param taskContent Ҫ���õ� taskContent��
 */
public void setTaskContent(String taskContent) {
	this.taskContent = taskContent;
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