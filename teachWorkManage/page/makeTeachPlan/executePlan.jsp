<%@include file="/internet/common.jsp"%>

<body>
<form name="frm" method="post">
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;��ѧ�ƻ�ִ�б�</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
           <html:select property="Course/ClassID" onchange="query()" > 
              <html:option value="-1">--��ѡ��༶--</html:option> 
              <html:options property="list[@type='Class']/Class/ClassID" labelProperty="list[@type='Class']/Class/ClassName"/> 
              </html:select> 
            <input name="B3" type="button" class="button_02" value="��ʷ�༶" onclick="selectClasses()">
            <input name="B3" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
            <input name="B3" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
            <input type="hidden" name="queryaction">
            <html:hidden property="isFirst"/>            
           </td>
        </tr>
      </table>      
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center" class="text_title">��ѧ����ִ�мƻ�</td>
          </tr>
          <tr>
            <td height="30" align="center" class="text_red">��Σ�<bean:write property="Class/ClassName"/>��<bean:write property="Class/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/> ����<bean:write property="Class/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>��</td>
          </tr>
        </table>   
         <table width="100%"  border="0" cellspacing="0"  cellpadding="0"><tr><td>      
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" id="listdetail" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td align="center">��Ԫ��������</td>
            <td> ��ѧ��ʽ</td>
            <td> ѧϰʱ��</td>
            <td><strong> ���ñ���</strong></td>           
             <td width="19%"> �ص�</td>
              <td>ʹ�ÿμ�</td>
            <td width="7%"> ����ģʽ</td>
            <td> ������</td>
            <td> �����ʦ</td>
          </tr>
         <logic:iterate id="eachCourse" property="list[@type='Course']">
          
          <tr class="td1">
            <td ><strong><bean:write id="eachCourse" property="Course/unit"/></strong><br>
            <bean:write id="eachCourse" property="Course/org"/><br>
            <bean:write id="eachCourse" property="Course/head"/>
            </td>
            <td ><bean:write id="eachCourse" property="Course/teachModel"/></td>           
            <td align="center"><bean:write id="eachCourse" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="MM-dd"/>&nbsp;<dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="eachCourse"/></td>
            <td ><bean:write id="eachCourse" property="Course/CourseTitle"/>&nbsp;</td>
            <td >
            <logic:equal id="eachCourse" property="Course/TeahchingModelID" value="6">
                 <bean:write id="eachCourse" property="Course/team"/>&nbsp;
            </logic:equal>
            <logic:notEqual id="eachCourse" property="Course/TeahchingModelID" value="6">
                  <bean:write id="eachCourse" property="Course/roomName"/>&nbsp;
            </logic:notEqual>
            </td>
            <td align="center">
            <logic:equal id="eachCourse" value="0" property="Course/IsUseCourseWare">��</logic:equal>
            <logic:equal id="eachCourse" value="1" property="Course/IsUseCourseWare">��</logic:equal>
            </td>
            <td align="center"><bean:write id="eachCourse" property="Course/ClassModelID"/>&nbsp;</td>
            <td ><bean:write id="eachCourse" property="Course/Compere"/>&nbsp;</td>
            <td ><bean:write id="eachCourse" property="Course/Attenders"/>&nbsp;</td>
          </tr>
         </logic:iterate>        
         
        </table>
        </td></tr></table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class="text">
              <script>
				PageCond(document.forms[0]);
		     </script>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
var className="";
 function selectClasses(){
    var remark=(new Date()).getTime();
    var loc="teachWorkManage.prMakeTeachPlan.selectClasses.do?single=false&remark="+remark;
    var returnArray=new Array();    
  
    try{
           returnArray=window.showModalDialog(loc,'','dialogWidth:570px;dialogHeight:420px');         
           if(returnArray!=undefined){
            var classId=returnArray[0];                              
            className=returnArray[1];
            var obj=new Option(className,classId,true,true);
            document.frm.elements["Course/ClassID"].add(obj);            
           }
   if(className.indexOf(",")>-1){
      alert("ֻ��ѡ��һ���༶���в�ѯ��");
      return false;
   }
       }catch(e){}      
    
   if(returnArray!=undefined){     
      frm.elements["isFirst"].value="0";
      frm.elements["PageCond/count"].value="";
      frm.action="teachWorkManage.prMakeTeachPlan.executedPlan.do";
      frm.submit();
    }  
 }
 
 function query(){
  if(className.indexOf(",")>-1){
      alert("ֻ��ѡ��һ���༶���в�ѯ��");
      return false;
   }
 
    if(frm.elements["Course/ClassID"].value!="-1"){
      frm.elements["isFirst"].value="0";
      frm.elements["PageCond/count"].value="";
      frm.action="teachWorkManage.prMakeTeachPlan.executedPlan.do";
      frm.submit();
    }
 }
</script>