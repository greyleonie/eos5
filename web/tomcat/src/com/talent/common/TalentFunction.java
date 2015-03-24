package com.talent.common;

/**
 *
 * <p>Title: </p>
 *
 * <p>Description:���÷������� </p>
 *
 * <p>Copyright: Copyright (c) 2006</p>
 *
 * <p>Company:�Ϸ����� </p>
 *
 * @author csd
 * @version 1.0
 */

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.CodeSource;
import java.security.ProtectionDomain;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

public class TalentFunction {
	private final static java.text.SimpleDateFormat _sdfAll = new java.text.SimpleDateFormat(
			"yyyy-MM-dd");

	private final static java.text.SimpleDateFormat _sdfYear = new java.text.SimpleDateFormat(
			"yyyy");

	private final static java.text.SimpleDateFormat _sdfTime = new java.text.SimpleDateFormat(
			"yyyyMMdd");

	private final static java.text.SimpleDateFormat _sdfAllT = new java.text.SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	private final static String _classPathName = "/WEB-INF/classes/";

	private final static java.text.SimpleDateFormat _sdfCn = new java.text.SimpleDateFormat(
			"yyyy��MM��dd��");
	
	private final static String[] units = { "", "十", "百", "千", "万", "十", "百", "千", "亿" };

	private final static String[] nums = { "一", "二", "三", "四", "五", "六", "七", "八", "九", "十" };



	/**
	 * 从HttpServletRequest中取得有效的字符串，已经作出null判断
	 * 
	 * @param request
	 *            HttpServletRequest参数
	 * @param param
	 *            需要读取的参数名称
	 * @return 参数值
	 */
	public static String getParam(HttpServletRequest request, String param) {
		return getAvailStr(request.getParameter(param));
	}

	public static String getParamHtml(HttpServletRequest request, String param) {
		return getAvailStrHtml(request.getParameter(param));
	}

	public static String getPCN(HttpServletRequest request, String param) {
		String pa = "";
		try {
			pa = new String(getParam(request, param).getBytes("8859_1"), "gbk");
		} catch (Exception e) {
		}
		return pa;
	}

	public static Integer getInteger(String str) {
		Integer i = null;
		try {
			i = Integer.valueOf(str);
		} catch (Exception e) {

		}
		return i;
	}

	public static int getIntegerToInt(Integer integer) {
		if (integer == null)
			return 0;
		else {
			return integer.intValue();
		}
	}

	public static int getInt(Object object, int n) {
		if (object == null)
			return n;
		else {
			try {
				return Integer.parseInt(String.valueOf(object));
			} catch (Exception e) {
				return n;
			}
		}
	}

	public static int getInt(Object object) {
		return getInt(object, 0);
	}

	public static Integer getIntegerParam(HttpServletRequest request,
			String param) {
		return getInteger(request.getParameter(param));
	}

	public static Double getDouble(String str) {
		Double d = null;
		try {
			d = Double.valueOf(str);
		} catch (Exception e) {

		}
		return d;
	}

	public static Double getDoubleParam(HttpServletRequest request, String param) {
		return getDouble(request.getParameter(param));
	}

	/**
	 * 进行中文字符串转码操作
	 * 
	 * @return 转码后的字符串
	 */
	public static String gb2iso(String s) {
		try {
			return new String(s.getBytes("gbk"), "8859_1");
		} catch (Exception e) {
			return "can't convert";
		}
	}

	public static String iso2gb(String s) {
		try {
			return new String(s.getBytes("8859_1"), "gbk");
		} catch (Exception e) {
			return "can't convert";
		}
	}

	public static String getJidu(String str) {
		if (str == null || str.length() != 5) {
			return str;
		} else
			return str.substring(0, 4) + "年" + str.substring(4, 5) + "季";
	}

	/**
	 * 将java.util.Date类型日期转换为yyyy-MM-dd格式日期字符串
	 * 
	 * @param date
	 *            java.util.Date类型日期
	 * @return yyyy-MM-dd格式日期字符串
	 */
	public static String formatUtilDate(java.util.Date date) {
		if (date == null)
			return "";
		return _sdfAll.format(date);
	}

	// * @return yyyy-MM-dd HH:mm:ss 格式日期字符串ʽ�����ַ�
	public static String formatUtilDateT(java.util.Date date) {
		if (date == null)
			return "";
		return _sdfAllT.format(date);
	}

