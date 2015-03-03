package talent.core;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2008-12-23
 * @class_displayName compareString
 * ×Ö·û´®±È½Ï
 */

public class compareString {
 
    public static int BL_CompareString(Document doc, BizContext param)
    {
        String param0 = (String) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);
		if(param0.equals(param1)){
		    return 1;
		}else{
        return 0;
		}
    }
}