<%@include file="/internet/common.jsp"%>
<%
java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat("yyyy-MM-dd");
String today = formater.format(new java.util.Date());
java.text.SimpleDateFormat formater1 = new java.text.SimpleDateFormat("HH:mm:dd");
String today1 = formater1.format(new java.util.Date());

%>
<form method="post"  action="oa.prMeetingManage.mrNoticeAddDO.do">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�������&gt;����֪ͨ����</td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td class="text"><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
            <tr >
              <td width="14%" align="right" nowrap class="td2">�������⣺</td>
              <td width="26%" nowrap class="td1">
              <html:text property="MR_NOTICE/TOPIC"  attributesText='class="input" size="30" ValidateType="notempty" Msg="���ⲻ��Ϊ��"'/>
              <span class="text_red">*</span>
              </td>
              <td width="16%" align="right" nowrap class="td2">����ص㣺</td>
              <td nowrap class="td1">
            
              
              <html:hidden  property="MR_NOTICE/MRCODE"  />
              <html:text property="MR_NOTICE/MRNAME" styleClass="input" attributesText=' ValidateType="notempty" Msg="����ص㲻��Ϊ��"'/>
              <input name="Submit2232" elname="MR_NOTICE/MRCODE,MR_NOTICE/MRNAME" type="button" class="button_02" value="ѡ��" onclick="selectMeetingRoom()">
			  <span class="text_red">*</span>
			  </td>
              </tr>
            <tr class="td2">
              <td align="right" nowrap class="td2">���鿪ʼʱ�䣺</td>
              <td  nowrap class="td1">
              
                <input name="MR_NOTICE/STARTDATE[@pattern='yyyy-MM-dd HH:mm:ss']" type="text"  readonly="true" size="20" class="input" ValidateType="notempty" Msg="��ʼʱ�䲻��Ϊ��" onclick="calendar(this,'yyyy-MM-dd HH:mm:ss')">&nbsp;
                   
                <span class="text_red">*</span>
                </td>
              <td align="right" nowrap class="td2">�������ʱ�䣺</td>
              <td width="25%" nowrap class="td1">
             
               <input name="MR_NOTICE/ENDDATE[@pattern='yyyy-MM-dd HH:mm:ss']" type="text"  readonly="true" size="20" class="input" ValidateType="notempty" Msg="��ʼʱ�䲻��Ϊ��" onclick="calendar(this,'yyyy-MM-dd HH:mm:ss')">&nbsp;
                  <span class="text_red">*</span>
              </td>
            </tr>
            <tr class="td1">
              <td align="right" nowrap class="td2">��Ҫ���⣺</td>
              <td colspan="3" nowrap class="td1"><html:textarea property="MR_NOTICE/CENTRALTOPIC" cols="50" rows="5" styleClass="input"/></td>
              </tr>
              
            <tr class="td2">
              <td align="right" nowrap class="td2">��&nbsp;��&nbsp;�ˣ�</td>
              <td colspan="3" nowrap class="td1">
              <html:hidden  property="MR_NOTICE/Moderator" attributesText=' ValidateType="notempty" Msg="�����˲���Ϊ��"'/>
              <html:text property="Moderator" readonly="true"/>
              <input name="Submit2232" type="button" class="button_02"  elname="MR_NOTICE/Moderator,Moderator" value="ѡ��" onclick="selectSysUser('yes')">                
              <span class="text_red">*</span>
              </td>
            </tr>
            
            <tr class="td1">
              <td align="right" nowrap class="td2">�μ���Ա��</td>
              <td colspan="3" nowrap class="td1">
             
                <html:hidden  property="MR_NOTICE/Participants" attributesText=' ValidateType="notempty" Msg="�μ���Ա����Ϊ��"'/>
              <html:text property="Participants" readonly="true"/>
              <input name="receiver" type="button" class="button_02" value="ѡ����Ա" elname="MR_NOTICE/Participants,Participants"  onClick="selectSysUser('all')">   
              <span class="text_red">*</span>
              </td>
            </tr>
            <tr class="td1">
              <td align="right" nowrap class="td2">֪ͨ��Ա��</td>
              <td colspan="3" nowrap class="td1">
             
				  	<html:textarea property="NoticeScope"  cols="50" rows="3" styleClass="input" />

                     <html:hidden property="MR_NOTICE/NoticeScope"/>

                    &nbsp; <input name="receiver" type="button" class="button_02" value="ѡ����Ա" elname="MR_NOTICE/NoticeScope,NoticeScope"  onClick="selectSysUser('all')">                </td>
            </tr>

            <tr class="td2">
              <td align="right" nowrap class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
              <td colspan="3" nowrap class="td1"><html:textarea property="MR_NOTICE/REMARK" cols="50" rows="8" styleClass="input"/></td>
              </tr>
            <tr>
              <td colspan="4" align="right" class="td1"></td>
            </tr>

       
          
        
        
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <br>
              <input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>
 
  <script>

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function singleselectUser(){
  	window.open("oa.prMeetingManage.singleSelectUser.do","","width=500,height=450,left=200,top=100");
  }
  </script>
 