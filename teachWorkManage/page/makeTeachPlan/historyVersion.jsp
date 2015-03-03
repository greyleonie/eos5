<%@include file="/internet/common.jsp"%>
<title>查看版本记录</title>
<form>
 
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8" class="td1"> 查看版本记录
      <html:hidden property="classId"/>
      <html:hidden property="createTime"/>
      </td>
    </tr>
    <tr>
      <td class="text">     
        
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td width="">&nbsp;</td>
            <td width="15%">创建日期</td>
            <td width="15%">创建人</td>
            <td width="6%">版本号</td>
             <td width="50%">版本说明</td>
             <td >操作</td>
             <%int count=0; %>
        <logic:iterate id="resultSet" property="list[@type='TeachingPlanBu']">
          </tr>
          <tr class="td1" onClick="changeTRBgColor(this)" onDBLclick="courseDetail('<bean:write id="resultSet" property="TeachingPlanBu/id"/>')" title="双击可查看该版本详细信息">
             <td width=""><input type="radio" name="ra" value='<bean:write id="resultSet" property="TeachingPlanBu/id"/>'></td>
           <td width=""><bean:write id="resultSet" property="TeachingPlanBu/creatTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>　</td>
            <td width=""><bean:write id="resultSet" property="TeachingPlanBu/creator" />　</td>
            <td width=""><bean:write id="resultSet" property="TeachingPlanBu/version"/>　</td>        
             <td width=""><bean:write id="resultSet" property="TeachingPlanBu/descripte"/>　</td>  
              <td width=""><a href="javascript:updateView('<bean:write id="resultSet" property="TeachingPlanBu/ClassID"/>','<bean:write id="resultSet" property="TeachingPlanBu/creatTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>')">查看痕迹</a></td>  
          </tr>
          <%count++; %>
          </logic:iterate>
          <%if(count==0){ %>
            <tr class="td1">
               <td colspan="6" align="center">没有版本信息！</td>
            </tr>
          <%} %>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class="td1">双击可查看该版本详细信息</td>
          </tr>
            <tr>
            <td height="30" class="td1" align="center">
             <input name="B3" type="button" class="button_02" value="查看" onClick="versionDetail()">
            <input name="B3" type="button" class="button_02" value="关闭" onClick="window.close()">
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<script>


  function getId(){   
    var el=document.forms[0].elements;
    var len=el.length;
    
    for(var i=0;i<len;i++){
        var ob=el[i];       
        if(ob.type=="radio"&&ob.checked){            
          return ob.value;
        }
    }
    return -1;
  }
  
 function versionDetail(){
  var recordId=-1;
  recordId=getId();
  var re=(new Date()).getTime();
  var loc="teachWorkManage.prMakeTeachPlan.queryVersion2.do?TeachingPlanBu/id="+recordId+"&re="+re;

 if(recordId>-1){

  window.showModalDialog(loc,'','top=200px;left=200px;dialogWidth=800px;dialogHeight=750px;status=no;scrro=yes');
  self.close();
   }
  }
  
  function courseDetail(recordId){
    var re=(new Date()).getTime();
    var loc="teachWorkManage.prMakeTeachPlan.queryVersion2.do?TeachingPlanBu/id="+recordId+"&re="+re;
    window.showModalDialog(loc,'','top=200px;left=200px;dialogWidth=800px;dialogHeight=750px;status=no;scrro=yes');
      self.close();
  }
  
  function updateView(classId,createTime){  
     var frm=document.forms[0];
     frm.elements["classId"].value=classId;
      frm.elements["createTime"].value=createTime;
     var remark=(new Date()).getTime();
     var loc="teachWorkManage.prMakeTeachPlan.showUpdateRecord.do?classId="+classId+"&createTime="+createTime+"&remark="+remark;
     window.open(loc,"","left=200,top=200,width=550,height=350,scrollbars=yes");
   
  }
</script>