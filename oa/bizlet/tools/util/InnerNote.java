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
 * @return 返回 msgId。
 */
public int getMsgId() {
	return msgId;
}
/**
 * @param msgId 要设置的 msgId。
 */
public void setMsgId(int msgId) {
	this.msgId = msgId;
}
/**
 * @return 返回 sendDate。
 */
public String getSendDate() {
	return sendDate;
}
/**
 * @param sendDate 要设置的 sendDate。
 */
public void setSendDate(String sendDate) {
	this.sendDate = sendDate;
}
/**
 * @return 返回 title。
 */
public String getTitle() {
	return title;
}
/**
 * @param title 要设置的 title。
 */
public void setTitle(String title) {
	this.title = title;
}
}