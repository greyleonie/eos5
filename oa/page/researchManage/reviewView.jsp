<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.reviewAddDo.do">
  		<input type="hidden" name="filepath" value="KetiSb"/>
		<input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="KetiSb">
		<input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F"> 
		
		<html:hidden property="KetiSb/_order/col1/field"/>
		<html:hidden property="KetiSb/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="KetiSb/KetiSbID" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���й���&gt;<logic:equal property="type" value="sb">�����걨</logic:equal><logic:equal property="type" value="bj">�ɹ��걨</logic:equal></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">�������ƣ�</td>
            <td width="70%" class="td1">&nbsp;<bean:write property="KetiSb/KetiName"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">�걨�ˣ�</td>
            <td width="70%" class="td1">&nbsp;<bean:write property="KetiSb/Sbr"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">���ڲ��ţ�</td>
            <td width="70%" class="td1">&nbsp;<bean:write property="KetiSb/SbrDepartment"/></td>
          </tr>
          <logic:equal property="KetiSb/isShenBao" value="0">
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">�걨���ڣ�</td>
            <td width="70%" class="td1">&nbsp;
            <bean:write property="KetiSb/ShenBaoriqi" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
          </tr>
          </logic:equal>
          <logic:equal property="KetiSb/isShenBao" value="1">
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">�ϱ����ڣ�</td>
            <td width="70%" class="td1">&nbsp;
            <bean:write property="KetiSb/ShangBaoriqi" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
          </tr>
          </logic:equal>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">�걨�ĵ���</td>
            <td width="70%" class="td1">
              <logic:iterate id="resultSbList" property="list[@type='SbFj']">
                
                   <a href='/common/page/viewimgdb/viewFromDB.jsp?table=SbFj&pkn=SbFjId&field=Content&pkv=<bean:write id="resultSbList" property="SbFj/SbFjId"/>&type=<bean:write id="resultSbList" property="SbFj/filetype"/>&fileName=<bean:write id="resultSbList" property="SbFj/name" filter="true"/>' target="_blank">
                   &nbsp;<bean:write id="resultSbList" property="SbFj/name"/>
                    </a>
                   <br>
              
                </logic:iterate>
            
            </td>
          </tr>
          <logic:notEqual property="KetiSb/ShangBaoState" value="0">
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">��������</td>
            <td width="70%" class="td1">&nbsp;
            <logic:equal property="KetiSb/ShangBaoState" value="1">ͨ��</logic:equal>
            <logic:equal property="KetiSb/ShangBaoState" value="2">��ͨ��</logic:equal>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">���д������</td>
            <td width="70%" class="td1">&nbsp;
            <bean:write property="KetiSb/KeyanChuYijian"/></td>
          </tr>
          </logic:notEqual>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
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

 