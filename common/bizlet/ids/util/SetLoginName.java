package ids.util;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.trs.idm.api.remote.ServicesFactory;
import com.trs.idm.api.remote.SimpleResponse;
import com.trs.idm.api.remote.bo.UserEntry;
import com.trs.idm.api.remote.exception.ServiceException;
import com.trs.idm.api.remote.user.UserService;

/**
 * @author ������
 * @version 1.0
 * @date 2009-10-15
 * @class_displayName IDSTools
 */

public class SetLoginName {

    /**
     * 
     * @param doc
     *            type: Document, DOM;
     * @param param
     *            type: BizContext;
     * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1
     * @throws Exception
     *             <p>** bizlet ����ʾ���� **
     * @bizlet_displayName BL_resetPassword
     * @bizlet_param passing="in_out" type="variable" value="/" name=""
     *               desc="���ص�¼��"
     * @bizlet_param passing="in_out" type="variable" value="/" name=""
     *               desc="��¼��"
     */
    public static int BL_setUserID(Document doc, BizContext param) {
        Node node = (Node) param.getParaObjectAt(0);
        String userId = (String) param.getParaObjectAt(1);
        Element LoginName = doc.createElement("LoginName");
        try {
            char[] list = userId.toCharArray();
            userId = "";
            for (int i = 0; i < list.length; i++) {
                if (i == 0) {
                    userId = userId
                            + PinYinTools.getPingYin(String.valueOf(list[i]));
                } else {
                    userId = userId
                            + PinYinTools.getPinYinHeadChar(String
                                    .valueOf(list[i]));
                }
            }
        } catch (Exception e) {
            return 0;
        }
        
        XmlUtil.setNodeValue(LoginName,userId);
        node.appendChild(LoginName);
        return 1;
    }
}