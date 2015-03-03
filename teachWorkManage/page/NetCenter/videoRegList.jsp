<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prNetCenter.videoRegList.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;<span id="printTable">录像资料（已登记）</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.videoRegList.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prNetCenter.videoRegModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prNetCenter.videoRegDelete.do">
		<html:hidden property="VideoRegister/_order/col1/field"/>
		<html:hidden property="VideoRegister/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				类别：
            <html:select property="VideoRegister/DataType/criteria/value">
							<html:option value="">--请选择--</html:option>
							<html:option value="录像带">录像带</html:option>
							<html:option value="DV带">DV带</html:option>
							<html:option value="视频文件">视频文件</html:option>
							<html:option value="DVD">DVD</html:option>
							<html:option value="VCD">VCD</html:option>
							<html:option value="VCD">VCD</html:option>
			</html:select>
			<html:hidden property="VideoRegister/DataType/criteria/operator" value="="/>
			来源：
            <html:select property="VideoRegister/Source/criteria/value">
							<html:option value="">--请选择--</html:option>
							<html:option value="自录">自录</html:option>
							<html:option value="中央党校">中央党校</html:option>
							<html:option value="省党校">省党校</html:option>
							<html:option value="其他">其他</html:option>
			</html:select>
            日期： 从
            	<html:text property="VideoRegister/RecordTime/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["VideoRegister/RecordTime/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="VideoRegister/RecordTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["VideoRegister/RecordTime/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="VideoRegister/RecordTime/criteria/operator" value="between"/>
			    <input type="hidden" name="VideoRegister/RecordTime/criteria/criteriaPattern" value="yyyy-MM-dd"/><br>
			 关键字（题目或主讲人）：<html:text property="VideoRegister/seachText" attributesText='class="input" size="20"' />
			 <br/>
			 
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">  
                <input name="modify" type="button" class="button_02" value="修 改" onClick="talentmodify()">
				<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">			
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center"  nowrap >选择 </td>
                  <td width="10%" align="center"  nowrap id="VideoRegister.RecordTime" onClick="talentsort()">收录时间</td>
                  <td width="20%" align="center"  nowrap id="VideoRegister.Title" onClick="talentsort()">题目</td>
                  <td width="10%" align="center"  nowrap id="VideoRegister.Speaker" onClick="talentsort()">主讲人</td>
                  <td width="10%" align="center"  nowrap id="VideoRegister.Org" onClick="talentsort()">单位</td>
                  <td width="10%"  align="center"  nowrap id="VideoRegister.Post" onClick="talentsort()">职务</td>
                  <td width="5%"  align="center"  nowrap id="VideoRegister.DocumentNO" onClick="talentsort()">档案号</td>
                  <td width="5%"  align="center"  nowrap id="VideoRegister.Length" onClick="talentsort()">长度</td>
                  <td width="5%"  align="center"  nowrap id="VideoRegister.Recorder" onClick="talentsort()">收录人</td>
                  <td width="5%"  align="center"  nowrap id="VideoRegister.DataType" onClick="talentsort()">资料类型</td>
                  <td width="5%"  align="center"  nowrap id="VideoRegister.Source" onClick="talentsort()">资料来源</td>
				  <td width="10%"  align="center"  nowrap id="VideoRegister.Remarks" onClick="talentsort()">备注</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='VideoRegister']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  
                  <td align="center"><logic:present  id="resultset" property="VideoRegister/RegisterID">
			       <html:checkbox id="resultset" name="list[@name='update']/VideoRegister/RegisterID" property="VideoRegister/RegisterID" indexed="true"/>
			       </logic:present></td>
				  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/RecordTime" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
				  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Title"  /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Speaker" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Org" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Post" /></td>    
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/DocumentNO" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Length" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Recorder" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/DataType" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Source" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Remarks" /></td>

                </tr>
				</logic:iterate>
                
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		     </script>
			  </td>
            </tr>
			 
          </table>
		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script type="text/javascript">
<!--

//-->

</script>