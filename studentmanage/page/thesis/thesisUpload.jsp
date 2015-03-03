<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="studentmanage.prThesis.thesisUploadDo.do">
 <html:hidden property="QueryThesis/ClassID/criteria/value"/>
 <html:hidden property="Thesis/TeachingGroupID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学员文章管理—&gt;学员文章上传</td>
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
            <td width="21%" align="right" class="td2">姓 名：</td>
            <td width="79%" class="td1">&nbsp;
            <logic:iterate id="resultset" property="list[@name='update']">
            	<html:checkbox id="resultset" property="QueryStudent/StudentID" name="list[@name='update']/Thesis/StudentID"  indexed="true"  checked="true"/>
            	<bean:write id="resultset" property="QueryStudent/StudentID" formatClass="username" formatType="operatorID"/>&nbsp;&nbsp;            
            </logic:iterate>            
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="21%" align="right" class="td2">文章标题：</td>
            <td width="79%" class="td1">&nbsp;
            <html:text property="Thesis/ThesisTitle" maxlength="50" attributesText='class="input" size="70" ValidateType="notempty" Msg="文章标题不能为空"'/>
            <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">上传文章：</td>
            <td class="td1">&nbsp;
           <input type="file" name="ThesisContent" class="input" size="30"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">文章观点：</td>
            <td class="td1">&nbsp;
            
            <html:textarea property="Thesis/Opinion" attributesText='class="input" ' rows="6" cols="60"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备 注：</td>
            <td class="td1">&nbsp;
            <html:textarea property="Thesis/Remark" attributesText='class="input" ' rows="6" cols="60"/> 
                     </td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
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
  <script>
	function save(){
    	var frm =document.forms[0];
  	    var filepath = frm.elements["ThesisContent"].value;
        var fso =null;
        try{
        fso= new ActiveXObject("Scripting.FileSystemObject");
        }catch(e){}
		
   		if(chechedCount(frm)<1){
    		alert("--至少必须选择一个学生！");
    		return ;
    	}
    	if (fso!=null&&!fso.FileExists(filepath)) {
	         alert("--文章不存在，请重新选择！");
	         return false;
	    }
	    if (filepath.indexOf("doc")<0) {
	         alert("--请上传WORD类型的文档，谢谢！");
	         return false;
	    }
    	if(validater(frm)) frm.submit();
}
</script>