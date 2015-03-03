<%@include file="/internet/common.jsp"%>

<form method="post" action="teachWorkManage.prSubjectDeclare.subjectBid.do">
<input type="hidden" name="queryaction" value="teachWorkManage.prSubjectDeclare.subjectBid.do">
<input type="hidden" name="addaction" value="teachWorkManage.prSubjectDeclare.subjectBidAdd.do">
<input type="hidden" name="modifyaction" value="teachWorkManage.prSubjectDeclare.subjectVieModify.do">
<input type="hidden" name="deleteaction" value="teachWorkManage.prSubjectDeclare.subjectDeclareDelete.do">
<input type="hidden" name="viewaction" value="teachWorkManage.prSubjectDeclare.subjectDeclareView.do">
<input type="hidden" name="bidaction" value="teachWorkManage.prSubjectDeclare.subjectBidVie.do">
		
<html:hidden property="SubjectDeclare/_order/col1/field"/>
<html:hidden property="SubjectDeclare/_order/col1/desc" />
		
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length" />

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;课题申报—&gt;<span id="printTable">竞课中标</span></td>
          </tr>
      </table></td>
    </tr>
  </table>
    <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">&nbsp;选择课程板块：
          <html:select property="SubjectDeclare/DeclareID" onchange="talentquery()" attributesText=''> 
              <html:options property="list[@type='SubjectDeclare']/SubjectDeclare/DeclareID" labelProperty="list[@type='SubjectDeclare']/SubjectDeclare/DeclareName"/> 
          </html:select></td>  
        </tr>
      </table>   
      </td>
     </tr>
     <tr>
        <td height="8"> </td>
      </tr>
     <tr >
       <td class="text">      
         <table width="96%" height="6"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td>&nbsp;&nbsp;   
              <html:hidden property="SubjectDeclare/type"/>
              <input name="viewBydept" type="button" class="button_eight" value="按教研部查看" onClick="filterview(1)">
              <input name="viewByPlate" type="button" class="button_eight" value="按板块查看" onClick="filterview(0)">
              <qx:talentButton property="add" type="button" styleClass="button_eight" value="定为中标名单" onclick="setBid()" operation="DX_TEACH_MANAGE_SUBJECTDECLARE_BIDS.DX_TEACH_MANAGE_SUBJECTDECLARE_BIDS_ADD"/>
			  <qx:talentButton property="ieprint" type="button" styleClass="button_02" value="打 印" onclick="iePrint()" operation="DX_TEACH_MANAGE_SUBJECTDECLARE_BIDS.DX_TEACH_MANAGE_SUBJECTDECLARE_BIDS_PRINT"/>
			  <qx:talentButton property="export" type="button" styleClass="button_02" value="导 出" onclick="exporttoexcel()" operation="DX_TEACH_MANAGE_SUBJECTDECLARE_BIDS.DX_TEACH_MANAGE_SUBJECTDECLARE_BIDS_EXPORT"/>
              <%	String check=""; 
                    String value="0";%>
			  <logic:equal property="SubjectDeclare/BidStatus" value="1" > 
			  <%  check="checked" ;
			      value="1";%>
			  </logic:equal>
			  <logic:notEqual property="SubjectDeclare/BidStatus" value="1" > 
			  <%  value="0";%>
			  </logic:notEqual>
			  <input type="checkbox" name="SubjectDeclare/BidStatus"  marked="" <%=check %> value="<%=value %>" onclick="bidquery()" >       			
              <font size="2">只显示中标课题</font>  
            </td>
           </tr>
         </table>
       </td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
       <td class="text">
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
            <tr>
              <td width="18%" height="9" class="td1" >&nbsp;申报名称：</td>
              <td width="82%" height="9" class="td1">&nbsp;<bean:write property="SubjectDeclare/DeclareName"/>
              </td>
            </tr>
            <tr>
              <td height="9" class="td1" >&nbsp;申报截止时间：</td>
              <td height="9" class="td1">&nbsp;<bean:write property="SubjectDeclare/DateLine" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
              </td>
            </tr>
            <tr>
              <td height="15" class="td1">&nbsp;包含板块：
              </td>
              <td height="15" class="td1">&nbsp;<bean:write property="SubjectDeclare/PlateNum"/>个
              </td>
            </tr>
            <logic:notEqual property="SubjectDeclare/subNum" value="0">
            <%int count=0;%>
            <logic:iterate id="resultset" property="list[@type='SubjectPlate']">
            <%count++; %>
            <logic:equal property="SubjectDeclare/type" value="0">
            <tr>
              <td height="23" class="td1" colspan="2">
                <b> &nbsp;<font color="#FF9900">板块<%=count %>：<bean:write id="resultset" property="SubjectPlate/PlateName"/><font color="#008080">（共<bean:write id="resultset" property="SubjectPlate/RowSpan"/>个）</font></font></b>
              </td>
            </tr>
            <tr>
              <td height="23" class="td1" colspan="2">
                 &nbsp;板块说明：<bean:write id="resultset" property="SubjectPlate/content"/>
              </td>
            </tr>
            </logic:equal> 
			       <logic:equal property="SubjectDeclare/type" value="1">
			       <tr>
                   <td height="23" class="td1" colspan="2">
                    <b> &nbsp;<font color="#FF9900"><bean:write id="resultset" property="SubjectPlate/DeptName"/><font color="#008080">（共<bean:write id="resultset" property="SubjectPlate/RowSpan"/>个）</font></font></b>
                   </td>
                   </tr>
			       </logic:equal>
			  
            <tr>
              <td height="23" class="td1" colspan="2">&nbsp;
              </td>
            </tr>
            <tr>
              <td height="23" class="td1" colspan="2">
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr align="center" class="td_title">
                    <td width="2%" align="center" nowrap>中标</td>
                    <td width="9%" align="center" nowrap id="SubjectOfDeclared.IsBid" onClick="talentsort()">是否中标</td>
                    <td width="9%" align="center" nowrap id="SubjectOfDeclared.TeacherID" onClick="talentsort()">申报教员</td>
                    <td width="8%" align="center" nowrap id="SubjectOfDeclared.DeclareTime" onClick="talentsort()">申报时间</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.SubjectName" onClick="talentsort()">课题名称</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.PlateIDs" onClick="talentsort()">对应板块</td>
                    <td width="19%" align="center" nowrap id="SubjectOfDeclared.Classes" onClick="talentsort()">适应班次</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.Thought" onClick="talentsort()">教学思路</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.Method" onClick="talentsort()">方式方法</td>
                    <td width="11%" align="center" nowrap >操作</td>
                  </tr>
                  <logic:notEqual property="list[@type='SubjectPlate']/SubjectPlate/RowSpan" value="0">
                  <%
		           int counts=0;
			         String trClass = "result_content"; 
		  
		  		  %>
                  <logic:iterate id="resultset2" property="list[@type='SubjectOfDeclared']">
                  <%
				     
						if(counts%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						counts++;
			       %>
			      
			       <logic:equal property="SubjectDeclare/type" value="1">
			      	<logic:equal property="SubjectOfDeclared/DeptID" propertyId="resultset2" value="SubjectPlate/DeptID" valueType="variable" valueId="resultset">
                  
                  <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset2" property="SubjectOfDeclared/SubjectID"/>','true')"> 
                    <td align="center">
					<logic:present  id="resultset2" property="SubjectOfDeclared/SubjectID"> 
                  		<html:checkbox id="resultset2" name="list[@name='update']/SubjectOfDeclared/SubjectID" property="SubjectOfDeclared/SubjectID"  indexed="true"/> 
                  	</logic:present> 
				    </td>
                    <td nowrap align="center">
					  <logic:equal id="resultset2" property="SubjectOfDeclared/IsBid" value="0">未中标</logic:equal>
					  <logic:equal id="resultset2" property="SubjectOfDeclared/IsBid" value="1"><font color="#FF0000">中标</font></logic:equal>
                    </td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/Teacher"/></td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/DeclareTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/SubjectName"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subSubjectName"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/PlateNames"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subPlateNames"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Classes"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subClasses"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Thought"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subThought"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Method"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subMethod"/></td>
                    <td nowrap align="center">
                    <logic:equal id="resultset2" property="SubjectOfDeclared/IsBid" value="0">
                    <a href="#" onClick="subjectUpdate('<bean:write id="resultset2" property="SubjectOfDeclared/SubjectID"/>')">编辑</a>&nbsp;<a href="#" onClick="subjectDelete('<bean:write id="resultset2" property="SubjectOfDeclared/SubjectID"/>')">删除</a>
                    </logic:equal>
                    </td>
                  </tr>
                   </logic:equal>
                   </logic:equal>
			      <logic:equal property="SubjectDeclare/type" value="0">
                  <logic:equal property="SubjectOfDeclared/PlateID" propertyId="resultset2" value="SubjectPlate/PlateID" valueType="variable" valueId="resultset">
                  
                  <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset2" property="SubjectOfDeclared/SubjectID"/>','true')"> 
                    <td align="center">
					<logic:present  id="resultset2" property="SubjectOfDeclared/SubjectID"> 
                  		<html:checkbox id="resultset2" name="list[@name='update']/SubjectOfDeclared/SubjectID" property="SubjectOfDeclared/SubjectID" indexed="true"/> 
                  	</logic:present> 
				    </td>
                    <td nowrap align="center">
					  <logic:equal id="resultset2" property="SubjectOfDeclared/IsBid" value="0">未中标</logic:equal>
					  <logic:equal id="resultset2" property="SubjectOfDeclared/IsBid" value="1"><font color="#FF0000">中标</font></logic:equal>
                    </td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/Teacher"/></td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/DeclareTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/SubjectName"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subSubjectName"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/PlateNames"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subPlateNames"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Classes"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subClasses"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Thought"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subThought"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Method"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subMethod"/></td>
                    <td nowrap align="center">
                    <logic:equal id="resultset2" property="SubjectOfDeclared/IsBid" value="0">
                    <a href="#" onClick="subjectUpdate('<bean:write id="resultset2" property="SubjectOfDeclared/SubjectID"/>')">编辑</a>&nbsp;<a href="#" onClick="subjectDelete('<bean:write id="resultset2" property="SubjectOfDeclared/SubjectID"/>')">删除</a>
                    </logic:equal>
                    </td>
                  </tr>
                  </logic:equal>
                  </logic:equal>
                  </logic:iterate>
                  </logic:notEqual>
                </table>
              </td>
            </tr>
            </logic:iterate>
            </logic:notEqual>
            <logic:equal property="SubjectDeclare/subNum" value="0">
            <tr>
              <td height="8" class="td1" colspan="2">&nbsp;
              <font color="#FF0000">当前还没有竞课课题!</font>
              </td>
            </tr>
            </logic:equal>
            <tr>
              <td height="8" class="td1" colspan="2">
              </td>
            </tr>

          </table></td>
    </tr>
    <tr style="display:none">
       <td class="text">
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="listdetail">
            <tr>
              <td width="18%" height="9" class="td1" colspan="2">&nbsp;申报名称：</td>
              <td width="82%" height="9" class="td1" colspan="6" align="left">&nbsp;<bean:write property="SubjectDeclare/DeclareName"/>
              </td>
            </tr>
            <tr>
              <td height="9" class="td1" colspan="2">&nbsp;申报截止时间：</td>
              <td height="9" class="td1" colspan="6" align="left">&nbsp;<bean:write property="SubjectDeclare/DateLine" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
              </td>
            </tr>
            <tr>
              <td height="15" class="td1" colspan="2">&nbsp;包含板块：
              </td>
              <td height="15" class="td1" colspan="6" align="left">&nbsp;<bean:write property="SubjectDeclare/PlateNum"/>个
              </td>
            </tr>
            <logic:notEqual property="SubjectDeclare/subNum" value="0">
            <%int count2=0;%>
            <logic:iterate id="resultset" property="list[@type='SubjectPlate']">
            <%count2++; %>
            <logic:equal property="SubjectDeclare/type" value="0">
            <tr>
              <td height="23" class="td1" colspan="8" align="left">
                板块<%=count2 %>：<bean:write id="resultset" property="SubjectPlate/PlateName"/>（共<bean:write id="resultset" property="SubjectPlate/RowSpan"/>个）
              </td>
            </tr>
            <tr>
              <td height="23" class="td1" colspan="8" align="left">
                 &nbsp;板块说明：<bean:write id="resultset" property="SubjectPlate/content"/>
              </td>
            </tr>
            </logic:equal> 
			       <logic:equal property="SubjectDeclare/type" value="1">
			       <tr>
                   <td height="23" class="td1" colspan="8" align="left">
                    <bean:write id="resultset" property="SubjectPlate/DeptName"/>（共<bean:write id="resultset" property="SubjectPlate/RowSpan"/>个）
                   </td>
                   </tr>
			       </logic:equal>
			  
            <tr>
              <td height="23" class="td1" colspan="8">&nbsp;
              </td>
            </tr>

                  <tr align="center" class="td_title">
                    <td width="9%" align="center" nowrap id="SubjectOfDeclared.IsBid" onClick="talentsort()">是否中标</td>
                    <td width="9%" align="center" nowrap id="SubjectOfDeclared.TeacherID" onClick="talentsort()">申报教员</td>
                    <td width="8%" align="center" nowrap id="SubjectOfDeclared.DeclareTime" onClick="talentsort()">申报时间</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.SubjectName" onClick="talentsort()">课题名称</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.PlateIDs" onClick="talentsort()">对应板块</td>
                    <td width="19%" align="center" nowrap id="SubjectOfDeclared.Classes" onClick="talentsort()">适应班次</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.Thought" onClick="talentsort()">教学思路</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.Method" onClick="talentsort()">方式方法</td>
                  </tr>
                  <logic:notEqual property="list[@type='SubjectPlate']/SubjectPlate/RowSpan" value="0">
                  <logic:iterate id="resultset2" property="list[@type='SubjectOfDeclared']">
			      
			       <logic:equal property="SubjectDeclare/type" value="1">
			      	<logic:equal property="SubjectOfDeclared/DeptID" propertyId="resultset2" value="SubjectPlate/DeptID" valueType="variable" valueId="resultset">
                  
                  <tr class="td1" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset2" property="SubjectOfDeclared/SubjectID"/>','true')"> 
                    <td nowrap align="center">
					  <logic:equal id="resultset2" property="SubjectOfDeclared/IsBid" value="0">未中标</logic:equal>
					  <logic:equal id="resultset2" property="SubjectOfDeclared/IsBid" value="1"><font color="#FF0000">中标</font></logic:equal>
                    </td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/Teacher"/></td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/DeclareTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                    <td nowrap >&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subSubjectName"/></td>
                    <td nowrap >&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subPlateNames"/></td>
                    <td nowrap >&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subClasses"/></td>
                    <td nowrap >&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subThought"/></td>
                    <td nowrap >&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subMethod"/></td>
    
                  </tr>
                   </logic:equal>
                   </logic:equal>
			      <logic:equal property="SubjectDeclare/type" value="0">
                  <logic:equal property="SubjectOfDeclared/PlateID" propertyId="resultset2" value="SubjectPlate/PlateID" valueType="variable" valueId="resultset">
                  
                  <tr class="td1" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset2" property="SubjectOfDeclared/SubjectID"/>','true')"> 
                    <td nowrap align="center">
					  <logic:equal id="resultset2" property="SubjectOfDeclared/IsBid" value="0">未中标</logic:equal>
					  <logic:equal id="resultset2" property="SubjectOfDeclared/IsBid" value="1"><font color="#FF0000">中标</font></logic:equal>
                    </td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/Teacher"/></td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/DeclareTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                    <td nowrap >&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/SubjectName"/></td>
                    <td nowrap >&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/PlateNames"/></td>
                    <td nowrap >&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/Classes"/></td>
                    <td nowrap >&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/Thought"/></td>
                    <td nowrap >&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/Method"/></td>
                  </tr>
                  </logic:equal>
                  </logic:equal>
                  </logic:iterate>
                  </logic:notEqual>
              </td>
            </tr>
            </logic:iterate>
            </logic:notEqual>
            <logic:equal property="SubjectDeclare/subNum" value="0">
            <tr>
              <td height="8" class="td1" colspan="8">&nbsp;
              当前还没有竞课课题!
              </td>
            </tr>
            </logic:equal>
            <tr>
              <td height="8" class="td1" colspan="8">
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
<script>
  
  function filterview(id){
  	var frm =document.forms[0];

  	frm.action = frm.elements["queryaction"].value;
    frm.elements["SubjectDeclare/type"].value = id;
	frm.submit();
  }
  
  function setBid(){
  	var frm =document.forms[0];
		
   		if(chechedCount(frm)<1){
    		alert("至少必须选择一行！");
    		return ;
    	}
    	
    	if(confirm("是否确定列为中标名单？")==false){
			return ;
		}    	 
    
    	frm.action = frm.elements["bidaction"].value;
    	frm.submit();
  }
  
  function bidquery(){
  	var frm =document.forms[0];

  	if(frm.elements["SubjectDeclare/BidStatus"].checked){
  		frm.elements["SubjectDeclare/BidStatus"].value = 1;
  	}else{
  		frm.elements["SubjectDeclare/BidStatus"].value = 0;
  	}
  	frm.action = frm.elements["queryaction"].value;
    frm.submit();
  }
  
  function subjectUpdate(id){
  	var frm =document.forms[0];
  	frm.action = frm.elements["modifyaction"].value;
  	frm.action += "?fid=" + id + "&status=2";
    frm.submit();
  }
  
  function subjectDelete(id){
  	var frm =document.forms[0];
  	if(confirm("是否确定删除指定记录？")==false){
			return ;
	} 
  	frm.action = frm.elements["deleteaction"].value;
  	frm.action += "?fid=" + id + "&status=2";
    frm.submit();
  }

</script>