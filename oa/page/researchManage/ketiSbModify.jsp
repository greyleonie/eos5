<%@include file="/internet/common.jsp"%>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.ketiSbModifyDo.do">
  		<input type="hidden" name="filepath" value="KetiSb"/>
		<input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="KetiSb">
		<input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F"> 
		
		<html:hidden property="KetiSb/_order/col1/field"/>
		<html:hidden property="KetiSb/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="type" />
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
      <td class="text"><table width="74%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <html:hidden name="KetiSb/KetiSbID" property="fid" />
          <html:hidden name="KetiSb/ShenBaoriqi[@pattern='yyyy-MM-dd']" property="curDate"/>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">�������ƣ�</td>
            <td width="78%" class="td1">&nbsp;
            <html:text property="KetiSb/KetiName" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="�������Ʋ���Ϊ��"'/>
            <span class="text_red">*</span></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="22%" align="right" class="td2">�걨�ˣ�</td>
            <td width="78%" class="td1">&nbsp;
            <html:text property="KetiSb/Sbr" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="�걨�˲���Ϊ��"'/>
            <span class="text_red">*</span></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="22%" align="right" class="td2">���ڲ��ţ�</td>
            <td width="78%" class="td1">&nbsp;
            <html:text property="KetiSb/SbrDepartment" maxlength="50" attributesText='class="input" size="30"'/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="22%" align="right" class="td2"> <img src='/internet/image/gzl_02.gif' alt='����' align='absmiddle' style='cursor:hand' onclick='insertFile()'><FONT color="#ff0000">����������)</FONT>&nbsp;�ϴ��ĵ���</td>
            <td width="78%" class="td1">
            <TABLE border="0" >
            <!--<input type="file" name="Content" class='input' size='30'>-->
            <input type="hidden" name="flag" value="0">
             <%int i=1; %>
           
            <logic:iterate id="resultSbList" property="list[@type='SbFj']">
           
              <tr>
                 <td width="93%" class="td1" id="a<%=i %>">
                <a href='/common/page/viewimgdb/viewFromDB.jsp?table=SbFj&pkn=SbFjId&field=Content&pkv=<bean:write id="resultSbList" property="SbFj/SbFjId"/>&type=<bean:write id="resultSbList" property="SbFj/filetype"/>&fileName=<bean:write id="resultSbList" property="SbFj/name" filter="true"/>' target="_blank">
                   <bean:write id="resultSbList" property="SbFj/name"/>&nbsp; 
                             
                    </a>
                </td>
                <TD id="b<%=i %>"><img src='/internet/images/attachdelete.gif' alt='ɾ��' align='absmiddle' style='cursor:hand' onclick='deleteRow(<bean:write id="resultSbList" property="SbFj/SbFjId"/>,<%=i %>)'>
                   
                </TD>
             </tr>
             <%i++; %>
            </logic:iterate>
            
            </TABLE>
            <TABLE border="0" id="fjtable">
            <tr align="center">
          </tr>
            </TABLE>
            </td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
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
  function deleteRow(id,j){
   var td1=document.getElementById("a"+j);
   var td2=document.getElementById("b"+j);

		if(confirm("ȷ��Ҫɾ�����ĵ���"))
		{
			var sub1 = new HiddenSubmit("oa.bizResearchManage.fileDelete");
			sub1.add("fid", id);
			if (sub1.submit()) {
				var ret = sub1.getValue("root/return/code");
				if (ret == null || ret == "0") {
					alert("ɾ���ĵ�ʧ�ܣ�����ϵ����Ա");
				} else {
					alert("ɾ���ĵ��ɹ���");
					td1.style.display="none";
					td2.style.display="none";
				}
			}
		}
  }
  var i=0;
  function insertFile(){
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
	    C1.innerHTML = "<input  type='file' name='Content' class='input' size='25'  ValidateType='notempty' Msg='�ϴ��ĵ�����Ϊ��'>&nbsp;&nbsp;<img src='/internet/images/attachdelete.gif' alt='ɾ��' align='absmiddle' style='cursor:hand' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'></td>";
  }
  function save() {
  	var frm = document.forms[0];
  	frm.flag.value = "1";
	if(validater(frm)) frm.submit();
  
  }
   
  </script>
 