	public static String formatUtilDateT(Object date) {
		if (date == null)
			return "";
		try {
			return _sdfAllT.format((java.util.Date) date);
		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * 将yyyy-MM-dd格式日期字符串转换成以年、月、日分别存入数组
	 * 
	 * @param date
	 *            yyyy-MM-dd字符串
	 * @return Stirng [] 数组
	 */
	public static String[] convertDate(String date) {
		String[] ymd = { "", "", "" };
		if (date != null && !date.equals("") && date.indexOf("-") > 0) {
			ymd[0] = date.substring(0, date.indexOf("-"));
			ymd[1] = date.substring(date.indexOf("-") + 1, date
					.lastIndexOf("-"));
			ymd[2] = date.substring(date.lastIndexOf("-") + 1);
		}
		return ymd;
	}

	/**
	 * ��yyyy-MM-dd��ʽ�����ַ�ת��������������ʽ
	 * 
	 * @param date
	 *            yyyy-MM-dd�ַ�
	 * @return Stirng
	 */
	public static String DateForCN(String date) {
		String dateCN = "";
		try {
			if (date != null && !date.equals("") && date.indexOf("-") > 0) {
				String[] ymd = convertDate(date);
				dateCN = Integer.valueOf(ymd[0]) + "年"
						+ Integer.valueOf(ymd[1]) + "月"
						+ Integer.valueOf(ymd[2]) + "日";
			} else
				date = "   　年　　月　　日";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dateCN;
	
	}

	public static String DateForCN(Date date) {
		return DateForCN(formatUtilDate(date));
	}

	public static String DateForCN(Object date) {
		return DateForCN(getAvailStr(date));
	}

	/**
	 * ��java.util.Date��������ת��Ϊyyyy-MM-dd��ʽ�����ַ�
	 * 
	 * @param date
	 *            java.util.Date��������
	 * @return yyyyMMdd��ʽ�����ַ�
	 */
	public static String formatUtilDateSdfTime(java.util.Date date) {
		if (date == null)
			return "";
		return _sdfTime.format(date);
	}

	public static String formatUtilDateCnTime(java.util.Date date) {
		if (date == null)
			return "";
		return _sdfCn.format(date);
	}

	/**
	 * ��ȡ�����������С��һ��
	 * 
	 * @param Date1
	 * @param Date2
	 * @param Date3
	 * @return date_temp
	 */
	public static java.util.Date compareDate(java.util.Date Date1,
			java.util.Date Date2, java.util.Date Date3) {

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
	 * ��option��value�Ƚϣ������򷵻ؿ��ַ����򷵻�selected
	 * 
	 * @param option
	 *            ��-���ֵ
	 * @param value
	 *            �Ƚ�ֵ
	 * @param defaultOption
	 *            �Ƿ�ȱʡֵ������valueΪ��ʱ����selected
	 * @return ���ַ��selected
	 */
	public static String checkOptionSelected(String option, String value,
			boolean defaultOption) {
		if (option == null)
			return "";
		if (defaultOption && value == null)
			return "selected";
		if (value == null)
			return "";

		if (option.equals(value))
			return "selected";
		else
			return "";
	}

	/**
	 * ���ַ�������2003-10-18ת��Ϊjava.util.Date����
	 * 
	 * @param date
	 *            ����2003-10-18
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
	 * ��һ������ʱ���ַ�ת��Ϊһ�����ڵ��ַ��������ڿո���ʱ��س�
	 * 
	 * @param str
	 *            2003-09-23 13:00:00.000
	 * @return 2003-09-23
	 */
	public static String cutDateStr(String str) {
		if (str == null)
			return "";
		if (str.length() <= 0)
			return "";
		int index = str.trim().indexOf(" ");
		if (index >= 0)
			return str.substring(0, index);
		else
			return str;
	}

	/**
	 * ������ݵĶ����ָ��ַ�
	 * 
	 * @param delbox
	 *            String[]
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
	 * ������ݵĶ����ָ��ַ�
	 * 
	 * @param delbox
	 *            int[]
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
	 * @param strs
	 *            String[]
	 * @return long[]
	 */
	public static long[] strArr2longArr(String[] strs) {
		if (strs == null)
			return null;
		long[] longArr = new long[strs.length];
		for (int i = 0; i < strs.length; i++) {
			longArr[i] = Long.parseLong(strs[i]);

		}
		return longArr;
	}

	/**
	 * ��SQL����еĶ���'�޸�Ϊ}���''
	 * 
	 * @param str
	 * @return
	 */
	public static String checkComma(String str) {
		return str == null ? "" : str.replaceAll("'", "''");
	}

	/**
	 * ȥ���������������0
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
	 * @param fileName
	 *            String
	 * @return
	 */
	public static String spellFileName(String fileName) {
		if (fileName != null) {
			int tmp = fileName.lastIndexOf(".");
			String tempFileNameFirst = fileName.substring(0, tmp);
			String tempFileNameSecond = fileName.substring(tmp, fileName
					.length());
			fileName = tempFileNameFirst + _sdfTime.format(new Date())
					+ tempFileNameSecond;
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
		if (cls == null)
			throw new IllegalArgumentException("null input: cls");

		URL result = null;

		final String clsAsResource = cls.getName().replace('.', '/').concat(
				".class");

		final ProtectionDomain pd = cls.getProtectionDomain();
		// java.lang.Class contract does not specify if 'pd' can ever be null;
		// it is not the case for Sun's implementations, but guard against null
		// just in case:
		if (pd != null) {
			final CodeSource cs = pd.getCodeSource();
			// 'cs' can be null depending on the classloader behavior:
			if (cs != null)
				result = cs.getLocation();

			if (result != null) {
				// Convert a code source location into a full class file
				// location
				// for some common cases:
				if ("file".equals(result.getProtocol())) {
					try {
						if (result.toExternalForm().endsWith(".jar")
								|| result.toExternalForm().endsWith(".zip"))
							result = new URL("jar:".concat(
									result.toExternalForm()).concat("!/")
									.concat(clsAsResource));
						else if (new File(result.getFile()).isDirectory())
							result = new URL(result, clsAsResource);
					} catch (MalformedURLException ignore) {
					}
				}
			}
		}

		if (result == null) {
			// Try to find 'cls' definition as a resource; this is not
			// document��d to be legal, but Sun's implementations seem to //allow
			// this:
			final ClassLoader clsLoader = cls.getClassLoader();

			result = clsLoader != null ? clsLoader.getResource(clsAsResource)
					: ClassLoader.getSystemResource(clsAsResource);
		}

		return result;
	}

	/**
	 * �����Ч���ַ�,��objΪ��ʱ�����ء�������Ϊ�գ�����toString����
	 * 
	 * @param Obj
	 * @return ��Ч���ַ�
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

	public static boolean isCanAddandModi(String roleCode_user,
			String roleCode_record) {
		return roleCode_user.equals(roleCode_record);

	}

	public static boolean isCan(String flag) {
		return (flag.equals("true") || flag.equals("yes"));

	}

	/**
	 * ��̬�����滻�û������ַ��еķǷ��ַ�
	 * 
	 * @param str
	 *            �û�������ַ�
	 * @return ת������ַ�
	 */

	public static String transformHtmlTags(String str) {
		if (str == null || str.length() < 1) {
			return str;
		}
		StringBuffer buf = new StringBuffer(str.length() + 6);
		char ch = ' ';
		for (int i = 0; i < str.length(); i++) {
			ch = str.charAt(i);
			if (ch == '<') {
				buf.append("&lt;");
			} else if (ch == '>') {
				buf.append("&gt;");
			} else if (ch == '\n') {
				buf.append("<br>");
			} else if (ch == '\r') {
				buf.append("");
			} else if (ch == ' ') {
				buf.append("&nbsp;");
			} else if (ch == '\'') {
				buf.append("&acute");
			} else {
				buf.append(ch);
			}
		}
		return buf.toString().trim();
	}

	/**
	 * ��̬�����滻�û������ַ��еķǷ��ַ�
	 * 
	 * @param str
	 *            �û�������ַ�
	 * @return ת������ַ�
	 */

	public static String transformWordTags(String str) {
		str = getAvailStr(str);
		StringBuffer buf = new StringBuffer(str.length() + 6);
		char ch = ' ';
		for (int i = 0; i < str.length(); i++) {
			ch = str.charAt(i);

			if (ch == '\r') {
				buf.append("");
			} else if (ch == '\n') {
				buf.append("\\n");
			} else {
				buf.append(ch);
			}
		}
		return buf.toString().trim().replaceAll("\"", "\\\"");
	}

	public static String transformWordTags(Object strObject) {
		return transformWordTags(getAvailStr(strObject));
	}

	// ���ִ����

	/**
	 * ��ʽ�磺22|33|4|30|23|24|30|44 ȥ���ظ������֣��������30��ֻ����һ�� ���κ�:22|33|4|30|23|24|44
	 * 
	 * @param checkName
	 * @return
	 */
	public static String getShortFormat(String flagFlow) {
		StringTokenizer st = new StringTokenizer(flagFlow, "|");
		Vector v = new Vector();
		while (st.hasMoreTokens()) {
			String s = (String) st.nextToken();
			if (v.contains(s) == false) {
				v.add(s);
			}
		}

		System.out.println("Vector is:" + v);

		String value = "";
		for (int i = 0; i < v.size(); i++) {
			value = value + (String) v.get(i) + "|";
		}
		return value;
	}

	/**
	 * 
	 * ��������ʽת�ɱ�׼��ʱ���ʽ(2000-1 --> 2000-01)
	 * 
	 * @param arg
	 */
	public static String getRealDate(String str) {
		String dstr = getAvailStr(str);
		if (dstr.length() == 6)
			dstr = dstr.substring(0, 5) + "0" + dstr.substring(5, 6);
		return dstr;
	}

	/**
	 * ����-������ת����������
	 */
	public static String getNumForCn(int a) {
		String result = "";
		if (a < 0) {
			result = "负";
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
				if (!result.endsWith("零")) {
					result += "零";
				}
			}
		}
		return result;
	}
	
	public static Date getCurDate(){
		Date d = new Date();
		GregorianCalendar calendar = new GregorianCalendar(); 
		Date date =calendar.getTime();
		String curDate =_sdfAll.format(date);
		try {
			d = _sdfAll.parse(curDate);
		} catch (ParseException e) {
			// TODO �Զ���� catch ��
			e.printStackTrace();
		}
		return d;
	}
	
	public static Date getBeginOfWeek(Date someDate) {
	    Calendar begin = Calendar.getInstance();
	    begin.setTime(someDate);
	    
	    switch (begin.get(Calendar.DAY_OF_WEEK)) {
	       case Calendar.SUNDAY:
	       break;
	       case Calendar.MONDAY:
		   begin.add(Calendar.DAY_OF_MONTH, -1);
	       break;
	       case Calendar.TUESDAY:
		   begin.add(Calendar.DAY_OF_MONTH, -2);
	       break;
	       case Calendar.WEDNESDAY:
		   begin.add(Calendar.DAY_OF_MONTH, -3);
	       break;
	       case Calendar.THURSDAY:
		   begin.add(Calendar.DAY_OF_MONTH, -4);
	       break;
	       case Calendar.FRIDAY:
		   begin.add(Calendar.DAY_OF_MONTH, -5);
	       break;
	       case Calendar.SATURDAY:
		   begin.add(Calendar.DAY_OF_MONTH, -6);
	       break;
	    }
	    
	    return begin.getTime();
	}
	
	public static Date getEndOfWeek(Date someDate) {
	    Calendar end = Calendar.getInstance();
	    end.setTime(someDate);
	    
	    switch (end.get(Calendar.DAY_OF_WEEK)) {
	       case Calendar.SATURDAY:
	       break;
	       case Calendar.FRIDAY:
		   end.add(Calendar.DAY_OF_MONTH, 1);
	       break;
	       case Calendar.THURSDAY:
		   end.add(Calendar.DAY_OF_MONTH, 2);
	       break;
	       case Calendar.WEDNESDAY:
		   end.add(Calendar.DAY_OF_MONTH, 3);
	       break;
	       case Calendar.TUESDAY:
		   end.add(Calendar.DAY_OF_MONTH, 4);
	       break;
	       case Calendar.MONDAY:
		   end.add(Calendar.DAY_OF_MONTH, 5);
	       break;
	       case Calendar.SUNDAY:
		   end.add(Calendar.DAY_OF_MONTH, 6);
	       break;
	    }
	    
	    return end.getTime();
	}
	
}
