<%@include file="/internet/common.jsp"%>

<body>
<form name="form1" method="post">
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
 <input type="hidden" name="queryaction" value="teachWorkManage.prMakeTeachPlan.noticeList.do">      
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length"/>
<html:hidden property="modifyaction" value="teachWorkManage.prMakeTeachPlan.updateCourseAdjust.do"/>
<input type="hidden" name="isAdd"> 
<html:hidden property="CourseAdjust/NoticeTime/criteria/criteriaPattern" value="yyyy-MM-dd"/> 
<html:hidden property="CourseAdjust/NoticeTime/criteria/operator" value="between"/> 
			   
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;课程调整通知</td>
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
            <html:select property="CourseAdjust/ClassID/criteria/value"  attributesText='id="printTable"'> 
              <html:option value="-1">--请选择班级--</html:option> 
              <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select>
     </td> 
        </tr>
          <tr>
          <td height="30" class="text">
         通知时间：  从： 
                <html:text property="CourseAdjust/NoticeTime/criteria/min"/>
        <img src="/internet/image/date.gif"  height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CourseAdjust/NoticeTime/criteria/min"],"yyyy-MM-dd")>
            &nbsp; 到：                
                  <html:text property="CourseAdjust/NoticeTime/criteria/max"/>
                <img src="/internet/image/date.gif"  height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CourseAdjust/NoticeTime/criteria/max"],"yyyy-MM-dd")>
                   
                      &nbsp; <input name="B1" type="button" onclick="query()" class="button_02" value="查询">               
                <br>
                <qx:talentButton property="daochu" type="button" styleClass="button_02" value="新增通知" onclick="add()" operation="DX_TEACH_MANAGE_TeachPlan_notice.DX_TEACH_MANAGE_TeachPlan_notice_add"/>
           	<!--<qx:talentButton styleId="bUpdate" property="btnUpate" type="button" styleClass="button_02" value="修 改" onclick="update()"/>-->
              <input name="view" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">     
            <input name="view2" type="button" class="button_02" value="打 印" onClick="iePrint()">
            <qx:talentButton property="daochu" type="button" styleClass="button_02" value="删 除" onclick="del_adjust();" operation="DX_TEACH_MANAGE_TeachPlan_notice.DX_TEACH_MANAGE_TeachPlan_notice_del"/>
          <qx:talentButton property="daochu" type="button" styleClass="button_02" value="重发通知" onclick="sendAgin()" operation="DX_TEACH_MANAGE_TeachPlan_notice.DX_TEACH_MANAGE_TeachPlan_notice_send"/>
           &nbsp;&nbsp;查看方式：<html:select property="CourseAdjust/displayType" onchange="showType()">
               <html:option value="0">有通知时间的记录</html:option>
               <html:option value="1">所有记录</html:option>
           </html:select> 
         </td> 
        </tr>
      </table>      
        <table width="100%" height="8"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td> </td>
          </tr>
        </table>
        <table id="listdetail" width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td width="30" align="center"><input type="checkbox" name="C1" value="ON"></td>
            <td width="80" id="CourseAdjust.AdjustTime" onClick="talentsort()">日期</td>
            <td width="45" id="CourseAdjust.AdjustTime">时间</td>
            <td width="51" id="CourseAdjust.Adjuster">调整人</td>
            <td  id="CourseAdjust.AdjustContent">调整内容</td>
            <td width="81" id="CourseAdjust.NoticeTime">通知时间</td>
            <td width="95">通知方式</td>
          </tr>
         <logic:iterate id="resultSet" property="list[@type='CourseAdjust']">
          <tr class="td1">
            <td width="30" align="center">
          <html:checkbox id="resultSet" name="list[@name='update']/CourseAdjust/AdjustID" property="CourseAdjust/AdjustID" indexed="true"/>
			 </td>
            <td align="center" nowrap width="80">
            <bean:write id="resultSet" property="CourseAdjust/AdjustTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td width="45" align="center">
            <bean:write id="resultSet" property="CourseAdjust/AdjustTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/></td>
            <td width="51"><bean:write id="resultSet" property="CourseAdjust/Adjuster"/></td>
            <td align="left" ><bean:write id="resultSet" property="CourseAdjust/AdjustContent"/></td>
            <td width="81"><bean:write id="resultSet" property="CourseAdjust/NoticeTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td width="95" align="center"><bean:write id="resultSet" property="CourseAdjust/NoticeMethod"/></td>
          </tr>
         </logic:iterate> 
        </table>
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
<script language="javascript">
var frm=document.form1;
function add(){
  if(frm.elements["CourseAdjust/ClassID/criteria/value"].value=="-1"){
    alert("请先选择班级！");
    return;
  }
  frm.elements["isAdd"].value="1";
  frm.action="teachWorkManage.prMakeTeachPlan.addNotice.do?path=2";
  frm.submit();
}

function update(){
  if(chechedCount(frm)<1){
    alert("至少必须选择一行！");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
  }
   frm.elements["isAdd"].value="2";
   talentmodify();
  }

function sendAgin(){
  if(chechedCount(frm)<1){
    alert("请至少选择一条记录重发！");
    return ;
  } else if (chechedCount(frm)>1) {
    alert("请至多选择一条记录重发！");
    return ;
  }
  var ids=checkedIds();
  var remark=(new Date()).getTime();
  var loc="teachWorkManage.prMakeTeachPlan.showSendNoticePage.do?ids="+ids+"&remark="+remark;
  window.open(loc,"","width=450,height=250,left=150,top=150,status=yes");
}

function query(){
  frm.elements["PageCond/begin"].value="";
  frm.elements["PageCond/count"].value="";
  frm.elements["PageCond/length"].value="";
  frm.action="teachWorkManage.prMakeTeachPlan.noticeList.do";
  frm.submit();
}

function checkedIds(){
  var ids="";
  var array=frm.elements;
  var len=array.length;
  
  for(var i=0;i<len;i++){
    var obj=array[i];
    if(obj.type=="checkbox"&&obj.name!="C1"&&obj.checked){
     if(ids==""){
        ids=obj.value;
     }else{
        ids+=","+obj.value;
     }
    }
  }
  return ids;
}

function del_adjust() {
document.forms[0].action = "teachWorkManage.prMakeTeachPlan.delNoticeList.do";
if (window.confirm("确定删除所选通知吗？"))
   document.forms[0].submit();

}

function showType(){
  frm.elements["PageCond/begin"].value="";
  frm.elements["PageCond/count"].value="";
  frm.elements["PageCond/length"].value="";
   document.forms[0].submit();
}
</script>