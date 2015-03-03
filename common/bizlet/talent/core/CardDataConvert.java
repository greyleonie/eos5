/*
 * IC卡和刷卡终端数据和DB的转换类 创建日期 2004-8-19 作者：Alex
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
	 * 把Float类型的金额数据转换为卡存储的6位字符串数据
	 */
	public static String setSumToCard(Float cardsum) {

		String cardsumStr = Integer
				.toString((int) (cardsum.floatValue() * 100F));
		//将余额×100并转换为字符串

		return criterionString(cardsumStr, 6);
	}

	/*
	 * 在接收到的卡数据串中截取出卡中余额
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
	 * 把Integer类型的使用次数数据转换为卡存储的4位字符串数据
	 */
	public static String setCardUsingTimesToCard(Integer times) {

		String cardusingtimes = Integer.toHexString(times.intValue());

		return criterionString(cardusingtimes, 4);
	}

	/*
	 * 在接收到的卡数据串中截取出卡中余额
	 */
	public static Integer getCardUsingTimesFromCard(String rdata) {
		if (rdata.length() >= 4) {
			//存储在记录的0－3十六进制位中
			try {
				return Integer.decode("0x" + rdata.substring(0, 4));
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * 把Integer类型的userid数据转换为卡存储的4位十六进制字符串数据
	 */
	public static String setInnerCardidToCard(Integer innerCardid) {
		String innercardidStr = Integer.toHexString(innerCardid.intValue());
		return criterionString(innercardidStr, 4);
	}

	/*
	 * 把Integer类型的cardid数据转换为电子门锁存储的6位十六进制字符串数据
	 */
	public static String setCardidToELock(Integer cardid) {
		String cardidStr = Integer.toHexString(cardid.intValue());
		cardidStr = criterionString(cardidStr, 6);
		return cardidStr.substring(4, 6) + cardidStr.substring(2, 4)
				+ cardidStr.substring(0, 2);
	}

	/*
	 * 把Date类型的endtime数据转换为电子门锁存储的十六进制字符串数据
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
	 * 把Integer类型的usertypeid数据转换为卡存储的2位十六进制字符串数据
	 */
	public static String setUserTypeidToCard(Integer userTypeid) {
		String userTypeidStr = Integer.toHexString(userTypeid.intValue());
		return criterionString(userTypeidStr, 2);
	}

	/*
	 * 提取消费记录的数目
	 */
	public static int getRecordNumFromPOS(String collectingData) {
		/*if (collectingData.length() >= 4) { //存储在记录的前两个字节中，，前低后高
			StringBuffer tempString = new StringBuffer();
			tempString.append(collectingData.substring(2, 4)).append(
					collectingData.substring(0, 2));
			if(collectingData.length()>190000){
				return (collectingData.length()-4)/24;	//如果是重新采集，则返回所有记录的总数（每12个字节组成一条记录）
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
		return (collectingData.length()-4)/24;	//怀疑收费机有问题，采取自己计算长度的方式
	}

	/*
	 * 提取逻辑卡号
	 */
	public static Integer getInnerCardidFromPOS(String collectingData) {
		if (collectingData.length() >= 6) {
			//存储在记录的1－5十六进制位中
			try {
				return Integer.decode("0x" + collectingData.substring(1, 6));
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * 提取卡使用次数
	 */
	public static Integer getCardUsingTimesFromPOS(String collectingData) {
		if (collectingData.length() >= 10) {
			//存储在记录的6－9十六进制位中
			try {
				return Integer.decode("0x" + collectingData.substring(6, 10));
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * 提取卡上余额
	 */
	public static Float getBalanceFromPOS(String collectingData) {
		if (collectingData.length() >= 15) {
			//存储在记录的10－14十六进制位中，前低后高
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
	 * 提取消费金额
	 */
	public static Float getBusinessMoneyFromPOS(String collectingData) {
		if (collectingData.length() >= 20) {
			//存储在记录的15－19十六进制位中
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
	 * 提取交易时间
	 */
	public static Date getHappeningTimeFromPOS(String collectingData) {
		if (collectingData.length() >= 24) {
			//存储在记录的20－23十六进制位中
			try {
				Date happeningtime = getDHM(collectingData.substring(20, 24));
				//设置日时分
				happeningtime.setMonth(//设置月
						Integer.decode("0x" + collectingData.substring(0, 1))
								.intValue() - 1);
				Date temp=Calendar.getInstance().getTime();
				if (happeningtime.compareTo(Calendar.getInstance().getTime()) > 0) {
					//如果采集时间比消费时间小，那么消费时间就要减少一年
					happeningtime.setYear(happeningtime.getYear() - 1); //设置年
				}
				return happeningtime;
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * 设置定值金额
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
	 * 设置卡类消费限制
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
	 * 转换日时分
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
	 * 转换日时分
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
	 * 规范字符串方法，将str截取为sublen长度的subString， 字符串长度小于sublen，在字符串前补0
	 * 字符串长度大于sublen，把字符串前面的字符截去
	 */
	public static String criterionString(String str, int sublen) {
		StringBuffer result = new StringBuffer();

		int len = str.length();

		if (len < sublen) { //判断长度，以保证总长度为6
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
	 * 在接收到的卡数据串中截取出卡的使用次数
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getCardUsingTimesFromCard
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输出值路径"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入卡数据串"
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
	 * 在接收到的卡数据串中截取出卡中余额
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getSumFromCard
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输出结果路径"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入卡数据串"
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