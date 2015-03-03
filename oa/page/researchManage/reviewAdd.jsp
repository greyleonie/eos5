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
		<html:hidden property="type" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;科研管理—&gt;<logic:equal property="type" value="sb">课题申报评审</logic:equal><logic:equal property="type" value="bj">成果申报评审</logic:equal></td>
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
            <td width="30%" align="right" class="td2">课题名称：</td>
            <td width="70%" class="td1">&nbsp;<bean:write property="KetiSb/KetiName"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">申报人：</td>
            <td width="70%" class="td1">&nbsp;<bean:write property="KetiSb/Sbr"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">所在部门：</td>
            <td width="70%" class="td1">&nbsp;<bean:write property="KetiSb/SbrDepartment"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">上报日期：</td>
            <td width="70%" class="td1">&nbsp;<bean:write property="KetiSb/ShangBaoriqi" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">申报文档：</td>
            <td width="70%" class="td1">
            <logic:iterate id="resultSbList" property="list[@type='SbFj']">
                
                   <a href='/common/page/viewimgdb/viewFromDB.jsp?table=SbFj&pkn=SbFjId&field=Content&pkv=<bean:write id="resultSbList" property="SbFj/SbFjId"/>&type=<bean:write id="resultSbList" property="SbFj/filetype"/>&fileName=<bean:write id="resultSbList" property="SbFj/name" filter="true"/>' target="_blank">
                   &nbsp;<bean:write id="resultSbList" property="SbFj/name"/>
                    </a>
                   <br>
              
                </logic:iterate></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">评审结果：</td>
            <td width="70%" class="td1">&nbsp;<input type="radio" name="KetiSb/ShangBaoState" value='1' checked>通过
            <input type="radio" name="KetiSb/ShangBaoState" value='2'>不通过</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">科研处意见：</td>
            <td width="70%" class="td1">&nbsp;<textarea name="KetiSb/KeyanChuYijian" cols="50" rows="5"></textarea></td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
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
  
  </script>
 