package tools.util;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-11-1
 * @class_displayName InnerNote
 */

public class InnerNote {
 private int msgId;
 private String title;
 private String sendDate;
 
 
/**
 * @return ���� msgId��
 */
public int getMsgId() {
	return msgId;
}
/**
 * @param msgId Ҫ���õ� msgId��
 */
public void setMsgId(int msgId) {
	this.msgId = msgId;
}
/**
 * @return ���� sendDate��
 */
public String getSendDate() {
	return sendDate;
}
/**
 * @param sendDate Ҫ���õ� sendDate��
 */
public void setSendDate(String sendDate) {
	this.sendDate = sendDate;
}
/**
 * @return ���� title��
 */
public String getTitle() {
	return title;
}
/**
 * @param title Ҫ���õ� title��
 */
public void setTitle(String title) {
	this.title = title;
}
}