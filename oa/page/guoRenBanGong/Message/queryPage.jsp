<%@include file="/internet/common.jsp"%>
<!-- Insert your jsp/html code here -->
<SCRIPT language="JavaScript" src="/internet/scripts/checkForm.js" ></SCRIPT>
<SCRIPT language="JavaScript" src="/internet/scripts/check.js" ></SCRIPT>

<body onload="init()">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;
            <logic:equal     property="type" value="rece">
              已接收消息
            </logic:equal>
              <logic:equal     property="type" value="send">
              已发送消息
            </logic:equal></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
 <form name="queryForm" method="post" action="oa.prPersonOffice.queryInnerNote.do">
  <tr>
    <td><table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td> 
        <input type="hidden" name="mark" value="1"/>
		  <html:hidden property="PageCond/begin" />
	      <html:hidden property="PageCond/length" />
	      <html:hidden property="PageCond/count" />
		  <html:hidden property="InnerNote/_order/col1/field" value="SENDDATE"/>
	      <html:hidden property="InnerNote/_order/col1/asc" value="DESC"/>
	      <html:hidden property="InnerNote/MSGTYPE"/>
	      <html:hidden property="InnerNote/ISREAD"/>
	      <html:hidden property="type"/>
	      <input type="hidden" name="InnerNote/CONTENT/criteria/operator" value="like">
          <html:hidden property="InnerNote/SENDACCOUNT"/>
          <html:hidden property="InnerNote/SENDDATE"/>
        </td>
      </tr>
    </table>
      <table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td>
          <table width="94%" height="23"  border="0" cellpadding="0" cellspacing="0" class="text">
              <tr>
                
                <td align="left" class="text"> 内容:
                   <input name="InnerNote/CONTENT/criteria/value" type="text" class="input">
                   <input name="Button" type="button" class="button_02" value="查 询" onClick="query();">
                   <input name="Submit222" type="button" class="button_03" value="编写短消息" onclick="addMessage()">
                   <input name="Submit22" type="button" class="button_02" value="删 除" onClick="deleteRows()">
                   <input name="Submit22" type="button" class="button_02" value="查 看" onClick="messageDeatil()">
                  </td>
                
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
        <tr class="td_title">
          <td width="3%" align="center"><input type="checkbox" name="checkbox" marked="fcc" onclick="eosCheckAll(document.queryForm,this)"></td>
          <td width="15%" align="center" nowrap id="dataEntity.me1" onClick="talentsort()">发送人</td>
          <td width="22%" align="center" nowrap id="dataEntity.me2" onClick="talentsort()">消息标题</td>
           <logic:equal  property="type" value="send">
          <td width="13%" align="center" nowrap id="dataEntity.me3" onClick="talentsort()">接收人</td>
            </logic:equal>
          <logic:notEqual  property="type" value="send">
          <logic:equal  property="type" value="rece">
             <td width="13%" align="center" nowrap id="dataEntity.me4" onClick="talentsort()">阅读标志</td>
          </logic:equal>
                 
          </logic:notEqual> 
           <td width="15%" align="center" nowrap id="dataEntity.me5" onClick="talentsort()">
           <logic:notEqual  property="type" value="send">
           接收时间
           </logic:notEqual>
           <logic:equal  property="type" value="send">
           发送时间
           </logic:equal>
           </td>
        </tr>
         <% int count=0; 
            String trClass="";
         %>
		 <logic:iterate id="ResultSet" property="list">
		          <%
			       	if(count%2==0)
			       	    trClass = "td2";
			       	else
			       	    trClass = "td1";
			       	    count++;
			       %>
		   <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="toView('<bean:write id="ResultSet" property="InnerNote/MSGID"/>')">
            <td align="center">
			<logic:present  id="ResultSet" property="InnerNote/MSGID" >
		         <html:checkbox styleId="msgid" name="list[@name='update']/InnerNote/MSGID" id="ResultSet" property="InnerNote/MSGID"  indexed="true"/>
		    </logic:present>
			</td>
            <td align="left" nowrap>
            <logic:equal id="ResultSet" property="InnerNote/ISREAD" value="0">
            	<span style="color:#000000;font-weight:bolder"><bean:write id="ResultSet" formatClass="username" formatType="userid" property="InnerNote/SENDACCOUNT"/></span>
            </logic:equal>
            <logic:equal id="ResultSet" property="InnerNote/ISREAD" value="1">
            	<bean:write id="ResultSet" property="InnerNote/SENDACCOUNT" formatClass="username" formatType="userid"/>
            </logic:equal>
            </td>
            <td align="left" nowrap >
             <logic:equal id="ResultSet" property="InnerNote/ISREAD" value="0">
                      <span style="color:#000000;font-weight:bolder"><bean:write id="ResultSet" property="InnerNote/MSGTITLE"  maxLength="25" maxLengthString="..." /></span>
             </logic:equal>
             <logic:equal id="ResultSet" property="InnerNote/ISREAD" value="1">
                       <bean:write id="ResultSet" property="InnerNote/MSGTITLE"  maxLength="15" maxLengthString="..." />
              </logic:equal>
            </td>
            <logic:equal  property="type" value="send">
              <td align="left" nowrap>
               <bean:write id="ResultSet" property="InnerNote/RECACCOUNT" maxLength="10" maxLengthString="..."/>
               </td>
           </logic:equal>
           <logic:notEqual  property="type" value="send">
               <logic:equal  property="type" value="rece">
                 <td align="left" nowrap>
                 <logic:equal id="ResultSet" property="InnerNote/ISREAD" value="0">
                      <span style="color:#000000;font-weight:bolder">未读</span>
                  </logic:equal>
                  <logic:equal id="ResultSet" property="InnerNote/ISREAD" value="1">
                             已读
                  </logic:equal>
                </td>
               </logic:equal>
            </logic:notEqual>  
            <td align="left" nowrap>
            <logic:equal id="ResultSet" property="InnerNote/ISREAD" value="0">
            <span style="color:#000000;font-weight:bolder"><bean:write id="ResultSet" property="InnerNote/SENDDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></span>
            </logic:equal>
            <logic:equal id="ResultSet" property="InnerNote/ISREAD" value="1">
            	<bean:write id="ResultSet" property="InnerNote/SENDDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </logic:equal>
      
            
            </td>
         
          </tr>
		 </logic:iterate>
      </table>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="td2">
        <tr>
          <td>
          
          
             <Script language="JavaScript">
             PageCond(queryForm);
             </Script>
          </td>
        </tr>
      </table></td>
  </tr>
