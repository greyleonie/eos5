/*
 * IC����ˢ���ն����ݺ�DB��ת���� �������� 2004-8-19 ���ߣ�Alex
 */
package talent.core;

import java.util.Calendar;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import org.w3c.dom.*;


import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;

public class CardDataConvert {

	/*
	 * ��Float���͵Ľ������ת��Ϊ���洢��6λ�ַ�������
	 */
	public static String setSumToCard(Float cardsum) {

		String cardsumStr = Integer
				.toString((int) (cardsum.floatValue() * 100F));
		//������100��ת��Ϊ�ַ���

		return criterionString(cardsumStr, 6);
	}

	/*
	 * �ڽ��յ��Ŀ����ݴ��н�ȡ���������
	 */
	public static float getSumFromCard(String rdata) {
		if (rdata.length() >= 14) {
			try {
				return Float.valueOf(rdata.substring(8, 14)).floatValue() / 100.0F;
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return -1;
	}

	/*
	 * ��Integer���͵�ʹ�ô�������ת��Ϊ���洢��4λ�ַ�������
	 */
	public static String setCardUsingTimesToCard(Integer times) {

		String cardusingtimes = Integer.toHexString(times.intValue());

		return criterionString(cardusingtimes, 4);
	}

	/*
	 * �ڽ��յ��Ŀ����ݴ��н�ȡ���������
	 */
	public static Integer getCardUsingTimesFromCard(String rdata) {
		if (rdata.length() >= 4) {
			//�洢�ڼ�¼��0��3ʮ������λ��
			try {
				return Integer.decode("0x" + rdata.substring(0, 4));
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * ��Integer���͵�userid����ת��Ϊ���洢��4λʮ�������ַ�������
	 */
	public static String setInnerCardidToCard(Integer innerCardid) {
		String innercardidStr = Integer.toHexString(innerCardid.intValue());
		return criterionString(innercardidStr, 4);
	}

	/*
	 * ��Integer���͵�cardid����ת��Ϊ���������洢��6λʮ�������ַ�������
	 */
	public static String setCardidToELock(Integer cardid) {
		String cardidStr = Integer.toHexString(cardid.intValue());
		cardidStr = criterionString(cardidStr, 6);
		return cardidStr.substring(4, 6) + cardidStr.substring(2, 4)
				+ cardidStr.substring(0, 2);
	}

	/*
	 * ��Date���͵�endtime����ת��Ϊ���������洢��ʮ�������ַ�������
	 */
	public static String setEndTimeToELock(Date endtime) {
		StringBuffer timeStr = new StringBuffer();
		int year = endtime.getYear();
		int mon = endtime.getMonth();
		timeStr.append(criterionString(Integer
				.toString(endtime.getYear() - 100), 2));
		timeStr.append(criterionString(
				Integer.toString(endtime.getMonth() + 1), 2));
		timeStr.append(setDHM(endtime));
		return timeStr.toString();
	}

	/*
	 * ��Integer���͵�usertypeid����ת��Ϊ���洢��2λʮ�������ַ�������
	 */
	public static String setUserTypeidToCard(Integer userTypeid) {
		String userTypeidStr = Integer.toHexString(userTypeid.intValue());
		return criterionString(userTypeidStr, 2);
	}

	/*
	 * ��ȡ���Ѽ�¼����Ŀ
	 */
	public static int getRecordNumFromPOS(String collectingData) {
		/*if (collectingData.length() >= 4) { //�洢�ڼ�¼��ǰ�����ֽ��У���ǰ�ͺ��
			StringBuffer tempString = new StringBuffer();
			tempString.append(collectingData.substring(2, 4)).append(
					collectingData.substring(0, 2));
			if(collectingData.length()>190000){
				return (collectingData.length()-4)/24;	//��������²ɼ����򷵻����м�¼��������ÿ12���ֽ����һ����¼��
			}else{
			try {
				return Integer.decode("0x" + tempString.toString()).intValue();
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
			}
		}
		return 0;
		*/
		return (collectingData.length()-4)/24;	//�����շѻ������⣬��ȡ�Լ����㳤�ȵķ�ʽ
	}

	/*
	 * ��ȡ�߼�����
	 */
	public static Integer getInnerCardidFromPOS(String collectingData) {
		if (collectingData.length() >= 6) {
			//�洢�ڼ�¼��1��5ʮ������λ��
			try {
				return Integer.decode("0x" + collectingData.substring(1, 6));
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * ��ȡ��ʹ�ô���
	 */
	public static Integer getCardUsingTimesFromPOS(String collectingData) {
		if (collectingData.length() >= 10) {
			//�洢�ڼ�¼��6��9ʮ������λ��
			try {
				return Integer.decode("0x" + collectingData.substring(6, 10));
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * ��ȡ�������
	 */
	public static Float getBalanceFromPOS(String collectingData) {
		if (collectingData.length() >= 15) {
			//�洢�ڼ�¼��10��14ʮ������λ�У�ǰ�ͺ��
			try {
				StringBuffer tempString = new StringBuffer();
				tempString.append(collectingData.substring(14, 15)).append(
						collectingData.substring(12, 14)).append(
						collectingData.substring(10, 12));
				return new Float(Integer.decode("0x" + tempString.toString())
						.floatValue() / 100F);
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * ��ȡ���ѽ��
	 */
	public static Float getBusinessMoneyFromPOS(String collectingData) {
		if (collectingData.length() >= 20) {
			//�洢�ڼ�¼��15��19ʮ������λ��
			try {
				return new Float(
						Integer.decode("0x" + collectingData.substring(15, 20))
								.floatValue() / 100F);
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * ��ȡ����ʱ��
	 */
	public static Date getHappeningTimeFromPOS(String collectingData) {
		if (collectingData.length() >= 24) {
			//�洢�ڼ�¼��20��23ʮ������λ��
			try {
				Date happeningtime = getDHM(collectingData.substring(20, 24));
				//������ʱ��
				happeningtime.setMonth(//������
						Integer.decode("0x" + collectingData.substring(0, 1))
								.intValue() - 1);
				Date temp=Calendar.getInstance().getTime();
				if (happeningtime.compareTo(Calendar.getInstance().getTime()) > 0) {
					//����ɼ�ʱ�������ʱ��С����ô����ʱ���Ҫ����һ��
					happeningtime.setYear(happeningtime.getYear() - 1); //������
				}
				return happeningtime;
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * ���ö�ֵ���
	 */
	public static String setFixedsumToPOS(Float fixedsum) {
		try {
			int intPart = fixedsum.intValue();
			int decimalPart = (int) (fixedsum.floatValue() * 100 - intPart * 100);
			return criterionString(new Integer(decimalPart).toString(), 2)
					+ criterionString(new Integer(intPart).toString(), 2);
		} catch (NumberFormatException ex) {
			ex.printStackTrace();
		}

		return null;
	}

	/*
	 * ���ÿ�����������
	 */
	public static String setConsumeLimitToPOS(Integer maxtimes, Integer maxsum) {
		try {
			StringBuffer ret = new StringBuffer();
			ret.append(criterionString(
					Integer.toHexString(maxtimes.intValue()), 2));
			String maxsumStr = criterionString(Integer.toHexString(maxsum
					.intValue()), 4);
			ret.append(maxsumStr.substring(2, 4));
			ret.append(maxsumStr.substring(0, 2));
			return ret.toString();
		} catch (NumberFormatException ex) {
			ex.printStackTrace();
		}

		return null;
	}

	/*
	 * ת����ʱ��
	 */
	public static Date getDHM(String dateString) {
		if (dateString.length() >= 4) {
			try {
				Date returnDate = new Date();
				int hi = Integer.decode("0x" + dateString.substring(0, 2))
						.intValue();
				int lo = Integer.decode("0x" + dateString.substring(2, 4))
						.intValue();
				returnDate.setDate(hi / 8);
				returnDate.setHours((hi % 8) * 4 + lo / 64);
				returnDate.setMinutes(lo % 64);
				return returnDate;
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * ת����ʱ��
	 */
	public static String setDHM(Date date) {
		int day = date.getDate();
		int hour = date.getHours();
		int minute = date.getMinutes();
		int byte1 = day * 8 + hour / 4;
		int byte2 = (hour % 4) * 64 + minute;

		return criterionString(Integer.toHexString(byte1), 2)
				+ criterionString(Integer.toHexString(byte2), 2);
	}

	/*
	 * �淶�ַ�����������str��ȡΪsublen���ȵ�subString�� �ַ�������С��sublen�����ַ���ǰ��0
	 * �ַ������ȴ���sublen�����ַ���ǰ����ַ���ȥ
	 */
	public static String criterionString(String str, int sublen) {
		StringBuffer result = new StringBuffer();

		int len = str.length();

		if (len < sublen) { //�жϳ��ȣ��Ա�֤�ܳ���Ϊ6
			while (len++ < sublen) {
				result.append("0");
			}
			result.append(str);
		} else {
			result.append(str.substring(len - sublen, len));
		}

		return result.toString();
	}

	/**
	 * �ڽ��յ��Ŀ����ݴ��н�ȡ������ʹ�ô���
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getCardUsingTimesFromCard
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="���ֵ·��"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="���뿨���ݴ�"
	 */
	public static int BL_getCardUsingTimesFromCard(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		if(param1!=null){
			String value=TalentFunctions.getAvailStr(getCardUsingTimesFromCard(param1));
			if(value.equals(""))
				value="0";
			XmlUtil.setNodeValue(param0,value);
		}
		return 1;
	}
	/**
	 * �ڽ��յ��Ŀ����ݴ��н�ȡ���������
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getSumFromCard
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="������·��"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="���뿨���ݴ�"
	 */
	public static int BL_getSumFromCard(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		//System.out.println(param0.getChildNodes().item(0).getNodeValue());
		String param1 = (String)param.getParaObjectAt(1);
		if(param1!=null){
			String value=TalentFunctions.getAvailStr(new Float(getSumFromCard(param1)));
			XmlUtil.setNodeValue(param0,value);
		}
		//System.out.println(param0.getChildNodes().item(0).getNodeValue());
		
		return 1;
	}
}