/*
 * �������� 2007-1-19
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package base.util;

import java.sql.*;

import org.apache.commons.dbutils.*;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TestDxCommon extends TestCase {
	private String testName = null;
	
	private Connection con = null;
	
	public TestDxCommon(String name) {
		super(name);
		
	}
	
	protected void setUp() throws Exception {
		DBconnection db = new DBconnection();
		con = db.getEOSConnection();
	}
	
	protected void tearDown() throws Exception {
		if(con!=null) con.close();
	}
	
	public static Test suite() {
	    TestSuite testSuite = new TestSuite();
	    testSuite.addTestSuite(TestDxCommon.class);
	   
	    return testSuite;
	  }
	
	public void testInsertStudent() throws Exception {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into StudentTest(StudentID,ClassID) values(?,?)";
		Object[] params = new Object[]{"10",""};
		runner.update(con,sql,params);
		
		
		
		
		
	}
	
	
	
	public static void main(String args[]) {
		junit.awtui.TestRunner.main(new String[]{TestDxCommon.class.getName()});
	
	}
	
	
	
	
	
	
}