</form></table>
</body>



<script  language="JavaScript">
function init(){
  <logic:present property="return/code">
<logic:equal property="return/code" value="-1">
alert("发送失败!");
</logic:equal>
</logic:present>
}

function chechedCount(form){
		var length =0;
	    var i=0;
	    var count =0;
		eles = form.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox"&&obj.getAttribute("marked")==null&&!obj.disabled){
				if(obj.checked){
				  count++;
			     }
			}
			i++;
		}
		return count;
	}

function query(){
    	var frm = document.queryForm;
    	if(checkForm(frm)==false) return;
		
    	//frm.elements["InnerNote/CONTENT[@criteria='like']"].value="";
    	//frm.elements["InnerNote/CONTENT[@criteria='like']"].value=frm.elements["TContext"].value;
    	//if(frm.elements["InnerNote/CONTENT[@criteria='like']"].value!="")
		//frm.elements["InnerNote/CONTENT[@criteria='like']"].value="%"+cTrim(frm.elements["InnerNote/CONTENT[@criteria='like']"].value,0)+"%";
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		frm.elements["PageCond/length"].value=10;
        frm.submit();    	
}
     function deleteRows(){
    	var frm =document.queryForm;
   		if(chechedCount(frm)<1){
    		alert("至少必须选择一行进行删除！");
    		return ;
    	}
    	
    	if(confirm("是否确定删除指定记录？")==false){
			return ;
		}    	 
    
    	frm.action="oa.prPersonOffice.deleteInnerNote.do";
    	frm.submit();
    }
    function addMessage(){
    	var frm = document.queryForm;
    	frm.action="oa.prPersonOffice.addInnerNotePage.do";
    	frm.submit();
    }
    function toView(arg){
			var frm = document.queryForm;
			frm.elements["InnerNote/SENDACCOUNT"].value="";
			frm.action = "oa.prPersonOffice.getNoteByID.do?InnerNote/MSGID="+arg;
			frm.submit();
	
	}
   function selectRead(){
       var frm =document.queryForm;
   		  if(chechedCount(frm)!=1){
    		alert("请选择一行进行查看！");
    		return ;
    	}
			
			frm.action = "oa.prPersonOffice.getNoteByID.do?InnerNote/MSGID="+getFirstSelectedValue("msgid");
			frm.submit();
	
	}
	
	function messageDeatil(){
	    var frm =document.queryForm;
   		if(chechedCount(frm)<1){
    		alert("至少必须选择一行记录！");
    		return ;
    	}
    	if(chechedCount(frm)>1){
    	  alert("只能选择一行记录！");
    		return ;
    	}
    	messigeId=getFirstSelectedValue("msgid");
    	toView(messigeId);
	}
</script>