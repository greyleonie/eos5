/*
 * 创建日期 2007-1-19
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
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
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
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
