<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="studentmanage.prThesis.thesisGradeDo.do">
 <html:hidden property="Thesis/ThesisID"/>
 <html:hidden property="queryaction"/>
 <html:hidden name="QueryThesis/ClassID/criteria/value" property="QueryThesis/ClassID" />
 <html:hidden property="isAdd" value=""/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;ѧԱ���¹���&gt;ѧԱ��������</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="15%" align="right" class="td2">��     ����</td>
            <td colspan="3" class="td1">&nbsp;
			<bean:write property="Class/ClassName"/>            </td>
			<html:hidden name="TeachingCase/ClassID" property="Class/ClassID"/>
			<html:hidden name="TeachingCase/Title" property="QueryThesis/ThesisTitle"/>
			<html:hidden name="TeachingCase/Editor" property="QueryThesis/operatorname"/>
			<html:hidden name="TeachingCase/Post" value="ѧԱ"/>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�� ����</td>
            <td width="29%" class="td1">&nbsp;
            <bean:write property="QueryThesis/operatorname"/></td>
            <td width="15%" align="right" class="td2">ѧ �ţ�</td>
            <td width="41%" class="td1">&nbsp;
            <bean:write property="QueryThesis/StudentNO"/>            </td>
		  </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">������Ŀ��</td>
            <td colspan="3" class="td1">&nbsp;
            <a href='/common/page/viewimgdb/viewFromDB.jsp?table=Thesis&pkn=ThesisID&field=ThesisContent&pkv=<bean:write  property="QueryThesis/ThesisID"/>&type=<bean:write property="QueryThesis/ContentType"/>&fileName=<bean:write property="QueryThesis/ThesisTitle" filter="true"/>'>
                  <bean:write  property="QueryThesis/ThesisTitle"/>
                  </a>        &nbsp;&nbsp;&nbsp;&nbsp;    
				   <logic:present property="QueryThesis/ContentType"> <a href='/common/page/viewimgdb/viewFromDB.jsp?table=Thesis&pkn=ThesisID&field=ThesisContent&pkv=<bean:write  property="QueryThesis/ThesisID"/>&type=<bean:write property="QueryThesis/ContentType"/>&fileName=<bean:write property="QueryThesis/ThesisTitle" filter="true"/>'>
                  �������>>
                  </a>    </logic:present>				  </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�������ͣ�</td>
            <td class="td1">&nbsp;
            <bean:write property="QueryThesis/UnitTitle"/>           </td>
            <td align="right" class="td2">�ϴ�ʱ�䣺</td>
            <td class="td1">&nbsp;
			<bean:write  property="QueryThesis/CommitTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�Ƿ��д��</td>
            <td class="td1">
            &nbsp;
            <logic:equal property="QueryThesis/Iscooperate" value="1">��</logic:equal>
            <logic:notEqual property="QueryThesis/Iscooperate" value="1">��</logic:notEqual>			</td>
            <td align="right" class="td2">��д�ˣ�</td>
            <td class="td1">
            &nbsp;
            <logic:equal property="QueryThesis/Iscooperate" value="1">
				<bean:write property="QueryThesis/cooperatorsName"/>
			</logic:equal>			</td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">���¹۵㣺</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryThesis/Opinion"/>            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�� ע��</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryThesis/Remark"/>            </td>
          </tr>
          <tr  onclick="changeTRBgColor(this)">
            <td align="right" class="td2">�ɼ��ȼ���</td>
            <td class="td1">&nbsp;
                   <html:select property="Thesis/Score"  > 
              <html:options property="list[@type='ScoreType']/ScoreType/scoretypename" labelProperty="list[@type='ScoreType']/ScoreType/scoretypename"/> 
              </html:select>        
                           </td>
            <td align="right" class="td2">�Ƿ��������£�</td>
            <td class="td1" nowrap>
					<html:select property="Thesis/isGood" onchange="selectLevel()">
						<html:option value="0">��</html:option>
						<html:option value="1">��</html:option>
					</html:select>
				           
         </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="80">�������</td>
            <td colspan="3" class="td1">&nbsp;
            <html:textarea property="Thesis/Summary" attributesText='class="input" ' rows="6" cols="60"/> 
</td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="Button" type="button" class="button_02" value="�� ��" onClick="save(0)">
              <input id="bt" name="Button2" type="button" style="display: none" class="button_eight" value="���沢��ӵ�������" onClick="save(1)">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <script type="text/javascript">

var frm = document.forms[0];
   function save(saveType) {
   frm.elements["isAdd"].value=saveType;
  	if(frm.elements["Thesis/Score"].value == "") {
		alert("��ѡ��ɼ��ȼ�");
		return
	}


  if(validater(frm)) frm.submit();
  }
  
function selectLevel(){
  var isGood=frm.elements["Thesis/isGood"].value;
  
  if(isGood=="1"){
    frm.elements["bt"].style.display="";
  }else{
    frm.elements["bt"].style.display="none";
  }
  
  }
  </script>