/*
 * �������� 2006-1-16
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package base.util;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.struts.util.ResponseUtils;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TalentWriterOperation extends TagSupport{
	String operation = null;
	
	/**
	 * @return ���� operation��
	 */
	public String getOperation() {
		return operation;
	}
	/**
	 * @param operation Ҫ���õ� operation��
	 */
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public TalentWriterOperation() {
		
	}
	
	public int doStartTag() throws JspException {
		boolean hasPermission = false;
		
		try{
			hasPermission = new RightParse().parse(this.operation,this.pageContext.getSession());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String result = "false";
		if(hasPermission) result = "true";
		ResponseUtils.write(this.pageContext,result);
		return TagSupport.SKIP_BODY;
	}
	
	

}
