package fcc.oa.workflow;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Map;
import java.util.HashMap;

import base.util.DBconnection;

import base.util.TalentContext;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class WorkflowLook extends TagSupport {
	
	private String dom;
	/**
	 * @return ���� userMap��
	 */
	public static Map getUserMap() {
		return userMap;
	}
	/**
	 * @param userMap Ҫ���õ� userMap��
	 */
	public static void setUserMap(Map userMap) {
		WorkflowLook.userMap = userMap;
	}
	/**
	 * @return ���� dom��
	 */
	public String getDom() {
		return dom;
	}
	/**
	 * @param dom Ҫ���õ� dom��
	 */
	public void setDom(String dom) {
		this.dom = dom;
	}
	/**
	 * @return ���� path��
	 */
	public String getPath() {
		return path;
	}
	/**
	 * @param path Ҫ���õ� path��
	 */
	public void setPath(String path) {
		this.path = path;
	}
	private String path;
	public static Map userMap = new HashMap();
	
	private String maxlength = null;
	
	public int doStartTag() throws JspException{
		try{
			String userIDs = TalentContext.getValue(this.pageContext,dom,path);
			String result = "";
			if(userIDs == null) userIDs = "";
			if(this.maxlength == null || "".equalsIgnoreCase(this.maxlength)) this.maxlength = "3";
			if(!"".equals(userIDs)) {
				String[] ids = userIDs.split(",");
				
				if(ids.length <= Integer.parseInt(this.maxlength)) {
					for(int i = 0; i < ids.length; i++) {
						String userID = ids[i];
						if(!"".equals(userID)) {
							if(userMap.containsKey(userID)) {
								String tempName = (String) userMap.get(userID);
								result += tempName + ",";
							
							}else{
								String tempName = getOperatorNameByUserID(userID);
								result += tempName + ",";
								userMap.put(userID,tempName);
							
							}
						
						
						}
					
					}
					if(!"".equals(result)) result = result.substring(0,result.lastIndexOf(","));
				
				}else{
					String maxStr = "";
					String allStr = "";
					int mark = 0;
					
					for(int i = 0; i < ids.length; i++) {
						String userID = ids[i];
						if(!"".equals(userID)) {
							if(userMap.containsKey(userID)) {
								String tempName = (String) userMap.get(userID);
								allStr += tempName + ",";
								if(mark <= Integer.parseInt(this.maxlength)) {
									maxStr += tempName + ",";
									mark++;
								}
							
							}else{
								String tempName = getOperatorNameByUserID(userID);
								allStr += tempName + ",";
								if(mark <= Integer.parseInt(this.maxlength)) {
									maxStr += tempName + ",";
									mark++;
								}
								userMap.put(userID,tempName);
							
							}
						
						
						}
						
					}//for
					if(!"".equals(maxStr)) maxStr = maxStr.substring(0,maxStr.lastIndexOf(","));
					if(!"".equals(allStr)) allStr = allStr.substring(0,allStr.lastIndexOf(","));
					result += "<a name=\"fcclzydouble\" title=\"" + allStr + "\" >" + maxStr + "...</a>";
				
				}
				
				
			
			
			}
			
			this.pageContext.getOut().write(result);
			this.pageContext.getOut().flush();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return TagSupport.SKIP_BODY;
	}
	
	public int doEndTag()  throws JspException{
	      return TagSupport.EVAL_PAGE;
	}
	
	
	private String getOperatorNameByUserID(String userID) {
		String result = "";
		String sql = "select operatorName from EOSOperator where userID='" + userID + "'";
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			con = new DBconnection().getEOSConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				result = rs.getString("operatorName");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(con!=null) con.close();
				
				rs = null;
				st = null;
				con = null;
				
			}catch(Exception ee) {
				
			}
		
		}
		
		return result;
	
	
	}

	public static void main(String[] args) {
		
	}
	/**
	 * @return ���� maxlength��
	 */
	public String getMaxlength() {
		return maxlength;
	}
	/**
	 * @param maxlength Ҫ���õ� maxlength��
	 */
	public void setMaxlength(String maxlength) {
		this.maxlength = maxlength;
	}
}
