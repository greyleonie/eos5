package tools.util;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-11-1
 * @class_displayName Notice
 */

public class Notice {
  private int noticeID;
  private String title;
  private String cteateTime;
  
  
  
/**
 * @return ���� cteateTime��
 */
public String getCteateTime() {
	return cteateTime;
}
/**
 * @param cteateTime Ҫ���õ� cteateTime��
 */
public void setCteateTime(String cteateTime) {
	this.cteateTime = cteateTime;
}
/**
 * @return ���� noticeID��
 */
public int getNoticeID() {
	return noticeID;
}
/**
 * @param noticeID Ҫ���õ� noticeID��
 */
public void setNoticeID(int noticeID) {
	this.noticeID = noticeID;
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