<%@include file="/internet/common.jsp"%>
<body>
<form>
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length"/>
<html:hidden property="isAdd"/>
<html:hidden property="Course/CourseID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;��������</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">���в���  
               <html:select property="group"  onchange="queryCourse()"> 
              <html:option value="-1">--��ѡ����в�--</html:option> 
              <html:options property="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgid" labelProperty="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgname"/> 
              </html:select>
               <html:radio property="isHistory" value="0"/>δִ�пγ� <html:radio property="isHistory" value="1"/>��ִ�пγ�
             �ڿν�ʦ�� <html:select property="keyWord/isOut"  > 
                           <html:option value="-1">����</html:option>            
                           <html:option value="0">У��</html:option>
                           <html:option value="1">����</html:option> 
                       </html:select>�ʱ�䣺 <html:text property="keyWord/time" attributesText='class="input" size="14"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["keyWord/time"],"yyyy-MM-dd")>
            <br>
              �ؼ��֣�             
              <html:text property="keyWord/word" attributesText='class="input" size="20"'/>                   
                <input name="B1" type="button" class="button_02" value="��ѯ" onClick="search()"> 
            
                <br>
                 <qx:talentButton property="daochu" type="button" styleClass="button_02" value="�� ��" onclick="add()" operation="DX_TEACH_MANAGE_TeachPlan_courseAll.DX_TEACH_MANAGE_TeachPlan_courseAll_add"/>
          
                  <qx:talentButton property="B32" type="button" styleClass="button_02" value="�� ��" onclick="update()" operation="DX_TEACH_MANAGE_TeachPlan_courseAll.DX_TEACH_MANAGE_TeachPlan_courseAll_u"/>
            <qx:talentButton property="B34" type="button" styleClass="button_02" value="ɾ ��" onclick="del()" operation="DX_TEACH_MANAGE_TeachPlan_courseAll.DX_TEACH_MANAGE_TeachPlan_courseAll_d"/>
          
                <input name="chakan" type="button" class="button_02" value="�� ��" onClick="view()"> 
                <input name="B3" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()"> 
<input name="B33" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">             
</td> 
        </tr>
      </table>      
        <table width="100%" height="8"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td> </td>
          </tr>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr align="center" class="td_title">
            <td width="4%">
            <input type="checkbox" name="ckAll" onclick="selectStatus(this)" marked="first">

           </td>
            <td width="4%">���</td>       
                    
            <td width="25%">�γ̱���</td>           
            <td width="6%">�ڿν�ʦ</td>
            <td width="7%">�Ƿ�����</td>
            <td width="7%">�������в�</td>
            <td width="6%">���ʱ��</td>            
          </tr>
          <%
          int count=0; 
            String style="";
          %>
          <logic:iterate id="resultSet" property="list[@type='Subjects']">
          <% String isOuter="";
          try{
            isOuter=base.util.TalentContext.getValue(pageContext,"resultSet","Subjects/IsOuter");
          }catch(Exception e){
            System.out.println("=========errors:"+e);
          }
        
          if(count%2==0){
              style="td1";  
             }else{
             style="td2"; 
             }
           %>
          <tr class="<%=style %>">
             <td width="4%" align="center">           
             <html:checkbox id="resultSet" name="list[@name='update']/Subjects/SubjectID" property="Subjects/SubjectID" indexed="true"/>
            </td>   
               <td width="4%" align="center">   
               <SCRIPT>
            		var isnew='<bean:write id="resultSet" property="Subjects/IsNew"/>';
            		var temp='<%=count+1 %>';
            		if(isnew=='1')
            			temp='<font color="red">'+temp+'</font>';
            		document.write(temp);
            	</SCRIPT>
                
                 </td> 
                          
            <td width="25%">
            	<SCRIPT>
            		var isnew='<bean:write id="resultSet" property="Subjects/IsNew"/>';
            		var temp='<bean:write id="resultSet" property="Subjects/SubjectName"/>';
            		if(isnew=='1')
            			temp='<font color="red">'+temp+'</font>';
            		document.write(temp);
            	</SCRIPT>
            </td>
            <td width="6%" align="center">
            <SCRIPT>
            		var isnew='<bean:write id="resultSet" property="Subjects/IsNew"/>';
            		var temp='<bean:write id="resultSet" property="Subjects/Teacher"/>';
            		if(isnew=='1')
            			temp='<font color="red">'+temp+'</font>';
            		document.write(temp);
            	</SCRIPT>            
            <logic:equal id="resultSet" property="Subjects/IsOuter" value="1"><SCRIPT>
            		var isnew='<bean:write id="resultSet" property="Subjects/IsNew"/>';
            		var temp='<bean:write id="resultSet" property="Subjects/outTeacher"/>';
            		if(isnew=='1')
            			temp='<font color="red">'+temp+'</font>';
            		document.write(temp);
            	</SCRIPT></logic:equal>
            </td>
            <td width="3%" align="center">
            <SCRIPT>
            		var isnew='<bean:write id="resultSet" property="Subjects/IsNew"/>';
            		var temp='<logic:equal id="resultSet" property="Subjects/IsOuter" value="0">��</logic:equal>'+'<logic:equal id="resultSet" property="Subjects/IsOuter" value="1">��</logic:equal>';
            		if(isnew=='1')
            			temp='<font color="red">'+temp+'</font>';
            		document.write(temp);
            	</SCRIPT>  
            <% 
            if(isOuter==null||isOuter.equals("")){
            %>
           <SCRIPT>
            		var isnew='<bean:write id="resultSet" property="Subjects/IsNew"/>';
            		var temp='��';
            		if(isnew=='1')
            			temp='<font color="red">'+temp+'</font>';
            		document.write(temp);
            	</SCRIPT>
          <%
          }
           %>
            </td>
            <td width="6%" align="center">
            <SCRIPT>
            		var isnew='<bean:write id="resultSet" property="Subjects/IsNew"/>';
            		var temp='<bean:write id="resultSet" property="Subjects/orgId"/>';
            		if(isnew=='1')
            			temp='<font color="red">'+temp+'</font>';
            		document.write(temp);
            	</SCRIPT>
            </td>
             <td width="6%" align="center">
             <SCRIPT>
            		var isnew='<bean:write id="resultSet" property="Subjects/IsNew"/>';
            		var temp='<bean:write id="resultSet" property="Subjects/time" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy��MM��dd��"/>';
            		if(isnew=='1')
            			temp='<font color="red">'+temp+'</font>';
            		document.write(temp);
            	</SCRIPT>
             </td>
          </tr>
           <% count++; %>
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
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script language="javascript">
var frm=document.forms[0];

