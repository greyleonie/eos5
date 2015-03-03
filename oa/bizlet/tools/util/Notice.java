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
 * @return 返回 cteateTime。
 */
public String getCteateTime() {
	return cteateTime;
}
/**
 * @param cteateTime 要设置的 cteateTime。
 */
public void setCteateTime(String cteateTime) {
	this.cteateTime = cteateTime;
}
/**
 * @return 返回 noticeID。
 */
public int getNoticeID() {
	return noticeID;
}
/**
 * @param noticeID 要设置的 noticeID。
 */
public void setNoticeID(int noticeID) {
	this.noticeID = noticeID;
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