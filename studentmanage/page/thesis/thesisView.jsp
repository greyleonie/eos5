<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学员文章管理—&gt;学员文章查看</td>
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
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">姓 名：</td>
            <td width="29%" class="td1">&nbsp;
            <bean:write property="QueryThesis/operatorname"/></td>
            <td width="15%" align="right" class="td2">学 号：</td>
            <td width="41%" class="td1">&nbsp;
            <bean:write property="QueryThesis/StudentNO"/>			
            </td>
		  </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">文章题目：</td>
            <td colspan="3" class="td1">&nbsp;
            <a href='/common/page/viewimgdb/viewFromDB.jsp?table=Thesis&pkn=ThesisID&field=ThesisContent&pkv=<bean:write  property="QueryThesis/ThesisID"/>&type=<bean:write property="QueryThesis/ContentType"/>&fileName=<bean:write property="QueryThesis/ThesisTitle" filter="true"/>'>
                  <bean:write  property="QueryThesis/ThesisTitle"/>
                  </a>	
            </td>
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
            <logic:notEqual property="QueryThesis/Iscooperate" value="1">否</logic:notEqual>
            
			</td>
            <td align="right" class="td2">合写人：</td>
            <td class="td1">
            &nbsp;
            <logic:equal property="QueryThesis/Iscooperate" value="1">
				<bean:write property="QueryThesis/cooperatorsName"/>
			</logic:equal>
	
			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">成绩等级：</td>
            <td class="td1">&nbsp;
            <bean:write property="QueryThesis/Score"/>
            </td>
            <td align="right" class="td2">批改老师：</td>
            <td class="td1">&nbsp;
            <bean:write property="QueryThesis/commentTeacher"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">是否优秀文章：</td>
            <td class="td1">&nbsp;<logic:equal property="QueryThesis/isGood" value="1">是</logic:equal>
            <logic:notEqual property="QueryThesis/isGood" value="1">否</logic:notEqual>
            </td>
            <td align="right" class="td2">文章内容：</td>
            <td class="td1">&nbsp;
            <logic:present property="QueryThesis/ContentType">
            <a href='/common/page/viewimgdb/viewFromDB.jsp?table=Thesis&pkn=ThesisID&field=ThesisContent&pkv=<bean:write  property="QueryThesis/ThesisID"/>&type=<bean:write  property="QueryThesis/ContentType"/>&fileName=<bean:write  property="QueryThesis/ThesisTitle" filter="true"/>'>
                  点击下载文章内容>>
                  </a>
             </logic:present>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">文章观点：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryThesis/Opinion"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备 注：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryThesis/Remark"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">文章评语：</td>
            <td colspan="3" class="td1">
            <bean:write property="QueryThesis/Summary"/></td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
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
  