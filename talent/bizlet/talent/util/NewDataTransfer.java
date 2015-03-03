/*
 * �������� 2008-10-29
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.util;

import java.io.InputStream;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.TimerTask;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import talent.core.Webpriary;
import base.util.DBconnection;

/**
 * @author Administrator
 * 
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת�� ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class NewDataTransfer extends TimerTask {
    private static final String morningStartCardTime = " 07:45:00"; //��ʾ����ˢ����Ϣʱ�俪ʼ,�Ͽ���ǰһСʱ

    private static final String morningEndCardTime = " 09:45:00"; //��ʾ����ˢ����Ϣʱ�����,�Ͽγٺ�һСʱ

    private static final String afternoonStartCardTime = " 13:30:00"; //��ʾ����ˢ����Ϣʱ�俪ʼ,�Ͽ���ǰһСʱ

    private static final String afternoonEndCardTime = " 15:30:00"; //��ʾ����ˢ����Ϣʱ�����,�Ͽγٺ�һСʱ

    private static final String eveningStartCardTime = " 18:00:00"; //��ʾ����ˢ����Ϣʱ�俪ʼ,�Ͽ���ǰһСʱ

    private static final String eveningEndCardTime = " 20:00:00"; //��ʾ����ˢ����Ϣʱ�����,�Ͽγٺ�һСʱ
    
	private Log fccLog = LogFactory.getLog(TalentAware.class);
	private Properties pro = null;
	private Connection webcon = null;
	private Connection intercon = null;
	private String driver = null;//�������ݿ�����
	private String url = null;//�������ݿ�����
	private String username = null;//�û���
	private String password = null;//����
	private String expire = null;//����
	private String serverip = null;//����IP

	public static NewDataTransfer talentAware = null;
	public String[] tables;
	
	private NewDataTransfer() {
		init();
	}
	
	protected void init() {
		try{
			pro = new Properties();
			InputStream in = this.getClass().getResourceAsStream("/properties/webSiteConfing.properties");
			pro.load(in);
			
			in.close();
			
			driver = pro.getProperty("driver");
			url = pro.getProperty("url");
			username = pro.getProperty("username");
			password = pro.getProperty("password");
			expire = pro.getProperty("expire");
			serverip = pro.getProperty("serverIP");
			
			if (pro.getProperty("TransferTables").indexOf(";")>=0)
			    tables = pro.getProperty("TransferTables").split(";");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	public static NewDataTransfer getInstance() {
		if (talentAware == null)
			talentAware = new NewDataTransfer();
		return talentAware;
	}
	
	
	

	public void run() {
	    Date now = new Date();
	    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf1.format(now); //�ѵ�ǰʱ����ʽΪ��yyyy-MM-dd
	    
		try{
			fccLog.info("----------------------------------------��ʼִ�����������ݴ��䶨ʱ��------------------------------------");
	        Date ms = sdf2.parse(date + morningStartCardTime);
	        Date me = sdf2.parse(date + morningEndCardTime);
	        Date as = sdf2.parse(date + afternoonStartCardTime);
	        Date ae = sdf2.parse(date + afternoonEndCardTime);
	        Date es = sdf2.parse(date + eveningStartCardTime);
	        Date ee = sdf2.parse(date + eveningEndCardTime);

            //�жϱ���ip������ֻ�ڷ���������
			if (InetAddress.getLocalHost().getHostAddress().indexOf(serverip)>=0) {
			    
			if ( ( now.after(ms) && now.before(me) ) 
			        || ( now.after(as) && now.before(ae) ) 
			        || ( now.after(es) && now.before(ee) ) ) {
				return;
			}
			
			if (tables != null)
			for (int i=0;i<tables.length;i++) {
			     try {
				    Class.forName(driver);
				    webcon = DriverManager.getConnection(url, username, password);
				    intercon = new DBconnection().getEOSConnection();
				    String[] temp = tables[i].split(",");
				    String[] keys = temp[1].split(":");
				    System.out.println(temp[0] + "," + temp[1] + "," + temp[2]);
				    exData(temp[0],temp[1],keys,temp[2]);
			     } catch (Exception e) {
			         continue;
			     }
			}
			
			}
			
			fccLog.info("----------------------------------------����ִ�����������ݴ��䶨ʱ��-------------------------------------");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private void exData(String table,String Key, String[] Keys,String type) {
		Statement st = null;
		ResultSet rs = null;
		Statement tmpst = null;
		ResultSet tmprs = null;
		Statement exst = null;
		Statement webst = null;
		ResultSet webrs = null;
		String delstr = "";
		String upsql = "";
		String insql = "";
		String sql = "";
		String upStr = "";
		int isFail = 0;
		
		try{
			if (type.indexOf("out")>=0) {
            //����������
			fccLog.info("----------------------------����"+table+"�������������-----��ʼ----------------------------");
			//start -- ��ѯ������ǰ����Ҫִ�еĲ�����¼ sql = "select * from " + table + " where isNews=1";
			sql = "select * from operatorLog where tableName='"  + table + "' and status=1 and sentence is not null order by createTime";
			st = intercon.createStatement();
			rs = st.executeQuery(sql);
			//end
			
			//start -- ������ȡ��ṹ
			tmpst = intercon.createStatement();
			tmprs = tmpst.executeQuery("select top 1 * from " + table);
            //end -- ������ȡ��ṹ
			
			//��ȡ�������¼
			webcon.setAutoCommit(false);
			while(rs.next()) {
			    //��ʼ��
			    boolean hasRecord = false;
				int id = rs.getInt("logID");
				
				//��ȡ�ñ�ṹ
				ResultSetMetaData meta=tmprs.getMetaData();
				int cols = meta.getColumnCount();
				
				//start -- ����
				if ("insert".equals(rs.getString("operator"))) {
				    //��ʼ��
				    int j = 1;
				    Statement checkSt = null;
				    ResultSet checkRs = null;
				    PreparedStatement pst = null;
				    
				    //��ȡ��ǰ��ͬ����¼
				    String sentence = rs.getString("sentence");
				    checkSt = intercon.createStatement();
				    checkRs = checkSt.executeQuery(sentence);
				    
                    //����ִ��SQL������ͬ��Ԥ����
					insql = "insert into " + table + " values(";
					for (int i=1;i<cols+1;i++) {
						insql += "?,";
					}
					insql = insql.substring(0,insql.length()-1) + ")";
					System.out.println("���� ��" + sentence);
					pst = webcon.prepareStatement(insql);
				    
				    //��������¼��ֵ
					while (checkRs!=null && checkRs.next()) {
					    hasRecord = true;
						for (int i=1;i<cols+1;i++) {
							int colType = meta.getColumnType(i);
							String colName = meta.getColumnName(i);
							switch (colType) {
							   case (-7)://BIT
								   	pst.setBoolean(j,checkRs.getBoolean(colName));
									j++;
								    continue;
							   case (-6)://TINYINT
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-5)://BIGINT
								   	pst.setLong(j,checkRs.getLong(colName));
									j++;
								    continue;
							   case (-4)://LONGVARBINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-3)://VARBINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-2)://BINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-1)://LONGVARCHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
								    continue;
							   case (0)://NULL
								   	pst.setNull(j,Types.NULL);
									j++;
								    continue;
							   case (1)://CHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
							        continue;
							   case (2)://NUMERIC
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (3)://DECIMAL
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (4)://INTEGER
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (5)://SMALLINT
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (6)://FLOAT
								   	pst.setFloat(j,checkRs.getFloat(colName));
									j++;
								    continue;
							   case (7)://REAL
								   	pst.setFloat(j,checkRs.getFloat(colName));
									j++;
								    continue;
							   case (8)://DOUBLE
								   	pst.setDouble(j,checkRs.getDouble(colName));
									j++;
								    continue;
							   case (12)://VARCHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
								    continue;
							   case (91)://DATE
								    pst.setDate(j,checkRs.getDate(colName));
									j++;
								    continue;
							   case (93)://TIMESTAMP
								    pst.setTimestamp(j,checkRs.getTimestamp(colName));
									j++;
								    continue;
							   case (2004)://BLOB
							        pst.setBytes(j,checkRs.getBytes(colName));
								    //pst.setBlob(j,rs.getBlob(colName));
									j++;
								    continue;
							   case (2005)://CLOB
								    pst.setClob(j,checkRs.getClob(colName));
									j++;
								    continue;
				            }
						  }
				    }
					
					//ִ��������������ͬ����������
					int result = 0;
					int opResult = 0;
			        Statement opst = webcon.createStatement();
			        ResultSet opCheckRs = null;
					try {
					   if (hasRecord)
					       result = pst.executeUpdate();
					   if (result > 0) {
					       if (type.indexOf("inout")>=0) {
					          try {
					             sql = "select * from operatorLog where operator='insert' and sentence='"+sentence+"' and status=1 and datediff(mi,createTime,getdate())<3";
						         opCheckRs = opst.executeQuery(sql);
						         if (opCheckRs != null && opCheckRs.next()) {
						             int opId = opCheckRs.getInt("logID");
						             sql = "delete from operatorLog where logID=" + opId;
						             opResult = opst.executeUpdate(sql);
						             if (opResult > 0) 
								         upStr += id + ",";//�����޸�������־��¼״̬��SQL���
						         }
					          } catch  (Exception e) {
					              e.printStackTrace();
								  break;
					          } finally {
					              if (opst != null) opst.close();
					              if (opCheckRs != null) opCheckRs.close();
					          }
					       } else {
					           upStr += id + ",";//�����޸�������־��¼״̬��SQL���
					       }
					   }
					   if (!hasRecord) upStr += id + ",";//����ü�¼�Ѳ�����Ҳ����־��¼״̬�޸�Ϊ0����ʾ����ͬ����
					   if (pst!=null) pst.close();
					} catch (Exception e) {
						isFail = 1;
						e.printStackTrace();
						break;
					}
				}
                //end -- ����
				
				//start -- ����
				else if ("update".equals(rs.getString("operator"))) {
                    //��ʼ��
				    int j = 1;
				    Statement checkSt = null;
				    ResultSet checkRs = null;
				    Statement webCheckSt = null;
				    ResultSet webCheckRs = null;
				    PreparedStatement pst = null;
				    
				    //��ȡ��ǰ��ͬ����¼
				    String sentence = rs.getString("sentence");
				    checkSt = intercon.createStatement();
				    checkRs = checkSt.executeQuery(sentence);
                    webCheckSt = webcon.createStatement();
				    webCheckRs = webCheckSt.executeQuery(sentence);
				    
                    //����ִ��SQL������ͬ��Ԥ����
				    upsql = "update " + table + " set ";
					for (int i=1;i<cols+1;i++) {
						String colName = meta.getColumnName(i);
						if (Key.indexOf(colName.trim())<0) {
							upsql += colName + "=?,";
		 				}
					}
					upsql = upsql.substring(0,upsql.length()-1) + " " + sentence.substring(sentence.indexOf("where"),sentence.length());
					System.out.println("���� ��" + sentence);
					pst = webcon.prepareStatement(upsql);
				    
				    //��������¼��ֵ
					while (checkRs!=null && checkRs.next()) {
					    hasRecord = true;
						for (int i=1;i<cols+1;i++) {
							int colType = meta.getColumnType(i);
							String colName = meta.getColumnName(i);
							if (Key.indexOf(colName.trim())<0) {
							switch (colType) {
							   case (-7)://BIT
								   	pst.setBoolean(j,checkRs.getBoolean(colName));
									j++;
								    continue;
							   case (-6)://TINYINT
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-5)://BIGINT
								   	pst.setLong(j,checkRs.getLong(colName));
									j++;
								    continue;
							   case (-4)://LONGVARBINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-3)://VARBINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-2)://BINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-1)://LONGVARCHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
								    continue;
							   case (0)://NULL
								   	pst.setNull(j,Types.NULL);
									j++;
								    continue;
							   case (1)://CHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
							        continue;
							   case (2)://NUMERIC
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (3)://DECIMAL
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (4)://INTEGER
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (5)://SMALLINT
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (6)://FLOAT
								   	pst.setFloat(j,checkRs.getFloat(colName));
									j++;
								    continue;
							   case (7)://REAL
								   	pst.setFloat(j,checkRs.getFloat(colName));
									j++;
								    continue;
							   case (8)://DOUBLE
								   	pst.setDouble(j,checkRs.getDouble(colName));
									j++;
								    continue;
							   case (12)://VARCHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
								    continue;
							   case (91)://DATE
								    pst.setDate(j,checkRs.getDate(colName));
									j++;
								    continue;
							   case (93)://TIMESTAMP
								    pst.setTimestamp(j,checkRs.getTimestamp(colName));
									j++;
								    continue;
							   case (2004)://BLOB
							        pst.setBytes(j,checkRs.getBytes(colName));
								    //pst.setBlob(j,rs.getBlob(colName));
									j++;
								    continue;
							   case (2005)://CLOB
								    pst.setClob(j,checkRs.getClob(colName));
									j++;
								    continue;
				            }
						  }
						}
				    }
					
					//ִ��������������ͬ�����²���
					int result = 0;
					int opResult = 0;
			        Statement opst = webcon.createStatement();
			        ResultSet opCheckRs = null;
					try {
					    if (hasRecord)
					        result = pst.executeUpdate();
					   if (result > 0) {
					       if (type.indexOf("inout")>=0) {
					          try {
					             sql = "select * from operatorLog where operator='update' and sentence='"+sentence+"' and status=1 and datediff(mi,createTime,getdate())<3";
						         opCheckRs = opst.executeQuery(sql);
						         if (opCheckRs != null && opCheckRs.next()) {
						             int opId = opCheckRs.getInt("logID");
						             sql = "delete from operatorLog where logID=" + opId;
						             opResult = opst.executeUpdate(sql);
						             if (opResult > 0) 
								         upStr += id + ",";//�����޸�������־��¼״̬��SQL���
						         }
					          } catch  (Exception e) {
					              e.printStackTrace();
								  break;
					          } finally {
					              if (opst != null) opst.close();
					              if (opCheckRs != null) opCheckRs.close();
					          }
					       } else {
					           upStr += id + ",";//�����޸�������־��¼״̬��SQL���
					       }
					   }
					   if (!hasRecord || webCheckRs==null || !webCheckRs.next())
					       upStr += id + ",";//����ü�¼�Ѳ�����Ҳ����־��¼״̬�޸�Ϊ0����ʾ����ͬ����
					   if (pst!=null) pst.close();
					} catch (Exception e) {
						isFail = 1;
						e.printStackTrace();
						break;
					}
				}
                //end -- ����
				
				//start -- ɾ��
				else if ("delete".equals(rs.getString("operator"))) {
				    //��ʼ��
				    Statement checkSt = null;
				    ResultSet checkRs = null;
				    Statement delSt = webcon.createStatement();
				    
				    //��ȡɾ����SQL���
				    sql = rs.getString("sentence");
				    String sentence = "select * " + sql.substring(7);
					System.out.println("ɾ�� ��" + sentence);
				    checkSt = webcon.createStatement();
				    checkRs = checkSt.executeQuery(sentence);
					
					//ִ��������������ͬ��ɾ������
					int result = 0;
					try {
					    if (checkRs != null && checkRs.next())
					        result = delSt.executeUpdate(sql);
					    else
					        upStr += id + ",";
					   if (result > 0) upStr += id + ",";
					   if (delSt!=null) delSt.close();
					} catch (Exception e) {
						isFail = 1;
						e.printStackTrace();
						break;
					}
				    
				}
                //end -- ɾ��
			}
		    try {
			   if (!"".equals(upStr)) {
			       intercon.setAutoCommit(false);
			       exst = intercon.createStatement();
			       sql = "update operatorLog set status=0 where logID in (" + upStr.substring(0, upStr.length()-1) + ")";
			       int result = exst.executeUpdate(sql);
			       if (result > 0) {
			           webcon.commit();
			           intercon.commit();
			           webcon.setAutoCommit(true);
				       intercon.setAutoCommit(true);
			       } else webcon.rollback();
			   }
		    } catch (Exception e) {
		        intercon.rollback();
		        webcon.rollback();
		        e.printStackTrace();
		    }
			fccLog.info("----------------------------����"+table+"�������������-----����----------------------------");
			}

			isFail = 0;
			upStr = "";
			if (type.indexOf("in")>=0) {
			//����������
			fccLog.info("----------------------------����"+table+"�������������-----��ʼ----------------------------");
			upsql = "";
			insql = "";
			//start -- ��ѯ������ǰ����Ҫִ�еĲ�����¼ sql = "select * from " + table + " where isNews=1";
			sql = "select * from operatorLog where tableName='"  + table + "' and status=1 and sentence is not null order by createTime";
			webst = webcon.createStatement();
			webrs = webst.executeQuery(sql);
			//end

			//start -- ������ȡ��ṹ
			tmpst = webcon.createStatement();
			tmprs = tmpst.executeQuery("select top 1 * from " + table);
            //end -- ������ȡ��ṹ
			
            //��ȡ�������¼
			intercon.setAutoCommit(false);
			while(webrs.next()) {
			    //��ʼ��
			    boolean hasRecord = false;
				int id = webrs.getInt("logID");
			    
                //��ȡ�ñ�ṹ
				ResultSetMetaData meta=tmprs.getMetaData();
				int cols = meta.getColumnCount();
				
                //start -- ����
				if ("insert".equals(webrs.getString("operator"))) {
				    //��ʼ��
				    int j = 1;
				    Statement checkSt = null;
				    ResultSet checkRs = null;
				    PreparedStatement pst = null;
				    
				    //��ȡ������ǰ��ͬ����¼
				    String sentence = webrs.getString("sentence");
				    checkSt = webcon.createStatement();
				    checkRs = checkSt.executeQuery(sentence);
				    
                    //����ִ��SQL������ͬ��Ԥ����
					insql = "insert into " + table + " values(";
					for (int i=1;i<cols+1;i++) {
						insql += "?,";
					}
					insql = insql.substring(0,insql.length()-1) + ")";
					System.out.println("���� ��" + sentence);
					pst = intercon.prepareStatement(insql);
				    
				    //��������¼��ֵ
					while (checkRs!=null && checkRs.next()) {
					    hasRecord = true;
						for (int i=1;i<cols+1;i++) {
							int colType = meta.getColumnType(i);
							String colName = meta.getColumnName(i);
							switch (colType) {
							   case (-7)://BIT
								   	pst.setBoolean(j,checkRs.getBoolean(colName));
									j++;
								    continue;
							   case (-6)://TINYINT
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-5)://BIGINT
								   	pst.setLong(j,checkRs.getLong(colName));
									j++;
								    continue;
							   case (-4)://LONGVARBINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-3)://VARBINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-2)://BINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-1)://LONGVARCHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
								    continue;
							   case (0)://NULL
								   	pst.setNull(j,Types.NULL);
									j++;
								    continue;
							   case (1)://CHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
							        continue;
							   case (2)://NUMERIC
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (3)://DECIMAL
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (4)://INTEGER
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (5)://SMALLINT
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (6)://FLOAT
								   	pst.setFloat(j,checkRs.getFloat(colName));
									j++;
								    continue;
							   case (7)://REAL
								   	pst.setFloat(j,checkRs.getFloat(colName));
									j++;
								    continue;
							   case (8)://DOUBLE
								   	pst.setDouble(j,checkRs.getDouble(colName));
									j++;
								    continue;
							   case (12)://VARCHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
								    continue;
							   case (91)://DATE
								    pst.setDate(j,checkRs.getDate(colName));
									j++;
								    continue;
							   case (93)://TIMESTAMP
								    pst.setTimestamp(j,checkRs.getTimestamp(colName));
									j++;
								    continue;
							   case (2004)://BLOB
							        pst.setBytes(j,checkRs.getBytes(colName));
								    //pst.setBlob(j,rs.getBlob(colName));
									j++;
								    continue;
							   case (2005)://CLOB
								    pst.setClob(j,checkRs.getClob(colName));
									j++;
								    continue;
				            }
						  }
				    }
					//ִ��������������ͬ����������
					int result = 0;
					int opResult = 0;
			        Statement opst = intercon.createStatement();
			        ResultSet opCheckRs = null;
					try {
					    if (hasRecord)
					        result = pst.executeUpdate();
					   if (result > 0) {
					       if (type.indexOf("inout")>=0) {
						          try {
						             sql = "select * from operatorLog where operator='insert' and sentence='"+sentence+"' and status=1 and datediff(mi,createTime,getdate())<3";
							         opCheckRs = opst.executeQuery(sql);
							         if (opCheckRs != null && opCheckRs.next()) {
							             int opId = opCheckRs.getInt("logID");
							             sql = "delete from operatorLog where logID=" + opId;
							             opResult = opst.executeUpdate(sql);
							             if (opResult > 0) 
									         upStr += id + ",";//�����޸�������־��¼״̬��SQL���
							         }
						          } catch  (Exception e) {
						              e.printStackTrace();
									  break;
						          } finally {
						              if (opst != null) opst.close();
						              if (opCheckRs != null) opCheckRs.close();
						          }
						   } else {
					           upStr += id + ",";//�����޸�������־��¼״̬��SQL���
					       }
					   }
					   if (!hasRecord) upStr += id + ",";//����ü�¼�Ѳ�����Ҳ����־��¼״̬�޸�Ϊ0����ʾ����ͬ����
					   if (pst!=null) pst.close();
					} catch (Exception e) {
						isFail = 1;
						e.printStackTrace();
						break;
					}
				}
                //end -- ����
				
				//start -- ����
				else if ("update".equals(webrs.getString("operator"))) {
                    //��ʼ��
				    int j = 1;
				    Statement checkSt = null;
				    ResultSet checkRs = null;
				    Statement interCheckSt = null;
				    ResultSet interCheckRs = null;
				    PreparedStatement pst = null;
				    
				    //��ȡ��ǰ��ͬ����¼
				    String sentence = webrs.getString("sentence");
				    checkSt = webcon.createStatement();
				    checkRs = checkSt.executeQuery(sentence);
                    interCheckSt = intercon.createStatement();
				    interCheckRs = interCheckSt.executeQuery(sentence);
				    
                    //����ִ��SQL������ͬ��Ԥ����
				    upsql = "update " + table + " set ";
					for (int i=1;i<cols+1;i++) {
						String colName = meta.getColumnName(i);
						if (Key.indexOf(colName.trim())<0) {
							upsql += colName + "=?,";
		 				}
					}
					upsql = upsql.substring(0,upsql.length()-1) + " " + sentence.substring(sentence.indexOf("where"),sentence.length());
					System.out.println("���� ��" + sentence);
					pst = intercon.prepareStatement(upsql);
				    
				    //��������¼��ֵ
					while (checkRs!=null && checkRs.next()) {
					    hasRecord = true;
						for (int i=1;i<cols+1;i++) {
							int colType = meta.getColumnType(i);
							String colName = meta.getColumnName(i);
							if (Key.indexOf(colName.trim())<0) {
							switch (colType) {
							   case (-7)://BIT
								   	pst.setBoolean(j,checkRs.getBoolean(colName));
									j++;
								    continue;
							   case (-6)://TINYINT
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-5)://BIGINT
								   	pst.setLong(j,checkRs.getLong(colName));
									j++;
								    continue;
							   case (-4)://LONGVARBINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-3)://VARBINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-2)://BINARY
								   	pst.setBytes(j,checkRs.getBytes(colName));
									j++;
								    continue;
							   case (-1)://LONGVARCHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
								    continue;
							   case (0)://NULL
								   	pst.setNull(j,Types.NULL);
									j++;
								    continue;
							   case (1)://CHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
							        continue;
							   case (2)://NUMERIC
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (3)://DECIMAL
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (4)://INTEGER
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (5)://SMALLINT
								   	pst.setInt(j,checkRs.getInt(colName));
									j++;
								    continue;
							   case (6)://FLOAT
								   	pst.setFloat(j,checkRs.getFloat(colName));
									j++;
								    continue;
							   case (7)://REAL
								   	pst.setFloat(j,checkRs.getFloat(colName));
									j++;
								    continue;
							   case (8)://DOUBLE
								   	pst.setDouble(j,checkRs.getDouble(colName));
									j++;
								    continue;
							   case (12)://VARCHAR
								   	pst.setString(j,checkRs.getString(colName));
									j++;
								    continue;
							   case (91)://DATE
								    pst.setDate(j,checkRs.getDate(colName));
									j++;
								    continue;
							   case (93)://TIMESTAMP
								    pst.setTimestamp(j,checkRs.getTimestamp(colName));
									j++;
								    continue;
							   case (2004)://BLOB
							        pst.setBytes(j,checkRs.getBytes(colName));
								    //pst.setBlob(j,rs.getBlob(colName));
									j++;
								    continue;
							   case (2005)://CLOB
								    pst.setClob(j,checkRs.getClob(colName));
									j++;
								    continue;
				            }
						  }
						}
				    }
					//ִ��������������ͬ�����²���
					int result = 0;
					int opResult = 0;
			        Statement opst = intercon.createStatement();
			        ResultSet opCheckRs = null;
					try {
					    if (hasRecord)
					        result = pst.executeUpdate();
					   if (result > 0) { 
					       if (type.indexOf("inout")>=0) {
						          try {
						             sql = "select * from operatorLog where operator='update' and sentence='"+sentence+"' and status=1 and datediff(mi,createTime,getdate())<3";
							         opCheckRs = opst.executeQuery(sql);
							         if (opCheckRs != null && opCheckRs.next()) {
							             int opId = opCheckRs.getInt("logID");
							             sql = "delete from operatorLog where logID=" + opId;
							             opResult = opst.executeUpdate(sql);
							             if (opResult > 0) 
									         upStr += id + ",";//�����޸�������־��¼״̬��SQL���
							         }
						          } catch  (Exception e) {
						              e.printStackTrace();
									  break;
						          } finally {
						              if (opst != null) opst.close();
						              if (opCheckRs != null) opCheckRs.close();
						          }
						   } else {
					           upStr += id + ",";//�����޸�������־��¼״̬��SQL���
					       }
                       }
					   if (!hasRecord || interCheckRs==null || !interCheckRs.next()) upStr += id + ",";//����ü�¼�Ѳ�����Ҳ����־��¼״̬�޸�Ϊ0����ʾ����ͬ����
					   if (pst!=null) pst.close();
					} catch (Exception e) {
						isFail = 1;
						e.printStackTrace();
						break;
					}
				}
                //end -- ����
				
				//start -- ɾ��
				else if ("delete".equals(webrs.getString("operator"))) {
				    //��ʼ��
				    Statement checkSt = null;
				    ResultSet checkRs = null;
				    Statement delSt = intercon.createStatement();
				    
				    //��ȡɾ����SQL���
				    sql = webrs.getString("sentence");
				    String sentence = "select * " + sql.substring(7);
					System.out.println("ɾ�� ��" + sentence);
				    checkSt = intercon.createStatement();
				    checkRs = checkSt.executeQuery(sentence);
					
					//ִ��������������ͬ��ɾ������
					int result = 0;
					try {
					    if (checkRs != null && checkRs.next())
					        result = delSt.executeUpdate(sql);
					    else
					        upStr += id + ",";
					   if (result > 0) upStr += id + ",";
					   if (delSt!=null) delSt.close();
					} catch (Exception e) {
						isFail = 1;
						e.printStackTrace();
						break;
					}
				    
				}
                //end -- ɾ��
			}
			try {
			   if (!"".equals(upStr)) {
			      webcon.setAutoCommit(false);
			      exst = webcon.createStatement();
			      sql = "update operatorLog set status=0 where logID in (" + upStr.substring(0, upStr.length()-1) + ")";
			      System.out.println(sql);
			      int result = exst.executeUpdate(sql);
			      if (result > 0) {
			          webcon.commit();
			          intercon.commit();
				      webcon.setAutoCommit(true);
			          intercon.setAutoCommit(true);
			      } else intercon.rollback();
			   }
			} catch (Exception e) {
			    intercon.rollback();
			    webcon.rollback();
			    e.printStackTrace();
			}
			if(tmprs!=null) tmprs.close(); tmprs = null;
			if(tmpst!=null) tmpst.close(); tmpst = null;
			fccLog.info("----------------------------����"+table+"�������������-----����----------------------------");
		  }
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
			   if(rs!=null) rs.close(); rs = null;
			   if(st!=null) st.close(); st = null;
			   if (webrs!=null) webrs.close(); webrs=null;
			   if (webst!=null) webst.close(); webst=null;
			   if (intercon!=null) intercon.close(); intercon=null;
			   if (webcon!=null) webcon.close(); webcon=null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}

