/*
 * �������� 2007-1-18
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

/**
 * @author ���ܶ�
 * ���ͣ�һЩ���õķ�������.
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
import org.w3c.dom.*;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.common.xml.*;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.CodeSource;
import java.security.ProtectionDomain;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import base.util.DBconnection;


public class TalentFunctions {
	
	 	private final static java.text.SimpleDateFormat _sdfAll = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    private final static java.text.SimpleDateFormat _sdfYear = new java.text.SimpleDateFormat("yyyy");
	    private final static java.text.SimpleDateFormat _sdfTime = new java.text.SimpleDateFormat("yyyyMMdd");
	    private final static java.text.SimpleDateFormat _sdfAllT = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    private final static String _classPathName = "/WEB-INF/classes/";
	    private final static java.text.SimpleDateFormat _sdfCn = new java.text.SimpleDateFormat("yyyy��MM��dd��");
	    private final static String charString = ",.?;:'\"\\!@#$%^&*(){}[]|<>/������������������~����#��%����������������  ";

	    
	    
	    
	    /**
	     * ��HttpServletRequest��ȡ����Ч���ַ������Ѿ�����null�ж�
	     * @param request HttpServletRequest����
	     * @param param ��Ҫ��ȡ�Ĳ�������
	     * @return ����ֵ
	     */
	    public  static  String getParam(HttpServletRequest request, String param){
	        return getAvailStr(request.getParameter(param));
	    }
	    
	    public  static  String getParamHtml(HttpServletRequest request, String param){
	        return getAvailStrHtml(request.getParameter(param));
	    }
		public  static  String getPCN(HttpServletRequest request, String param){
	        String pa="";
	        try{
	        	pa=new String(getParam(request, param).getBytes( "8859_1" ), "gbk" );
	        }
	        catch(Exception e){}
	        return pa;
	    }
		
		/**
	     * ��int����ת��Ϊ����λ���ַ���
	     * @return ת�����ַ���
	     */
	    public static String getStringDigit(int number,int digit) {
	      String temp=String.valueOf(number);
	      StringBuffer sb=new StringBuffer();
	      for(int i=temp.length();i<digit;i++){
	      	sb.append("0");
	      }
	      sb.append(temp);
	      return sb.toString();
	    }
		public static Integer getInteger(String str){
			Integer i=null;
			try{
				i=Integer.valueOf(str);
			}
			catch (Exception e) {
				
			}
			return i;
		}
		
		public static int getInt(String str,int n){
			int i=n;
			try{
				i=Integer.parseInt(str);
			}
			catch (Exception e) {
				
			}
			return i;
		}
		
		public static int getInt(String str){
			return getInt(str,0);
		}
		
		public static int getIntegerToInt(Integer integer){
			if(integer==null)
				return 0;
			else {
				return integer.intValue();
			}
		}
		
		public static Integer getIntegerParam(HttpServletRequest request, String param){
			return getInteger(request.getParameter(param));
		}
		
		public static Double getDouble(String str){
			Double d=null;
			try{
				d=Double.valueOf(str);
			}
			catch (Exception e) {
				
			}
			return d;
		}
		
		public static Double getDoubleParam(HttpServletRequest request, String param){
			return getDouble(request.getParameter(param));
		}
	    /**
	     * ���������ַ���ת�����
	     * @return ת�����ַ���
	     */
	    public static String gb2iso(String s) {
	      try {
	         return new String(s.getBytes( "gbk" ), "8859_1" );
	  	  } catch(Exception e) {
	  		return "can't convert";
	      }
	    }
	  
	   public static String iso2gb(String s) {
	     try {
	         return new String(s.getBytes( "8859_1" ), "gbk" );
	  	} catch(Exception e) {
	  		return "can't convert";
	  	}
	  }
	    
	   public static String getJidu(String str){
		   if(str==null||str.length()!=5){
			   return str;
		   }
		   else
			   return  str.substring(0,4)+"��"+str.substring(4,5)+"��";
	   }
	    
	    
	    /**
		* ��java.util.Date��������ת��Ϊyyyy-MM-dd��ʽ�����ַ���
		*
		* @param date java.util.Date��������
		* @return yyyy-MM-dd��ʽ�����ַ���
		*/
		public static String formatUtilDate(java.util.Date date) {
			if (date == null) return "";
			return _sdfAll.format(date);
		}
		//* @return yyyy-MM-dd HH:mm:ss ��ʽ�����ַ���
		public static String formatUtilDateT(java.util.Date date) {
			if (date == null) return "";
			return _sdfAllT.format(date);
			}
		public static String formatUtilDateT(Object date) {
			if (date == null) return "";
			try{
				return _sdfAllT.format((java.util.Date)date);
			}
			catch(Exception e){
				return "";
			}
			}
		
		/**
		* ��yyyy-MM-dd��ʽ�����ַ���ת�������ꡢ�¡��շֱ��������
		*
		* @param date yyyy-MM-dd�ַ���
		* @return Stirng [] ����
		*/
		public static  String[] convertDate(String date){
			String [] ymd={"","",""} ;
			if(date!=null&&!date.equals("")&&date.indexOf("-")>0) {
			    ymd[0]=date.substring(0,date.indexOf("-"));
			    ymd[1]=date.substring(date.indexOf("-")+1,date.lastIndexOf("-"));
			    ymd[2]=date.substring(date.lastIndexOf("-")+1);
			}
			return ymd;
		}
		
		/**
		* ��yyyy-MM-dd��ʽ�����ַ���ת��������������ʽ
		*
		* @param date yyyy-MM-dd�ַ���
		* @return Stirng 
		*/
		public static  String DateForCN(String date){
			String dateCN="";
			try{
				if(date!=null&&!date.equals("")&&date.indexOf("-")>0) {
					String [] ymd=convertDate(date) ;
					dateCN=Integer.valueOf(ymd[0])+"��"+Integer.valueOf(ymd[1])+"��"+Integer.valueOf(ymd[2])+"��";
				}
				else 
					date="   ���ꡡ���¡�����";
			}
			catch(Exception e){
				e.printStackTrace();
			}
		return dateCN;
		}
		
		public static  String DateForCN(Date date){
			return DateForCN(formatUtilDate(date));
		}
		
		public static  String DateForCN(Object date){
			return DateForCN(getAvailStr(date));
		}
		/**
		* ��java.util.Date��������ת��Ϊyyyy-MM-dd��ʽ�����ַ���
		*
		* @param date java.util.Date��������
		* @return yyyyMMdd��ʽ�����ַ���
		*/
		public static String formatUtilDateSdfTime(java.util.Date date) {
			if (date == null) return "";
			return _sdfTime.format(date);
		}
		
		public static String formatUtilDateCnTime(java.util.Date date) {
			if (date == null) return "";
			return _sdfCn.format(date);
		}
		                                                                                
		
		/**
		* ��ȡ������������С��һ��
		*
		* @param Date1
		* @param Date2
		* @param Date3
		* @return date_temp
		*/
		public static java.util.Date compareDate(java.util.Date Date1, java.util.Date Date2, java.util.Date Date3) {
		
		java.util.Date date_temp = null;
		if (Date1 != null) {
		    if (Date2 == null) {
		        date_temp = Date1;
		    } else {
		        if (Date1.compareTo(Date2) <= 0) {
		            date_temp = Date1;
		        } else {
		            date_temp = Date2;
		        }
		    }
		} else {
		    date_temp = Date2;
		}
		
		if (Date3 != null) {
		    if (date_temp == null) {
		        date_temp = Date3;
		    } else {
		        if (Date3.compareTo(date_temp) <= 0) {
		            date_temp = Date3;
		        }
		    }
		}
		
		return date_temp;
		}
		
		/**
		* ��option��value�Ƚϣ������򷵻ؿ��ַ��������򷵻�selected
		*
		* @param option        �������ֵ
		* @param value         �Ƚ�ֵ
		* @param defaultOption �Ƿ�ȱʡֵ������valueΪ��ʱ����selected
		* @return ���ַ�����selected
		*/
		public static String checkOptionSelected(String option, String value,
		                                     boolean defaultOption) {
			if (option == null) return "";
			if (defaultOption && value == null) return "selected";
			if (value == null) return "";
			
			if (option.equals(value))
			    return "selected";
			else
			    return "";
		}
		
		/**
		* ���ַ���������2003-10-18ת��Ϊjava.util.Date����
		*
		* @param date ����2003-10-18
		* @return java.util.Date
		*/
		public static Date stringToDate(String date) {
		try {
		    return new SimpleDateFormat("yyyy-MM-dd").parse(date);
		} catch (ParseException e) {
		    return null;
		}
		}
		
		/**
		* ���ַ���������2003-10-18 12:00:00ת��Ϊjava.util.Date����
		*
		* @param date ����2003-10-18
		* @return java.util.Date
		*/
		public static Date stringToDateTime(String date) {
		try {
		    return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
		} catch (ParseException e) {
		    return null;
		}
		}
		/**
		* ��һ������ʱ���ַ���ת��Ϊһ�����ڵ��ַ������������ڿո���ʱ��س�
		*
		* @param str 2003-09-23 13:00:00.000
		* @return 2003-09-23
		*/
		public static String cutDateStr(String str) {
			if (str == null) return "";
			if (str.length() <= 0) return "";
			int index = str.trim().indexOf(" ");
			if (index >= 0)
			    return str.substring(0, index);
			else
			    return str;
		}
		
		
		
		/**
		* �������ݵĶ����ָ��ַ�
		*
		* @param delbox String[]
		* @return String
		*/
		public static String arrayToCommaString(String[] delbox) {
			StringBuffer sb = new StringBuffer("-99999");
			for (int i = 0; i < delbox.length; i++) {
			    sb.append(",").append(delbox[i]);
			}
			return sb.toString();
		}
		
		/**
		* �������ݵĶ����ָ��ַ�
		*
		* @param delbox int[]
		* @return String
		*/
		public static String arrayToCommaString(long[] delbox) {
			StringBuffer sb = new StringBuffer("-99999");
			for (int i = 0; i < delbox.length; i++) {
			    sb.append(",").append(delbox[i]);
			}
			return sb.toString();
		}
		
		/**
		* ���ַ�������ת�ɳ���������
		*
		* @param strs String[]
		* @return long[]
		*/
		public static long[] strArr2longArr(String[] strs) {
			if (strs == null) return null;
			long[] longArr = new long[strs.length];
			for (int i = 0; i < strs.length; i++) {
			    longArr[i] = Long.parseLong(strs[i]);
			
			}
			return longArr;
		}
		

		/**
		* ��SQL����еĶ���'�޸�Ϊ��������''
		*
		* @param str
		* @return
		*/
		public static String checkComma(String str) {
			return str == null ? "" : str.replaceAll("'", "''");
		}
		
		/**
		* ȥ������������������0
		*
		* @param areaCode
		* @return
		*/
		public static StringBuffer rtrimAreaCode(StringBuffer areaCode) {
			for (int i = areaCode.length(); i > 0; i--) {
			    if (areaCode.charAt(i - 1) == '0') {
			        areaCode.delete(i - 1, areaCode.length());
			    } else {
			        break;
			    }
			}
			return areaCode;
		}
		
		/**
		*
		*/
		public static String convertNulltoString(String s) {
			return (s == null) ? "" : s;
		}
		
		public static String getDateYear(Date date) {
			return _sdfYear.format(date);
		}
		
		/**
		* ���ϴ����ļ����в�������
		*
		* @param fileName String
		* @return
		*/
		public static String spellFileName(String fileName) {
			if (fileName != null) {
			    int tmp = fileName.lastIndexOf(".");
			    String tempFileNameFirst = fileName.substring(0, tmp);
			    String tempFileNameSecond = fileName.substring(tmp, fileName.length());
			    fileName = tempFileNameFirst + _sdfTime.format(new Date()) +
			            tempFileNameSecond;
			}
			return fileName == null ? "" : fileName;
		}
		
		
		/**
		* Given a Class object, attempts to find its .class location [returns null
		* if no such definition can be found]. Use for testing/debugging only.
		*
		* @return URL that points to the class definition [null if not found].
		*/
		public static URL getClassLocation(final Class cls) {
			if (cls == null) throw new IllegalArgumentException("null input: cls");
			
			URL result = null;
			
			final String clsAsResource = cls.getName().replace('.',
			        '/').concat(".class");
			
			final ProtectionDomain pd = cls.getProtectionDomain();
			// java.lang.Class contract does not specify if 'pd' can ever be null;
			// it is not the case for Sun's implementations, but guard against null
			// just in case:
			if (pd != null) {
			    final CodeSource cs = pd.getCodeSource();
			    // 'cs' can be null depending on the classloader behavior:
			    if (cs != null) result = cs.getLocation();
			
			    if (result != null) {
			        // Convert a code source location into a full class file location
			        // for some common cases:
			        if ("file".equals(result.getProtocol())) {
			            try {
			                if (result.toExternalForm().endsWith(".jar") ||
			                        result.toExternalForm().endsWith(".zip"))
			                    result = new URL("jar:".concat(result.
			                            toExternalForm())
			                            .concat("!/").concat(clsAsResource));
			                else if (new File(result.getFile()).isDirectory())
			                    result = new URL(result, clsAsResource);
			            } catch (MalformedURLException ignore) {
			            }
			        }
			    }
			}
			
			if (result == null) {
			    // Try to find 'cls' definition as a resource; this is not
			    // document��d to be legal, but Sun's implementations seem to         //allow this:
			    final ClassLoader clsLoader = cls.getClassLoader();
			
			    result = clsLoader != null ?
			            clsLoader.getResource(clsAsResource) :
			            ClassLoader.getSystemResource(clsAsResource);
			}
			
			return result;
		}
		
		
		/**
		* �����Ч���ַ���,��objΪ��ʱ�����ء�������Ϊ�գ�����toString����
		*
		* @param Obj
		* @return ��Ч���ַ���
		*/
		public static String getAvailStr(Object Obj) {
			if (Obj == null)
			    return "";
			else
			    return Obj.toString();
		}
		public static String getAvailStrHtml(Object Obj) {
			if (Obj == null)
			    return "&nbsp;";
			else
			    return Obj.toString();
			}
		public static boolean isCanAddandModi(String roleCode_user, String roleCode_record) {
			return roleCode_user.equals(roleCode_record);
		
		}
		
		
		public static boolean isCan(String flag) {
			return (flag.equals("true")||flag.equals("yes"));
		
		}
		
		/**
	 	 * ��̬�������滻�û������ַ����еķǷ��ַ�
	 	 * @param str �û�������ַ���
	 	 * @return ת������ַ���
	 	 */

		public static String transformHtmlTags( String str ){
			if ( str == null || str.length() < 1 )
			{
				return str;
			}
			StringBuffer buf = new StringBuffer( str.length() + 6 );
			char ch = ' ';
			for ( int i = 0; i < str.length(); i++ )
			{
				ch = str.charAt( i );
				if ( ch == '<' )
				{
					buf.append( "&lt;" );
				}
				else if ( ch == '>' )
				{
					buf.append( "&gt;" );
				}
				else if ( ch == '\n' )
				{
					buf.append( "<br>" );
				}
				else if ( ch == '\r' )
				{
					buf.append( "" );
				}
				else if ( ch == ' ' )
				{
					buf.append( "&nbsp;" );
				}
				else if ( ch == '\'' )
				{
					buf.append( "&acute" );
				}
				else
				{
					buf.append( ch );
				}
			}
			return buf.toString().trim();
		}

		
		/**
	 	 * ��̬�������滻�û������ַ����еķǷ��ַ�
	 	 * @param str �û�������ַ���
	 	 * @return ת������ַ���
	 	 */

		public static String transformWordTags( String str )
		{
			str=getAvailStr(str);
			StringBuffer buf = new StringBuffer( str.length() + 6 );
			char ch = ' ';
			for ( int i = 0; i < str.length(); i++ )
			{
				ch = str.charAt( i );
				
				if ( ch == '\r' )
				{
					buf.append( "" );
				}
				else if ( ch == '\n' )
				{
					buf.append( "\\n" );
				}
				else
				{
					buf.append( ch );
				}
			}
			return buf.toString().trim().replaceAll("\"", "\\\"");
		}
		
		public static String transformWordTags( Object strObject )
		{
			return transformWordTags(getAvailStr(strObject));
		}
		 

		/**
		 * ��ʽ�磺22|33|4|30|23|24|30|44
		 * ȥ���ظ������֣��������30��ֻ����һ��
		 * ���κ�:22|33|4|30|23|24|44
		 * @param checkName
		 * @return
		 */
		public static String getShortFormat(String  flagFlow) {
			 StringTokenizer st = new StringTokenizer(flagFlow,"|");
		     Vector v = new Vector();
			 while (st.hasMoreTokens()) {
				 String s = (String)st.nextToken();
				 if(v.contains(s)==false){
					 v.add(s);
				 }	         
		     }
			 
			 System.out.println("Vector is:" + v);
			 
			 String value="";
			 for(int i=0;i<v.size();i++){
					 value=value+(String)v.get(i)+"|";
			 }
			return value;
		}
		
		/**
		 * 
		 * ��������ʽת�ɱ�׼��ʱ���ʽ(2000-1 --> 2000-01)
		 * @param arg
		 */
		public static String getRealDate(String str){
			String dstr=getAvailStr(str);
			if(dstr.length()==6)
				dstr=dstr.substring(0,5)+"0"+dstr.substring(5,6);
			return dstr;
		}
		
		// ȥ���ַ����е�ĳһ�ַ�����ֻȥ����һ����
		public static String subOneString(String targetString , String subString ){
		    int n = 0 ;
		    int k = targetString.indexOf(subString);
		    if(k >=0){
		        String temp1 = targetString.substring(0,k);
		        String temp2 = targetString.substring(k+subString.length(),targetString.length());
		        targetString = temp1 + temp2;
		    }
		    return targetString;
		}

	/**
	 * ��int����ת��Ϊ����λ���ַ���
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getStringDigit
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="�������Ľڵ�"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����Ҫת��������"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��Ҫת����λ��"
	 */
	public static int BL_getStringDigit(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		String param2 = (String)param.getParaObjectAt(2);
		int num=getInt(param1,0);
		int digit=getInt(param2,0);
		String result=getStringDigit(num,digit);
		XmlUtil.setNodeValue(param0,result);
		return 1;
	}
	
	/**
	 * ������������ת����������
	 */
	public static String getNumForCn(int a) {
		String[] units = { "", "ʮ", "��", "ǧ", "��", "ʮ", "��", "ǧ", "��" };
		String[] nums = { "һ", "��", "��", "��", "��", "��", "��", "��", "��", "ʮ" };
		String result = "";
		if (a < 0) {
			result = "��";
			a = Math.abs(a);
		}
		String t = String.valueOf(a);
		for (int i = t.length() - 1; i >= 0; i--) {
			int r = (int) (a / Math.pow(10, i));
			if (r % 10 != 0) {
				String s = String.valueOf(r);
				String l = s.substring(s.length() - 1, s.length());
				result += nums[Integer.parseInt(l) - 1];
				result += (units[i]);
			} else {
				if (a % 10 != 0) {
				if (!result.endsWith("��")) {
					result += "��";
				} }
			}
		}
		if (a>=10 && a<20)
			result = result.substring(1);
		
		return result;
	}
	
	/**
	 * ��ýڵ�Ԫ�ص���ĳ���ӽڵ��ֵ��û�и��ӽڵ��򷵻�null��
	 */
	public  static String getNodeValueByTagName(Element element,String nodeName){
		try{
			if(element.getElementsByTagName(nodeName).getLength()>0)
            	return element.getElementsByTagName(nodeName).item(0).getFirstChild().getNodeValue();
			else 
				return null;
		}
		catch(Exception e){
			return null;
		}
		
	}
	
	/**
	 * ��ýڵ�Ԫ�ص���ĳ���ӽڵ��ֵ��û�и��ӽڵ��򷵻�""��
	 */
	public  static String getNodeValueByTagNameExcludeNull(Element element,String nodeName){
		try{
			if(element.getElementsByTagName(nodeName).getLength()>0)
            	return element.getElementsByTagName(nodeName).item(0).getFirstChild().getNodeValue();
			else 
				return "";
		}
		catch(Exception e){
			return "";
		}
		
	}
	
	/**
	 * ɾ��ĳ���ڵ���������ӽڵ�
	 */
	public  static void delChildNotesAll(Node node) throws Exception{
		NodeList nodeList=node.getChildNodes();
		for(int i=0;i<nodeList.getLength();i++){
			Node newnode=nodeList.item(i);
			node.removeChild(newnode);
		}
	}
	
	/**
     * �������ڼ�N ��
     * 
     * @return
     */
    public static Date addDays(Date cundate , int n) {
        Date result = null;
        GregorianCalendar gc1 = new GregorianCalendar();
        gc1.setTime(cundate);
        gc1.add(Calendar.DATE, n);
        result = gc1.getTime();
        return result;
    }

    /**
     * �������ڼ�N ��
     * 
     * @return
     */
    public static String addDays(String cundate , int n ) {
        String result = null;
        Date date = addDays(stringToDate(cundate),n);
        result = formatUtilDate(date);
        return result;
    }
    /**
     * ������������֮���������������Ϊ����
     * 
     * @param date1
     * @param date2
     * @return
     */
    public static int diffdates(String date1, String date2) {
        int result = 0;
        //SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd
        // HH:mm:ss");
        ElapsedTime et = new ElapsedTime();

        GregorianCalendar gc1 = new GregorianCalendar();
        GregorianCalendar gc2 = new GregorianCalendar();
        
        gc1.setTime(stringToDate(date1));
        gc2.setTime(stringToDate(date2));
        result = et.getDays(gc1, gc2);

        return result;
    }
	
    /**
     * ������������֮����������,�����Ϊ������
     * 
     * @param date1
     * @param date2
     * @return
     */
    public static int diffdatesExt(String date1, String date2) {
        int result = 0;
        ElapsedTime et = new ElapsedTime();

        GregorianCalendar gc1 = new GregorianCalendar();
        GregorianCalendar gc2 = new GregorianCalendar();
        
        Date newDate1 = stringToDate(date1);
        Date newDate2 = stringToDate(date2);
        gc1.setTime(newDate1);
        gc2.setTime(newDate2);
        result = et.getDays(gc1, gc2);
        if(newDate1.compareTo(newDate2)>0){
        	result = result * -1;
        }

        return result;
    }
    
    /* ���ͷֽ�֪ͨ��LED
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getStringDigit
	 * @bizlet_param passing="in_out" type="Field" value="/" name="" desc="�������Ľڵ�"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����Ҫ�ֽ���ַ���"
	 */
	public static int BL_splitNoticeToLed(Document doc, BizContext param) throws Exception{
		int nextindex = 0;
		int tmplen = 0;
		String tmp = "֪ͨ��";
		String content = "";
		String date = "";
		String time = "";
		String sql = "insert into Led values(?,?,?,?,?)";
		DBconnection db = new DBconnection();
		Connection conn = db.getEOSConnection();
		Statement stm = conn.createStatement();
		PreparedStatement pst = conn.prepareStatement(sql);
		ArrayList strlist = new ArrayList();
		Node param0 = (Node)param.getParaObjectAt(0);
		String notice = (String)param.getParaObjectAt(1);
		String oldtitle = (String)param.getParaObjectAt(2);
		String newtitle = (String)param.getParaObjectAt(3);
		String oldtime = ((String)param.getParaObjectAt(4)).substring(2);
		String newtime = ((String)param.getParaObjectAt(5)).substring(2);
		String oldplace = (String)param.getParaObjectAt(6);
		String newplace = (String)param.getParaObjectAt(7);
		String classname = (String)param.getParaObjectAt(8);
		String begin = (String)param.getParaObjectAt(9);
		String end = (String)param.getParaObjectAt(10);
		int adjustid = Integer.parseInt((String)param.getParaObjectAt(11));
		String delsql = "delete from Led where datediff(dd,endTime,getdate())>0 or courseAdjustid=" + adjustid;
		
		//if (notice.length()<126) {
           ///////////////////////////////����༶����////////////////////////////
		   tmp = tmp + classname;
		   if (tmp.length()<18) {
			   strlist.add(nextindex,trimchar(tmp));
			   nextindex++;
			   tmp = "";
		   } else {
		   	   strlist.add(0,trimchar(tmp.substring(nextindex, 18)));
		   	   content = tmp.substring(18);
		   	   nextindex++;
		   	   tmp = "";
		   }
           ///////////////////////////////����ԭʱ��////////////////////////////
		   tmp = content + oldtime;
		   tmplen = content.length() + 7;
		   if (tmplen<18) {
		      content = tmp;
		      tmp = "";
		   } else {
		   	  date = oldtime.split(" ")[0];
		   	  time = oldtime.split(" ")[1];
		   	  tmplen = content.length() + 4;
		   	  if (tmplen > 18) {
		   	      tmp = content;
		   	      strlist.add(nextindex,trimchar(tmp));
		   	      tmp = "";
		   	      content = oldtime;
		   	      tmplen = 7;
			   	  nextindex++;
		   	  } else {
		   	      tmplen = tmplen + 3;
		   	      if (tmplen > 18) {
				   	  tmp = content + date;
				   	  strlist.add(nextindex,trimchar(tmp));
				   	  tmp = "";
				   	  content = time;
				   	  tmplen = 3;
				   	  nextindex++;
		   	      } else {
		   	          tmp = content + oldtime;
			   	      strlist.add(nextindex,trimchar(tmp));
			   	      tmp = "";
			   	      content = "";
			   	      tmplen = 0;
			   	      nextindex++;
		   	      }
		   	  }
		   }
		   
		   ///////////////////////////////����������////////////////////////////
		   if (!newtitle.equals(oldtitle)) {
		   	  tmp = " ԭ " + oldtitle + " ��Ϊ " + newtitle;
		   	  int templen = tmplen + (" ԭ " + oldtitle + " ��Ϊ " + newtitle).length();
		   	  
		   	     if (templen>18) {
		   	     	//����ʣ������ʱ��
		   	        strlist.add(nextindex,trimchar(content + tmp.substring(0,(18-tmplen))));
	   	            content = tmp.substring(18-tmplen);
	   	            nextindex++;
		   	        while (content.length()>18) {
		   	           tmp = content.substring(0, 18);
		   	           strlist.add(nextindex,trimchar(tmp));
		   	           content = content.substring(18);
		   	           nextindex++;
		   	        }
		   	        tmp = "";
		   	     } else {
		   	        strlist.add(nextindex,trimchar(content+tmp));
		   	        nextindex++;
		   	        content = "";
		   	     }
		   	  
		   } else {
		   	  tmp = " ԭ " + oldtitle;
		   	  int templen = tmplen + (" ԭ " + oldtitle).length();
		   	  
		   	     if (templen>18) {
		   	     	//����ʣ������ʱ��
		   	        strlist.add(nextindex,trimchar(content + tmp.substring(0,(18-tmplen))));
	   	            content = tmp.substring(18-tmplen);
	   	            nextindex++;
		   	        while (content.length()>18) {
		   	           tmp = content.substring(0, 18);
		   	           strlist.add(nextindex,trimchar(tmp));
		   	           content = content.substring(18);
		   	           nextindex++;
		   	        }
		   	        tmp = "";
		   	     } else {
		   	        strlist.add(nextindex,trimchar(content+tmp));
		   	        nextindex++;
		   	        content = "";
		   	     }
		   }
		   
           //////////////////////////////����ʱ�����////////////////////////////
		   if (!newtime.equals(oldtime)) {
		   	  tmp = content + " ���� " + newtime;
		   	  tmplen = (content + " ���� ").length() + 7;
		   	  if (tmplen>18) {
		   	     date = newtime.split(" ")[0];
		   	     time = newtime.split(" ")[1];
		   	     
		   	     tmp = content + " ���� " + date;
		   	     tmplen = (content + " ���� ").length() + 4;
		   	     if (tmplen<18) {
		   	        strlist.add(nextindex,trimchar(tmp));
			   	    tmp = "";
		   	        content = time;
		   	        tmplen = 3;
		   	        nextindex++;
		   	     } else {
		   	        strlist.add(nextindex,trimchar(content + " ���� "));
			   	    tmp = "";
		   	        content = newtime;
		   	        tmplen = 7;
		   	        nextindex++;
		   	     }
		   	  } else {
		   	     strlist.add(nextindex,trimchar(tmp));
		   	     nextindex++;
		   	     tmplen = 0;
		   	     content = "";
		   	     tmp = "";
		   	  }
		   }
		   
           ///////////////////////////////����ص����////////////////////////////
		   if (!newplace.equals(oldplace)) {
		   	
		   	  tmp = " ԭ�Ͽεص���� " + newplace;
		   	  int templen = tmplen + (" ԭ�Ͽεص���� " + newplace).length();
		   	  
		   	  if (templen>18) {
	   	     	//����ʣ������ʱ��
	   	        strlist.add(nextindex,trimchar(content + tmp.substring(0,(18-tmplen))));
   	            content = tmp.substring(18-tmplen);
   	            nextindex++;
	   	        while (content.length()>18) {
	   	           tmp = content.substring(0, 18);
	   	           strlist.add(nextindex,trimchar(tmp));
	   	           content = content.substring(18);
	   	           nextindex++;
	   	        }
	   	        tmp = "";
	   	      } else {
	   	        strlist.add(nextindex,trimchar(content+tmp));
	   	        nextindex++;
	   	        content = "";
	   	      }
		   	  
		   } else {
		   	  tmp = " �Ͽεص��� " + oldplace;
		   	  int templen = tmplen + (" �Ͽεص��� " + oldplace).length();
		   	  
		   	  if (templen>18) {
	   	     	//����ʣ������ʱ��
	   	        strlist.add(nextindex,trimchar(content + tmp.substring(0,(18-tmplen))));
 	            content = tmp.substring(18-tmplen);
 	            nextindex++;
	   	        while (content.length()>18) {
	   	           tmp = content.substring(0, 18);
	   	           strlist.add(nextindex,trimchar(tmp));
	   	           content = content.substring(18);
	   	           nextindex++;
	   	        }
	   	        tmp = "";
	   	      } else {
	   	        strlist.add(nextindex,trimchar(content+tmp));
	   	        nextindex++;
	   	        content = "";
	   	      }
		   }
		   
		   if (!"".equals(content)) {
		   	  strlist.add(nextindex,trimchar(content));
		   }
		   
		//}
		
		try {
		   conn.setAutoCommit(false);
		   int result = stm.executeUpdate(delsql);
		
		   for (int i=1;i<=strlist.size();i++) {
			  String temp = (String)strlist.get(i-1);
			  System.out.println(temp);
			  pst.setString(1,temp);
			  pst.setString(2,begin);
			  pst.setString(3,end);
			  pst.setInt(4,i);
			  pst.setInt(5, adjustid);
			  pst.executeUpdate();
		   }
		   for (int j=(strlist.size()+1);j<=7;j++) {
			  pst.setString(1,"");
			  pst.setString(2,begin);
			  pst.setString(3,end);
			  pst.setInt(4,j);
			  pst.setInt(5, adjustid);
			  pst.executeUpdate();
		   }
		   conn.commit();
		} catch (Exception e) { 
			e.printStackTrace(); 
		    return -1;
		} finally {
			try {
				if (conn!=null) conn.close();
				if (stm!=null) stm.close();
			} catch (Exception ex) {ex.printStackTrace();}
		}
		
		return 1;
	}
	
	public static String trimchar(String str) {
		if (str != null && !"".equals(str)) {
           String result = str.substring(0,1);
        
           if (charString.indexOf(result)>=0) {
        	   str = str.substring(1);
           }
		}

        return str;
    }
	
	/* ����ÿ��֪ͨ��Ϣ��LED
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getStringDigit
	 * @bizlet_param passing="in_out" type="Field" value="/" name="" desc="�������Ľڵ�"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����Ҫ�ֽ���ַ���"
	 */
	public static int BL_sendNoticeToLed(Document doc, BizContext param) throws Exception{
		String sql = "insert into Led values(?,?,?,?,?)";
		DBconnection db = new DBconnection();
		Connection conn = db.getEOSConnection();
		Statement stm = conn.createStatement();
		PreparedStatement pst = conn.prepareStatement(sql);
		String begin = (String)param.getParaObjectAt(0);
		String end = (String)param.getParaObjectAt(1);
		int adjustid = Integer.parseInt((String)param.getParaObjectAt(2));
		NodeList lines = (NodeList)param.getParaObjectAt(3);
		String delsql = "delete from Led where datediff(dd,endTime,getdate())>0 or courseAdjustid=" + adjustid;
		
		try {
			 conn.setAutoCommit(false);
			 int result = stm.executeUpdate(delsql);
			 for (int i=1;i<=lines.getLength();i++) {
				  String temp = "";
				  for (int j=0;j<lines.getLength();j++) {
				     NamedNodeMap attrMap = lines.item(j).getAttributes();
				     int index = Integer.parseInt(XmlUtil.getNodeValue(attrMap.getNamedItem("hciTagIndex")));
				     if (index == (i-1))
					    temp = XmlUtil.getNodeValue(lines.item(j));
				  }
				  System.out.println(temp);
				  pst.setString(1,temp);
				  pst.setString(2,begin);
				  pst.setString(3,end);
				  pst.setInt(4,i);
				  pst.setInt(5, adjustid);
				  pst.executeUpdate();
			 }
			 conn.commit();
		} catch (Exception e) { 
			e.printStackTrace(); 
		    return -1;
		} finally {
			try {
				if (conn!=null) conn.close();
				if (stm!=null) stm.close();
			} catch (Exception ex) {ex.printStackTrace();}
		}
		
		return 1;
	}
	
	public static void  main(String arg[]){
	    String aa = "babcde";
	    String bb = "bc" ;
	    int k = aa.indexOf(bb);
	    if(k >=0){
	        String temp1 = aa.substring(0,k);
	        String temp2 = aa.substring(k+bb.length(),aa.length());
	        aa = temp1 + temp2;
	    }
	    System.out.println(aa);
	}
	/**
	 * ɾ���ַ����е�һ���ַ�������һ����
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_subStringOnlyOne
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="�������Ŀ���ַ���"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����Ҫɾ�����ַ���"
	 */
	public static int BL_subStringOnlyOne(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		String target = param0.getFirstChild().getNodeValue();
		String temp = subOneString(target,param1);
		if(temp.equals(target)){
		    for(int i = 2; i < param.getLength(); i++)
            {
                String s1 = (String)param.getParaObjectAt(i);
                String temp2 = subOneString(target,s1);
                if(!temp2.equals(target)){
                    XmlUtil.setNodeValue(param0,temp2);
                    break;
                }
            }

		}
		else{
		    XmlUtil.setNodeValue(param0,temp);
		}
		return 1;
	}
}
