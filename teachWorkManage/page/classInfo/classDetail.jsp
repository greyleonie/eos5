<%@include file="/internet/common.jsp"%>

<form name="addUpdateForm" method="post" >
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<input type="hidden" name="PageCond/begin" value="0">
<input type="hidden" name="PageCond/count" >
<input type="hidden" name="PageCond/length" value="10">
<html:hidden property="isAdd"/>
<html:hidden property="Class/ClassID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt; 班级管理  
              -&gt; 班级查看</td> 
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width=""  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="" align="right" class="td2">班级名称：</td>
            <td colspan="7" class="td1" width=""><bean:write property="Class/ClassName" />
           </td>            
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">班级简称： </td>
            <td width="" class="td1" colspan="3">
             <bean:write property="Class/ClassShortName" />
         </td>            
            <td width="" align="right" class="td2">班级类型： </td>
            <td width="" class="td1" colspan="3"><bean:write property="classTypeName" />
            </td>            
          </tr>
		    <tr  onClick="changeTRBgColor(this)">
            <td nowrap align="right" class="td2">培训班编号：</td>
            <td colspan="3" class="td1" width="">
            <bean:write property="Class/ClassCode" />
		    </td>     
            <td nowrap align="right" class="td2">人事局系统编号： </td>
            <td width="" class="td1" colspan="3"> 
          <bean:write property="Class/renShiNo" />
		     </td>       
          </tr>
		   <tr  onClick="changeTRBgColor(this)">
            <td nowrap align="right" class="td2">项目名称：</td>
            <td colspan="3" class="td1" width="">
            <bean:write property="Class/proName" />
		    </td>     
            <td align="right" class="td2" width="">教学质量评估： </td>
            <td width="" class="td1" width=""> 
			<logic:equal property="Class/IsUnitEva" value="0">否</logic:equal>
			<logic:equal property="Class/IsUnitEva" value="1">是</logic:equal>
                </td>   
             <td nowrap align="right" class="td2" width="">外网评估： </td>
            <td width="" class="td1" width=""> 
			<logic:equal property="Class/IsWebEva" value="0">否</logic:equal>
			<logic:equal property="Class/IsWebEva" value="1">是</logic:equal>
                </td>       
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">调训单位： </td>
            <td class="td1" width="" colspan="3"><bean:write property="Class/Commission" />  </td>          
            <td align="right" class="td2" width="">计划招生人数：</td>
            <td class="td1" width="">
            <bean:write property="Class/RecruitNum" />
  </td>            
            <td align="right" class="td2" width="">实际招生人数：</td>        
            <td class="td1" width="">
             <bean:write property="Class/factNum" />
           
            </td>        
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">学&nbsp;&nbsp;&nbsp;&nbsp;制： </td>
            <td class="td1" width="326" colspan="3">
             <bean:write property="Class/XueZhi" />
           </td>            
            <td align="right" class="td2" width="">学&nbsp;习&nbsp;日： </td>
            <td class="td1" colspan="3" width="337">
               <bean:write property="Class/XueRi" />天</td>            
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">培&nbsp;训&nbsp;费： </td>
            <td class="td1" width="326" colspan="3"> <bean:write property="Class/EducatStand" />       
            
            元</td>
            <td align="right" class="td2" width="">考&nbsp;察&nbsp;费： </td>
            <td class="td1" width="87" > <bean:write property="Class/KaoChaStand" /> 元</td> 
            <td align="right" class="td2" width="">其&nbsp;他&nbsp;费：</td>        
            <td class="td1" width="105"> <bean:write property="Class/otherMoney" /> 元
            </td>        
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">注册时间： </td>
            <td class="td1" width="326" colspan="3">    
            <bean:write property="Class/regTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/> 
          
            </td>           
            <td align="right" class="td2" width="">报到时间： </td>
            <td class="td1" colspan="3" width="">
            <bean:write property="Class/reachTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/> 
        
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">开班时间：</td>
            <td class="td1" width="326" colspan="3">
             <bean:write property="Class/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/> 
                
            </td>
            <td align="right" class="td2" width="109">毕(结)业时间： </td>
            <td class="td1" colspan="3" width="">
             <bean:write property="Class/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/> 
          
            </td>         
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">上课地点：</td>
            <td class="td1" width="" colspan="3">
            <bean:write property="Class/classRoomName"/>            
              </td>
            <td align="right" class="td2" width="">住宿地点：</td>
            <td class="td1" colspan="3" width="">          
            <bean:write property="Class/buildingName"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">就餐标准： </td>
            <td colspan="3" class="td1" width="">
          <bean:write property="Class/RepastStand" />
            </td>
			   <td align="right" class="td2" >学号前缀： </td>
            <td colspan="3" class="td1" width="">
            <bean:write property="Class/Prefix" />
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" >就&nbsp;餐&nbsp;卡：</td>
            <td class="td1" width="">
            <logic:equal property="Class/RepastCard" value="0">&nbsp;</logic:equal> 
            <logic:equal property="Class/RepastCard" value="1">IC卡</logic:equal> 
            <logic:equal property="Class/RepastCard" value="2">纸卡</logic:equal> 
            <logic:equal property="Class/RepastCard" value="3">餐票</logic:equal>             
            </td>
            <td align="right" class="td2" >就餐类型：</td>
            <td class="td1" >
               <bean:write property="jiuCan"/>              
              </td>
            <td align="right" class="td2" >预存金额：            </td>
            <td class="td1" colspan="3" width="337">
            <bean:write property="Class/Deposit" />
            元</td>
          </tr>
          <tr>
            <td align="right" class="td2" >班&nbsp;主&nbsp;任：</td>
            <td class="td1" colspan="3">
            <bean:write property="Class/headTeacher"/>
           </td>
            <td align="right" class="td2" >副班主任：</td>           
            <td class="td1" colspan="3" width="337">
             <bean:write property="Class/teacherAssistant" />            
             </td>
          </tr>
          <tr  onClick="">
                  <td align="right" class="td2" width="">是否制作通讯录：</td>
            <td class="td1" width="" colspan="3">
			
          
			  <logic:equal property="Class/makeLinkBook" value="0">否</logic:equal>
			<logic:equal property="Class/makeLinkBook" value="1">是</logic:equal>
			  </td>
            <td align="right" class="td2" width="">是否制作学员名册：</td>
            <td class="td1" width="" colspan="3">
        
			  	  <logic:equal property="Class/makeStuBook" value="0">否</logic:equal>
			<logic:equal property="Class/makeStuBook" value="1">是</logic:equal>
			  </td> </tr>
			  
              <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="" nowrap>订报纸：</td>
            <td class="td1" width="" colspan="3">
              
         <logic:equal property="Class/buyNewspaper" value="0">否</logic:equal>
			<logic:equal property="Class/buyNewspaper" value="1">是</logic:equal> </td>
            <td align="right" class="td2" >拍集体照：</td>
            <td class="td1" width="" colspan="3">
              
             <logic:equal property="Class/takePhoto" value="0">否</logic:equal>
			<logic:equal property="Class/takePhoto" value="1">是</logic:equal>
			   </td>
          </tr>
             <tr  onClick="changeTRBgColor(this)">
            <td width="" align="right" class="td2">报到地点：</td>
            <td colspan="7" class="td1" >
<bean:write property="regRoom"/>
        </td>            
          </tr>    
          <tr  onClick="">
            <td align="right" class="td2" width="">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td> 
            <td colspan="7" class="td1" width="">   
           <bean:write property="Class/Remark"/>       
           </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>  <td align="center">            
              <input name="Submit2" type="button" onClick="javascript:history.go(-1)" class="button_02" value="返 回"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text"><input name="flag" type="hidden" value='<bean:write property="Class/isHistoryClass"/>'></td>
    </tr>
  </table>
</form>


<script language="javascript">
   function goBack(){
      var frm=document.addUpdateForm;
      frm.action="teachWorkManage.prClassInfoManage.classInfoList.do?PageCond/begin=0&Class/isHistoryClass/criteria/value="+frm.elements["flag"].value;
      frm.target="_self";
      frm.submit();
  }
</script>