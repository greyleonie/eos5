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
            <td class="text_wirte">学员管理—&gt;学员文章管理—&gt;学员文章批改</td>
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
            <td width="15%" align="right" class="td2">班     级：</td>
            <td colspan="3" class="td1">&nbsp;
			<bean:write property="Class/ClassName"/>            </td>
			<html:hidden name="TeachingCase/ClassID" property="Class/ClassID"/>
			<html:hidden name="TeachingCase/Title" property="QueryThesis/ThesisTitle"/>
			<html:hidden name="TeachingCase/Editor" property="QueryThesis/operatorname"/>
			<html:hidden name="TeachingCase/Post" value="学员"/>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">姓 名：</td>
            <td width="29%" class="td1">&nbsp;
            <bean:write property="QueryThesis/operatorname"/></td>
            <td width="15%" align="right" class="td2">学 号：</td>
            <td width="41%" class="td1">&nbsp;
            <bean:write property="QueryThesis/StudentNO"/>            </td>
		  </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">文章题目：</td>
            <td colspan="3" class="td1">&nbsp;
            <a href='/common/page/viewimgdb/viewFromDB.jsp?table=Thesis&pkn=ThesisID&field=ThesisContent&pkv=<bean:write  property="QueryThesis/ThesisID"/>&type=<bean:write property="QueryThesis/ContentType"/>&fileName=<bean:write property="QueryThesis/ThesisTitle" filter="true"/>'>
                  <bean:write  property="QueryThesis/ThesisTitle"/>
                  </a>        &nbsp;&nbsp;&nbsp;&nbsp;    
				   <logic:present property="QueryThesis/ContentType"> <a href='/common/page/viewimgdb/viewFromDB.jsp?table=Thesis&pkn=ThesisID&field=ThesisContent&pkv=<bean:write  property="QueryThesis/ThesisID"/>&type=<bean:write property="QueryThesis/ContentType"/>&fileName=<bean:write property="QueryThesis/ThesisTitle" filter="true"/>'>
                  点击下载>>
                  </a>    </logic:present>				  </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">文章类型：</td>
            <td class="td1">&nbsp;
            <bean:write property="QueryThesis/UnitTitle"/>           </td>
            <td align="right" class="td2">上传时间：</td>
            <td class="td1">&nbsp;
			<bean:write  property="QueryThesis/CommitTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">是否合写：</td>
            <td class="td1">
            &nbsp;
            <logic:equal property="QueryThesis/Iscooperate" value="1">是</logic:equal>
            <logic:notEqual property="QueryThesis/Iscooperate" value="1">否</logic:notEqual>			</td>
            <td align="right" class="td2">合写人：</td>
            <td class="td1">
            &nbsp;
            <logic:equal property="QueryThesis/Iscooperate" value="1">
				<bean:write property="QueryThesis/cooperatorsName"/>
			</logic:equal>			</td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">文章观点：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryThesis/Opinion"/>            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备 注：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryThesis/Remark"/>            </td>
          </tr>
          <tr  onclick="changeTRBgColor(this)">
            <td align="right" class="td2">成绩等级：</td>
            <td class="td1">&nbsp;
                   <html:select property="Thesis/Score"  > 
              <html:options property="list[@type='ScoreType']/ScoreType/scoretypename" labelProperty="list[@type='ScoreType']/ScoreType/scoretypename"/> 
              </html:select>        
                           </td>
            <td align="right" class="td2">是否优秀文章：</td>
            <td class="td1" nowrap>
					<html:select property="Thesis/isGood" onchange="selectLevel()">
						<html:option value="0">否</html:option>
						<html:option value="1">是</html:option>
					</html:select>
				           
         </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="80">文章评语：</td>
            <td colspan="3" class="td1">&nbsp;
            <html:textarea property="Thesis/Summary" attributesText='class="input" ' rows="6" cols="60"/> 
</td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="Button" type="button" class="button_02" value="保 存" onClick="save(0)">
              <input id="bt" name="Button2" type="button" style="display: none" class="button_eight" value="保存并添加到案例库" onClick="save(1)">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
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
		alert("请选择成绩等级");
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