package talent.core;
import org.w3c.dom.*;


import com.primeton.tp.core.api.BizContext;

/*
 * @author Administrator
 * @version 1.0
 * @date 2006-8-30
 * @class_displayName WFManagerNew
 */

public class WFManagerNew {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getPersonByRoleID
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="list"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="roleID"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="pageCond"
	 * 
	 */
	public static int BL_getPersonByRoleID(Document doc, BizContext param)
		throws Exception {
//		String teststr = com.primeton.eos.om.util.OMDBUtil.getColumnsOfTable("EOSORG_V_OMEmpOperView", "b");
//		System.out.print("^^^^^^^^^^^^^^^^^^^^teststr="+ teststr);
//		Method[] method = OMParticipant.class.getMethods();
//		for(int i = 0; i < method.length; i++) {
//			System.out.println("^^^^^^^^^^^^^^^^^^^^OMParticipant.method="+ method[i].getName());
//		}
//		System.out.println("$$$$$$$$$$$$$$$$$$$PersonParticipant.class.name=" + PersonParticipant.class.getName());
//		
//		
//		
//		
//		Element list;
//        Element pageCond;
//        String roleID;
//        
//        try
//        {
//            list = (Element)param.getParaObjectAt(0);
//            roleID = (String)param.getParaObjectAt(1);
//            pageCond = (Element)param.getParaObjectAt(2);
//        }
//        catch(Exception ex)
//        {
//            return -1;
//        }
//		
//		PersonParticipant personPart[] = null;
//        PageCond pc = new PageCond();
//        String begin = null;
//        String length = null;
//        String count = null;
//        try
//        {
//            begin = XML.getNodeValue(pageCond, "begin");
//            length = XML.getNodeValue(pageCond, "length");
//            count = XML.getNodeValue(pageCond, "count");
//            pc.setBeginIndex(Integer.parseInt(begin));
//            pc.setLength(Integer.parseInt(length));
//            if(StringUtil.isNotNull(count) && count.equalsIgnoreCase("noCount"))
//                pc.setCount(false);
//            else
//                pc.setCount(true);
//        }
//        catch(XMLException e1)
//        {
//            e1.printStackTrace();
//            return -3;
//        }
//        catch(NumberFormatException e1)
//        {
//            e1.printStackTrace();
//            return -2;
//        }
//        
//        try
//        {
//            personPart = ServiceFactory.getOMService().getPersonByRoleID(roleID);
//            XML.setNodeValue(pageCond, "count", String.valueOf(pc.getCount()));
//        }
//        catch(WFOMException e)
//        {
//            e.printStackTrace();
//            return -5;
//        }
//        catch(XMLRunTimeException e)
//        {
//            e.printStackTrace();
//            return -3;
//        }
//        catch(XMLException e)
//        {
//            e.printStackTrace();
//            return -3;
//        }
//        Element personPartElem = null;
//        try
//        {
//            for(int i = 0; personPart != null && i < personPart.length; i++)
//            {
//                personPartElem = doc.createElement("PersonParticipant");
//                XML.setNodeValue(personPartElem, "ID", personPart[i].getID());
//                XML.setNodeValue(personPartElem, "name", personPart[i].getName());
//                
//                XML.setNodeValue(personPartElem, "email", personPart[i].getEmail());
//                XML.setNodeValue(personPartElem, "position", personPart[i].getPosition());
//                XML.setNodeValue(personPartElem, "phone", personPart[i].getPhone());
//                XML.setNodeValue(personPartElem, "mobile", personPart[i].getMobile());
//                XML.setNodeValue(personPartElem, "type", personPart[i].getType());
//                //XML.setNodeValue(personPartElem, "userLevel", String.valueOf(personPart[i].getUserLevel()));
//                list.appendChild(personPartElem);
//            }
//
//            if(personPart != null)
//                list.setAttribute("rowNum", String.valueOf(personPart.length));
//            else
//                list.setAttribute("rowNum", "0");
//        }
//        catch(XMLException ex)
//        {
//            ex.printStackTrace();
//            return -3;
//        }

		return 1;
	}

}