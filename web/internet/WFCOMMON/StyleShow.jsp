<!-- saved from url=(0022)http://internet.e-mail -->
<%@include file="/internet/hciHead.jsp"%>



<!--tab��ʾ,tabFrame-->
<table width="80%" height="200"><tr><td width="100%">
  <eos:tabframe id="test1" width="100%" height="100%" frameborder="1" scrolling="auto">
            <eos:tabframetitle url="default.pr_automata.forward.do?nextPage=/internet/WFCOMMON/Tab1.jsp" title="��ǩA" selected="true"/>
            <eos:tabframetitle url="default.pr_automata.forward.do?nextPage=/internet/WFCOMMON/Tab2.jsp" title="��ǩB" />
  </eos:tabframe>
</td></tr></table>




<!--tab��ʾ,tab-->
<table><tr><td>
    <eos:tab id="test2"  width="100%" height="95%">
        <eos:tabtitle>
            <eos:titleitem >��ǩA</eos:titleitem>
            <eos:titleitem >��ǩB</eos:titleitem>
        </eos:tabtitle>
        <eos:tabcontent>
	    <eos:contentitem>
		aaaa
		<br>
		bbbb
		<br>
		cccc	    
	    </eos:contentitem>
            <eos:contentitem>
            	ddddd
		<br>
		xxxx
		<br>
		zzz	    
            </eos:contentitem>
        </eos:tabcontent>
    </eos:tab>
</td></tr></table>



    <!--��ѯ������ʾ-->
<table class="result" border="0" width="60%" align="center">
  <tr class="result_content_"> 
    <td align="left" colspan="2"><b>����ѯ�û���</b></td>
    <td colspan="2">&nbsp; </td>
  </tr>
  <tr class="result_content_" align="left"> 
    <td>�û���ʵ����:&nbsp; 
      
    </td>
    <td>&nbsp;<input type="text" name="EOSOperator/operatorName" ></td>
    <td> �û���¼��:&nbsp; </td>
    <td>
      <input type="text" name="EOSOperator/userID" >
    </td>
  </tr>
  <tr class="result_content_" align="left"> 
    <td>�û�������ɫ: 
    </td>
    <td>&nbsp;<select name="EOSOperatorRole/roleID" size="1" style="width:150px" class="myselect">
        <option value="0" selected>--��ѡ������--&nbsp;&nbsp;&nbsp;</option>
        <option value="9999">û�з����ɫ 
        <option value="eosadmin">ϵͳ����Ա</option>
        <option value="bizadmin">ҵ�����Ա</option>
        <option value="Guest">�α�</option>
        <option value="petstore">petstore example</option>
      </select></td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr class="result_content_"> 
    <td align="center" colspan="4"><a href="#1" onclick="javascript:querysubmit()"> 
      <img src="/internet/theme/style0/query.gif" border="0"/>&nbsp;&nbsp;&nbsp; 
      </a> <a href="#2" onclick="javascript:document.queryFrm.reset();"> <img src="/internet/theme/style0/reset.gif" border="0"/> 
      </a> </td>
  </tr>
</table>




    <!--�б���Ϣ��ʾ-->	
    <table border="0" cellspacing="1" cellpadding="1" class="result" align="center">
      <tr class="result_title">
		      <td colspan="5" width="100%"> 
		        <div align="left">��<b>XXXX�б�</b>��</div>
		      </td>
      </tr>
      <tr class="result_head"> 
        <td width="10%" height="16">ѡ��</td>
        <td width="25%" height="16">���</td>
        <td width="25%" height="16">����</td>
        <td width="10%" height="16">��ʾ˳��</td>
      </tr>
      
      <tr class="result_content">      
        <td><input type="checkbox"/></td>
        <td>������</td> 
        <td>������</td>         
        <td>������</td>  
      </tr>
  
      <tr class="result_content_">      
        <td><input type="checkbox"/></td>
        <td>������</td> 
        <td>������</td>         
        <td>������</td>  
      </tr>
  
      <tr class="result_content">      
        <td><input type="checkbox"/></td>
        <td>������</td> 
        <td>������</td>         
        <td>?����?</td>  
      </tr>
      
      <tr class="result_content_">      
        <td><input type="checkbox"/></td>
        <td>������</td> 
        <td>������</td>         
        <td>������</td>  
      </tr>
    </table>    



    <table border="0" cellspacing="0" cellpadding="1" class="query" align="center">           
       <tr>
       <td class="query_bottom"> 
     		<a href="#2" onclick="javascript:addSubMenu()">
			<img src="/internet/theme/style0/add.gif" border="0" />
		</a>
		<a href="#4" onclick="javascript:updateMenu();">
			<img src="/internet/theme/style0/modify.gif" border="0" />
		</a>
		<a href="#5" onclick="javascript:deleteMenus();">
			<img src="/internet/theme/style0/delete.gif" border="0" />
		</a>
		

       </td>            
       
    <td class="query_bottom" align="right"> <a href="javascript:previousPage();"><img src="/internet/theme/style0/prevpage.gif"  border="0" align="absbottom" class="null" width="48" height="19" ></a> 
      <a href="javascript:nextPage();"><img src="/internet/theme/style0/nextpage.gif"  border="0" align="absbottom" class="null" width="48" height="19" ></a> 
      ��123ҳ </td>
      </tr>
    </table>   
    
    
    
    <!--��ϸ��Ϣ��ʾ-->
    