function add(){
 frm.elements["isAdd"].value="1";
 frm.action="teachWorkManage.prMakeTeachPlan.addSubjects.do";
 frm.submit();
}

function queryCourse(){
  if(frm.elements["group"].value!="-1"){
    search();
  }
}

function search(){
  var keyWord=frm.elements["keyWord/word"].value;
  if(keyWord!=""){
    checkKeyWord(keyWord);
  }
  frm.elements["PageCond/count"].value="";
  frm.elements["PageCond/begin"].value="";
  frm.action="teachWorkManage.prMakeTeachPlan.subjectManage.do";
  frm.submit();
}

function checkKeyWord(keyWord){
    if(keyWord.indexOf("'")>-1||keyWord.indexOf("%")>-1){
       alert("�ؼ��ֲ��ܰ���'%�ȷ��ţ�");
       return false;
    }
}

function update(){
  if(frm.elements["isHistory"][1].checked){
     alert("��ִ�пγ̲������޸ģ�");
     return;
  }
  
  if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
frm.elements["isAdd"].value="2";
frm.action="teachWorkManage.prMakeTeachPlan.subjectsRecord.do";
frm.submit();
}

function del(){

 if(frm.elements["isHistory"][1].checked){
     alert("��ִ�пγ̲�����ɾ����");
     return;
  }
   if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
 if(confirm("ȷʵҪɾ��������")==true){
frm.action="teachWorkManage.prMakeTeachPlan.delSubjects.do";
frm.submit();
}
}

function selectStatus(obj){

  var array=frm.elements;

  for(var i=0;i<array.length;i++){
  if(obj.type=="checkbox"){
    array[i].checked=obj.checked
    }
  }
}

function view(){
  if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
   frm.elements["isAdd"].value="3";
   frm.action="teachWorkManage.prMakeTeachPlan.subjectsRecord.do";
  if(frm.elements["isHistory"][1].checked){
     courseId=getChechedValue(frm);
     frm.elements["Course/CourseID"].value=courseId;
     frm.action="teachWorkManage.prMakeTeachPlan.courseDetail.do";
   }
   frm.submit();
}

function getChechedValue(form) {
	
		var eles = form.elements;
		var i=0;
		while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				  return obj.value;
			     }
			}
			i++
		}//while
}
</script>