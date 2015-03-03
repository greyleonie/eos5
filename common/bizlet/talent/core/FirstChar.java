/*
 * �������� 2007-4-10
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

import org.w3c.dom.Document;
import org.w3c.dom.Node;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;

/**
 * @author tim
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class FirstChar {
	/**
	 * Title:��ú��ֵ�ƴ������ĸ
	 * Description: GB 2312-80 ����¼�ĺ��ֳַ���������һ�������ǳ��ú��֣��� 3755 ����
	 * ���� 16��55 ����������ƴ����ĸ������˳�����У��ڶ��������Ǵγ��ú��֣�
	 * �� 3008 �������� 56��87 ���������ף��ʻ�˳�����У����Ա�����ֻ�ܲ鵽
	 * ��һ�����ֵ���ĸ��ͬʱ�Է�����ĸ��zh��ch��sh��ֻ��ȡ����ĸ��z��c��s�� 
	 * Copyright: Copyright (c) 2004
	 * Company: 
	 * @author not attributable
	 * @version 1.0
	 */


//	 ���������λ��ת������
	  private static final int GB_SP_DIFF = 160;

//	��Ź���һ�����ֲ�ͬ��������ʼ��λ��
	  private static final int[] secPosvalueList = {
	      1601, 1637, 1833, 2078, 2274, 2302, 2433, 2594, 2787,
	      3106, 3212, 3472, 3635, 3722, 3730, 3858, 4027, 4086,
	      4390, 4558, 4684, 4925, 5249, 5600};

//	��Ź���һ�����ֲ�ͬ��������ʼ��λ���Ӧ����
	  private static final char[] firstLetter = {
	      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j',
	      'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
	      't', 'w', 'x', 'y', 'z'};

//	��ȡһ���ַ�����ƴ����
	  public static String getFirstLetter(String oriStr) {
	    String str = oriStr.toLowerCase();
	    StringBuffer buffer = new StringBuffer();
	    char ch;
	    char[] temp;
	    for (int i = 0; i < str.length(); i++) { //���δ���str��ÿ���ַ�
	      ch = str.charAt(i);
	      temp = new char[] {
	          ch};
	      byte[] uniCode = new String(temp).getBytes();
	      if (uniCode[0] < 128 && uniCode[0] > 0) { // �Ǻ���
	        buffer.append(temp);
	      }
	      else {
	        buffer.append(convert(uniCode));
	      }
	    }
	    return buffer.toString();
	  }

	  /** ��ȡһ�����ֵ�ƴ������ĸ��
	   * GB�������ֽڷֱ��ȥ160��ת����10��������ϾͿ��Եõ���λ��
	   * ���纺��"��"��GB����0xC4/0xE3���ֱ��ȥ0xA0��160������0x24/0x43
	   * 0x24ת��10���ƾ���36��0x43��67����ô������λ�����3667���ڶ��ձ��ж���Ϊ��n'
	   */

	  private static char convert(byte[] bytes) {

	    char result = '-';
	    int secPosvalue = 0;
	    int i;
	    for (i = 0; i < bytes.length; i++) {
	      bytes[i] -= GB_SP_DIFF;
	    }
	    secPosvalue = bytes[0] * 100 + bytes[1];
	    for (i = 0; i < 23; i++) {
	      if (secPosvalue >= secPosvalueList[i] &&
	          secPosvalue < secPosvalueList[i + 1]) {
	        result = firstLetter[i];
	        break;
	      }
	    }
	    return result;
	  }
	  
	  public static void main(String args[]){
	  	String source="���";
	  	byte[] b=source.getBytes();
	  	char firstChar=FirstChar.convert(b);
	  	System.out.print("==============firstChar:"+firstChar);
	  }
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getFirstChar
	 * @bizlet_param passing="in_out" type="variable" value="name" name="" desc=""
	 * @bizlet_param passing="in_out" type="field" value="firstChar" name="" desc=""
	 */
	public static int BL_getFirstChar(Document doc, BizContext param) throws Exception{
		try{
		String source = (String)param.getParaObjectAt(0);
		Node node = (Node)param.getParaObjectAt(1);
		char ch=FirstChar.convert(source.getBytes());		
		char c[]=new char[1];
		c[0]=ch;
		String firstChar=new String(c);
	    XmlUtil.setNodeValue(node,firstChar);
		}catch(Exception e){
			System.out.print("=============error:"+e);
		}
		return 1;
	}
	}



