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
            <td class="text_wirte">��ҳ -&gt; ������� -&gt; �༶����  
              -&gt; �༶�鿴</td> 
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
            <td width="" align="right" class="td2">�༶���ƣ�</td>
            <td colspan="7" class="td1" width=""><bean:write property="Class/ClassName" />
           </td>            
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">�༶��ƣ� </td>
            <td width="" class="td1" colspan="3">
             <bean:write property="Class/ClassShortName" />
         </td>            
            <td width="" align="right" class="td2">�༶���ͣ� </td>
            <td width="" class="td1" colspan="3"><bean:write property="classTypeName" />
            </td>            
          </tr>
		    <tr  onClick="changeTRBgColor(this)">
            <td nowrap align="right" class="td2">��ѵ���ţ�</td>
            <td colspan="3" class="td1" width="">
            <bean:write property="Class/ClassCode" />
		    </td>     
            <td nowrap align="right" class="td2">���¾�ϵͳ��ţ� </td>
            <td width="" class="td1" colspan="3"> 
          <bean:write property="Class/renShiNo" />
		     </td>       
          </tr>
		   <tr  onClick="changeTRBgColor(this)">
            <td nowrap align="right" class="td2">��Ŀ���ƣ�</td>
            <td colspan="3" class="td1" width="">
            <bean:write property="Class/proName" />
		    </td>     
            <td align="right" class="td2" width="">��ѧ���������� </td>
            <td width="" class="td1" width=""> 
			<logic:equal property="Class/IsUnitEva" value="0">��</logic:equal>
			<logic:equal property="Class/IsUnitEva" value="1">��</logic:equal>
                </td>   
             <td nowrap align="right" class="td2" width="">���������� </td>
            <td width="" class="td1" width=""> 
			<logic:equal property="Class/IsWebEva" value="0">��</logic:equal>
			<logic:equal property="Class/IsWebEva" value="1">��</logic:equal>
                </td>       
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">��ѵ��λ�� </td>
            <td class="td1" width="" colspan="3"><bean:write property="Class/Commission" />  </td>          
            <td align="right" class="td2" width="">�ƻ�����������</td>
            <td class="td1" width="">
            <bean:write property="Class/RecruitNum" />
  </td>            
            <td align="right" class="td2" width="">ʵ������������</td>        
            <td class="td1" width="">
             <bean:write property="Class/factNum" />
           
            </td>        
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">ѧ&nbsp;&nbsp;&nbsp;&nbsp;�ƣ� </td>
            <td class="td1" width="326" colspan="3">
             <bean:write property="Class/XueZhi" />
           </td>            
            <td align="right" class="td2" width="">ѧ&nbsp;ϰ&nbsp;�գ� </td>
            <td class="td1" colspan="3" width="337">
               <bean:write property="Class/XueRi" />��</td>            
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">��&nbsp;ѵ&nbsp;�ѣ� </td>
            <td class="td1" width="326" colspan="3"> <bean:write property="Class/EducatStand" />       
            
            Ԫ</td>
            <td align="right" class="td2" width="">��&nbsp;��&nbsp;�ѣ� </td>
            <td class="td1" width="87" > <bean:write property="Class/KaoChaStand" /> Ԫ</td> 
            <td align="right" class="td2" width="">��&nbsp;��&nbsp;�ѣ�</td>        
            <td class="td1" width="105"> <bean:write property="Class/otherMoney" /> Ԫ
            </td>        
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">ע��ʱ�䣺 </td>
            <td class="td1" width="326" colspan="3">    
            <bean:write property="Class/regTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/> 
          
            </td>           
            <td align="right" class="td2" width="">����ʱ�䣺 </td>
            <td class="td1" colspan="3" width="">
            <bean:write property="Class/reachTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/> 
        
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">����ʱ�䣺</td>
            <td class="td1" width="326" colspan="3">
             <bean:write property="Class/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/> 
                
            </td>
            <td align="right" class="td2" width="109">��(��)ҵʱ�䣺 </td>
            <td class="td1" colspan="3" width="">
             <bean:write property="Class/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/> 
          
            </td>         
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">�Ͽεص㣺</td>
            <td class="td1" width="" colspan="3">
            <bean:write property="Class/classRoomName"/>            
              </td>
            <td align="right" class="td2" width="">ס�޵ص㣺</td>
            <td class="td1" colspan="3" width="">          
            <bean:write property="Class/buildingName"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="">�Ͳͱ�׼�� </td>
            <td colspan="3" class="td1" width="">
          <bean:write property="Class/RepastStand" />
            </td>
			   <td align="right" class="td2" >ѧ��ǰ׺�� </td>
            <td colspan="3" class="td1" width="">
            <bean:write property="Class/Prefix" />
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" >��&nbsp;��&nbsp;����</td>
            <td class="td1" width="">
            <logic:equal property="Class/RepastCard" value="0">&nbsp;</logic:equal> 
            <logic:equal property="Class/RepastCard" value="1">IC��</logic:equal> 
            <logic:equal property="Class/RepastCard" value="2">ֽ��</logic:equal> 
            <logic:equal property="Class/RepastCard" value="3">��Ʊ</logic:equal>             
            </td>
            <td align="right" class="td2" >�Ͳ����ͣ�</td>
            <td class="td1" >
               <bean:write property="jiuCan"/>              
              </td>
            <td align="right" class="td2" >Ԥ���            </td>
            <td class="td1" colspan="3" width="337">
            <bean:write property="Class/Deposit" />
            Ԫ</td>
          </tr>
          <tr>
            <td align="right" class="td2" >��&nbsp;��&nbsp;�Σ�</td>
            <td class="td1" colspan="3">
            <bean:write property="Class/headTeacher"/>
           </td>
            <td align="right" class="td2" >�������Σ�</td>           
            <td class="td1" colspan="3" width="337">
             <bean:write property="Class/teacherAssistant" />            
             </td>
          </tr>
          <tr  onClick="">
                  <td align="right" class="td2" width="">�Ƿ�����ͨѶ¼��</td>
            <td class="td1" width="" colspan="3">
			
          
			  <logic:equal property="Class/makeLinkBook" value="0">��</logic:equal>
			<logic:equal property="Class/makeLinkBook" value="1">��</logic:equal>
			  </td>
            <td align="right" class="td2" width="">�Ƿ�����ѧԱ���᣺</td>
            <td class="td1" width="" colspan="3">
        
			  	  <logic:equal property="Class/makeStuBook" value="0">��</logic:equal>
			<logic:equal property="Class/makeStuBook" value="1">��</logic:equal>
			  </td> </tr>
			  
              <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="" nowrap>����ֽ��</td>
            <td class="td1" width="" colspan="3">
              
         <logic:equal property="Class/buyNewspaper" value="0">��</logic:equal>
			<logic:equal property="Class/buyNewspaper" value="1">��</logic:equal> </td>
            <td align="right" class="td2" >�ļ����գ�</td>
            <td class="td1" width="" colspan="3">
              
             <logic:equal property="Class/takePhoto" value="0">��</logic:equal>
			<logic:equal property="Class/takePhoto" value="1">��</logic:equal>
			   </td>
          </tr>
             <tr  onClick="changeTRBgColor(this)">
            <td width="" align="right" class="td2">�����ص㣺</td>
            <td colspan="7" class="td1" >
<bean:write property="regRoom"/>
        </td>            
          </tr>    
          <tr  onClick="">
            <td align="right" class="td2" width="">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td> 
            <td colspan="7" class="td1" width="">   
           <bean:write property="Class/Remark"/>       
           </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>  <td align="center">            
              <input name="Submit2" type="button" onClick="javascript:history.go(-1)" class="button_02" value="�� ��"></td>
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