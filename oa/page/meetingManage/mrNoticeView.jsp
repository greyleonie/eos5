<%@include file="/internet/common.jsp"%>

<form method="post"  action="oa.prMeetingManage.mrNoticeAddDO.do">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�������&gt;����֪ͨ�鿴</td>
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
              &nbsp;<bean:write property="MR_NOTICE/TOPIC"/>
              </td>
              <td width="16%" align="right" nowrap class="td2">����ص㣺</td>
              <td nowrap class="td1">
            	&nbsp;<bean:write property="MR_NOTICE/MRNAME"/>
              </td>
              </tr>
            <tr class="td2">
              <td align="right" nowrap class="td2">���鿪ʼʱ�䣺</td>
              <td  nowrap class="td1">
              &nbsp;<bean:write property="MR_NOTICE/STARTDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm"/>
              </td>
              <td align="right" nowrap class="td2">�������ʱ�䣺</td>
              <td width="25%" nowrap class="td1">
             	&nbsp;<bean:write property="MR_NOTICE/ENDDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm"/>
             	</td>
             	
            </tr>
            <tr class="td1">
              <td align="right" nowrap class="td2" height="60">��Ҫ���⣺</td>
              <td colspan="3" nowrap class="td1">
              &nbsp;<bean:write property="MR_NOTICE/CENTRALTOPIC"/>
             </td>
              </tr>
              
            <tr class="td2">
              <td align="right" nowrap class="td2">��&nbsp;��&nbsp;�ˣ�</td>
              <td colspan="3" nowrap class="td1">
              &nbsp;<bean:write property="MR_NOTICE/Moderator" formatClass="username" formatType="operatorID"/>
             </td>
            </tr>
            
            <tr class="td1">
              <td align="right" nowrap class="td2">�μ���Ա��</td>
              <td colspan="3" nowrap class="td1">
				&nbsp;<bean:write property="MR_NOTICE/Participants" formatClass="username" formatType="operatorID"/>
				</td>
            </tr>
            <tr class="td1">
              <td align="right" nowrap class="td2">֪ͨ��Ա��</td>
              <td colspan="3" nowrap class="td1">
             &nbsp;<bean:write property="MR_NOTICE/NoticeScopeName"/>
				</td>
            </tr>

            <tr class="td2">
              <td align="right" nowrap class="td2" height="60">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
              <td colspan="3" nowrap class="td1">
				&nbsp;<bean:write property="MR_NOTICE/REMARK"/>
				</td>
              </tr>
            <tr class="td2">
              <td align="right" nowrap class="td2" >�Ѳ鿴��Ա��</td>
              <td colspan="3" nowrap class="td1">
				&nbsp;<bean:write property="MR_NOTICE/HaveReadIDsName"/>
				</td>
              </tr>

       
          
        
        
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <br>
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
 

 