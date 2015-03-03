package student.housing;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.w3c.dom.*;

import talent.core.TalentFunctions;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-31
 * @class_displayName HousingManage
 */

public class HousingManage {

	/**
	 * �ó�����Ŀ��д�λ����
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName getVacancyNum
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="����������伯��"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="����ס����¼����"
	 */
	public static int BL_getVacancyNum(Document doc, BizContext param)
		throws Exception {
		try{
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		NodeList roomList=param0.getChildNodes();
		NodeList logList=param1.getChildNodes();
		for(int i=0;i<roomList.getLength();i++){  //��ʼ����ס����Ϣ
			Element room=(Element)roomList.item(i);
			
				Element HousingList=doc.createElement("HousingList");
				room.appendChild(HousingList);
				Element HousingState=doc.createElement("HousingState");
				room.appendChild(HousingState);
				Element VacancyNum=doc.createElement("VacancyNum");
				XmlUtil.setNodeValue(VacancyNum,room.getElementsByTagName("SeatNum").item(0).getFirstChild().getNodeValue());
				room.appendChild(VacancyNum);
				String roomID= room.getElementsByTagName("RoomID").item(0).getFirstChild().getNodeValue();
				for(int j=0;j<logList.getLength();j++){
					Element log=(Element)logList.item(j);
					String logRoomID=log.getElementsByTagName("RoomID").item(0).getFirstChild().getNodeValue();
					if(logRoomID.equals(roomID)){
						HousingList.appendChild(log);
						j=j-1;
					}
				}
			
		}
		
		for(int i=0;i<roomList.getLength();i++){ //����մ�����
			Element room=(Element)roomList.item(i);
			Element housing=(Element)room.getElementsByTagName("HousingList").item(0);
			if(housing.hasChildNodes()){
				
				NodeList HousingList=housing.getChildNodes();
				
				int max=0;
				int temp=0;
				String sex=null;
				System.out.println("---------------"+HousingList.getLength());
				for(int j=0;j<HousingList.getLength();j++){
					Element log=(Element)HousingList.item(j);
					String HousingTypeID=log.getElementsByTagName("HousingTypeID").item(0).getFirstChild().getNodeValue();
					if(HousingTypeID!=null&&HousingTypeID.equals("3")){
						
						XmlUtil.setNodeValue(room.getElementsByTagName("HousingState").item(0),HousingTypeID);
						
					}
					String beginTime=log.getElementsByTagName("BeginTime").item(0).getFirstChild().getNodeValue();
					String endTime=log.getElementsByTagName("EndTime").item(0).getFirstChild().getNodeValue();
					for(int k=0;k<HousingList.getLength();k++){
						Element log2=(Element)HousingList.item(k);
						String beginTime2=log2.getElementsByTagName("BeginTime").item(0).getFirstChild().getNodeValue();
						String endTime2=log2.getElementsByTagName("EndTime").item(0).getFirstChild().getNodeValue();
						try{
							if((beginTime.compareTo(endTime2)<= 0)||(beginTime2.compareTo(endTime)<= 0))
								temp=temp+1;
						}catch (Exception e){
							
						}
						
					}
					if(temp>max)
						max=temp;
					temp=0;
					//�ж��Ա�
					String sexTemp=log.getElementsByTagName("Sex").item(0).getFirstChild().getNodeValue();
					
					if(sexTemp!=null&&(!sexTemp.equals(""))){
						if(sex==null)
							sex=sexTemp;
						else if(!sex.equals(sexTemp))
							sex="2";
					}
				}
				if(max!=0){
					Element VacancyNum=(Element)room.getElementsByTagName("VacancyNum").item(0);
					String SeatNum=room.getElementsByTagName("SeatNum").item(0).getFirstChild().getNodeValue();
					System.out.println("max===>"+max);
					if(SeatNum!=null){
						int temp2=Integer.parseInt(SeatNum)-max;
						if (temp2<0)
							temp2=0;
						System.out.println("VacancyNum===>"+temp2);
						XmlUtil.setNodeValue(VacancyNum,String.valueOf(temp2));	
					}
					
				}
				if(sex!=null){
					
					Element SexElement=doc.createElement("Sex");
					XmlUtil.setNodeValue(SexElement,sex);
					room.appendChild(SexElement);
					
				}
			}
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return 1;
	}

		public static void main(String arg[]) throws Exception {
			String aa="1990-12-12 10:10:00";
			String bb="1990-12-12";
			

		}
	/**
	 * ���ݷ���״̬������
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_dealRoomByFlag
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="������������б�"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����״̬��ʶ"
	 */
	public static int BL_dealRoomByFlag(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		NodeList roomList=param0.getChildNodes();
		if(param1.equals("0")){ //����״̬����
			for(int i=0;i<roomList.getLength();i++){
				Element room=(Element)roomList.item(i);
				Element housing=(Element)room.getElementsByTagName("HousingList").item(0);
				if(housing.hasChildNodes()){
					XmlUtil.removeChildNode(param0,room);
					i=i-1;
				}
			}
		}
		if(param1.equals("1")){ //�ɷ���״̬����
			for(int i=0;i<roomList.getLength();i++){
				Element room=(Element)roomList.item(i);
				int VacancyNum=TalentFunctions.getInt(room.getElementsByTagName("VacancyNum").item(0).getFirstChild().getNodeValue(),0);
				if(VacancyNum==0){
					XmlUtil.removeChildNode(param0,room);
					i=i-1;
				}
			}
		}
		return 1;
	}
	/**
	 * ����ѧԱ����
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName assignStudentRoom
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="�������ѧԱ�б�"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="���뷿���б�"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="�����쳣ʱ����쳣��Ϣ"
	 */
	public static int BL_assignStudentRoom(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		Node param2 = (Node)param.getParaObjectAt(2);
		NodeList studentList=param0.getChildNodes();
		NodeList roomList=param1.getChildNodes();
		
		
		
		
		List studentList1 = new ArrayList();
		List roomList1 = new ArrayList();
		for(int i=0;i<studentList.getLength();i++){
			Element student=(Element) studentList.item(i);
			studentList1.add(student);
		}
		
		for(int i=0;i<roomList.getLength();i++){
			Element room=(Element) roomList.item(i);
			roomList1.add(room);
		}
		
		
		Collections.sort(studentList1,new ElementSort());
		Collections.sort(roomList1,new ElementSort());
		
		
		int flag=1;
		for(int i=0;i<studentList1.size();i++){
			Element student=(Element) studentList1.get(i);
			String Sex=TalentFunctions.getAvailStr(student.getElementsByTagName("Sex").item(0).getFirstChild().getNodeValue());
			int state=0;  //��ѧԱ�ɷ�ֵ�����״̬��
			for(int j=0;j<roomList1.size();j++){
				Element room=(Element) roomList1.get(j);
				String Sex2=TalentFunctions.getAvailStr(room.getElementsByTagName("Sex").item(0).getFirstChild().getNodeValue()); //����ס���Ա�
				int VacancyNum=TalentFunctions.getInt(room.getElementsByTagName("VacancyNum").item(0).getFirstChild().getNodeValue(),0);//����մ�λ��
				if(VacancyNum>0&&
					(Sex2.equals("")||Sex2.equals(Sex))){// ����մ�λ�����ڣ������ҷ���ס���Ա𲻴��ڻ��ѧԱһ�£���ɷ���
					
					if(student.getElementsByTagName("RoomID").getLength()>0){
						Element RoomID = (Element) student.getElementsByTagName("RoomID").item(0);
						XmlUtil.setNodeValue(RoomID,room.getElementsByTagName("RoomID").item(0).getFirstChild().getNodeValue());
					}
					else{
						Element RoomID=doc.createElement("RoomID");
						XmlUtil.setNodeValue(RoomID,room.getElementsByTagName("RoomID").item(0).getFirstChild().getNodeValue());
						student.appendChild(RoomID);
					}
					VacancyNum=VacancyNum-1;
					if(VacancyNum==0){ //����մ���Ϊ����ɾ���÷���
						roomList1.remove(room);
						j=j-1;
					}
					
						Element VacancyNumElement=(Element)room.getElementsByTagName("VacancyNum").item(0);
						XmlUtil.setNodeValue(VacancyNumElement,String.valueOf(VacancyNum));
						if(Sex2.equals("")){
							Element SexElement=(Element)room.getElementsByTagName("Sex").item(0);
							XmlUtil.setNodeValue(SexElement,Sex); //�������ѧԱ�Ա�
						}
					
					state=1;//�ѷ���
					break;
				}
			}
			if(state==0){
				flag=0;
				XmlUtil.setNodeValue(param2,"����ʧ�ܣ�����ѧԱ���䲻�˷��䣬��ȷ�����ݹ�ϵ������Ϊ�Ա�");
				break;
			}
		}
		
		return flag;
	}
	
	
}


class ElementSort implements Comparator {
	
	public int compare(Object o1, Object o2){
		int i = 0;
		Element el1 = (Element) o1;
		Element el2 = (Element) o2;
		
		String attr1 = getAttributeValue(el1,"rowNum");
		String attr2 = getAttributeValue(el2,"rowNum");
		
		int c1 = TalentFunctions.getInt(attr1,0);
		int c2 = TalentFunctions.getInt(attr2,0);
		
		if(c1 > c2) return 1;
		if(c1 == c2) return 0;
		if(c1 < c2) return -1;
		
		return i;
		
	}
	
	
	
	public String getAttributeValue(Node node ,String attributeName) {
	    String result = "";

	    try{
	      NamedNodeMap temps = node.getAttributes();
	    for(int i = 0; i < temps.getLength(); i++) {
	      String name = temps.item(i).getNodeName();
	      if(attributeName!=null && name.equalsIgnoreCase(attributeName)) {
	        Node aNode = temps.item(i);
	        String value = aNode.getNodeValue();
	         
	        return value;
	      }


	    }

	    }catch(Exception e) {
	      e.printStackTrace();
	    }
	    return result;
	  }
	
}