<table class="add" align="center" border="0">
  <tr class="add_title" > 
       
    <td colspan="2">���˵���ϸ��Ϣ��</td>
     </tr>
    
     <tr class="add_content">
       
    <td align="right" class="add_head" width="20%">�˵���ţ�</td>
       <td>
       ?˵���?	
       </td>
     </tr>
     <tr class="add_content">
      
    <td align="right" class="add_head" width="20%">�˵����⣺</td>
      <td> 
        �˵�����
      </td>
    </tr>
    <tr class="add_content">
      
    <td align="right" class="add_head" width="20%">�Ƿ�Ҷ�ӣ�</td>
      <td> 
       �Ƿ�Ҷ��
      </td>
    </tr>    
    <tr class="add_content">
      
    <td align="right" class="add_head" width="20%">�˵��Զ������ڵİ���</td>
      <td> 
        �˵��Զ�����?ڵİ?
      </td>
    </tr>
    <tr class="add_content">
     
    <td align="right" class="add_head" width="20%">�˵���Ӧ���Զ�����</td>
      
    <td>�˵���Ӧ���Զ��� &nbsp; </td>
    </tr>
    <tr class="add_content">
      
    <td align="right" class="add_head" width="20%">��ʾ˳��(����Ϊ����)��</td>
      <td>
       ��ʾ˳��
      </td>
    </tr>
    <tr class="add_bottom">
      <td colspan="2" align="center">

  	<a href="javascript:submit1()"><html:image src="/confirm.gif" border="0"/></a> 
        <a href="javascript:document.addmenu.reset()"><html:image src="/reset.gif" border="0"/></a> 
  

        	<a href="javascript:window.navigate('about:blank')"> 	<html:image src="/return.gif" border="0" />
		</a>   	   	

      </td>
    </tr>
  </table>


    <!--���Ӽ�¼ -->
	<table class="add" align="center" border="0">
     <tr class="add_title" > 
       <td colspan="2">�������Ӳ˵���</td>
     </tr>
    
     <tr class="add_content">
       <td align="right" class="add_head">�˵���ţ�</td>
       <td>
       	<html:text property="EOSMenu/menuID" maxlength="40" />
       </td>
     </tr>
     <tr class="add_content">
      <td align="right" class="add_head">�˵����⣺</td>
      <td> 
        <html:text property="EOSMenu/menuLabel" maxlength="40" />
      </td>
    </tr>
    <tr class="add_content">
      <td align="right" class="add_head">�Ƿ�Ҷ�ӣ�</td>
      <td> 
        <html:select size="1"  property="EOSMenu/isLeaf" onchange="javascript:isLeafChange(this.value);">
    	<html:option value="Y">Ҷ�Ӳ˵�(Ҷ�Ӳ˵����ܲ���Ϊ��)</html:option>
    	<logic:notEqual property="EOSMenu/parentLevel" value="2">   
    		<html:option value="N">��Ҷ�Ӳ˵�(��Ҷ�Ӳ˵�������Ч)</html:option> 
    	</logic:notEqual>  
 
        </html:select>
      </td>
    </tr>    
    <tr class="add_content">
      <td align="right" class="add_head">�˵��Զ������ڵİ���</td>
      <td> 
        <html:select size="1"  property="EOSMenu/pack">
	    <option selected/>
	  <logic:iterate id="rs" property="list">
	  	<html:option id="rs" property="EOSFunctionUnit/unitID" labelProperty="EOSFunctionUnit/unitName"/>
	  </logic:iterate>
        </html:select>
      </td>
    </tr>
    <tr class="add_content">
     <td align="right" class="add_head">�˵���Ӧ���Զ�����</td>
      <td>
        <textarea  name="EOSMenu/menuActionName" cols="40" rows="3" onchange="javascript:clearFunctionID();"><bean:write property="EOSMenu/menuAction"/></textarea>
        <input type="button" name="btnSelectFunc" value="ѡ��" onclick="javascript:selectFunction();">&nbsp;
      </td>
    </tr>
    <tr class="add_content">
      <td align="right" class="add_head">��ʾ˳��(����Ϊ����)��</td>
      <td>
        <html:text name="EOSMenu/displayOrder" property="EOSMenu/displayOrder" maxlength="5" />
      </td>
    </tr>
    <tr class="add_bottom">
      <td colspan="2" align="center">

  	<a href="javascript:submit1()"><html:image src="/confirm.gif" border="0"/></a> 
        <a href="javascript:document.addmenu.reset()"><html:image src="/reset.gif" border="0"/></a> 
  

        	<a href="javascript:window.navigate('about:blank')"> 	<html:image src="/return.gif" border="0" />
		</a>   	   	

      </td>
    </tr>
  </table>

��������������

    

     
  
<%@include file="/internet/hciTail.jsp%>
