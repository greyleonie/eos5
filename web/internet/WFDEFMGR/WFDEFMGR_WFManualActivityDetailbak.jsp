

<table class="add" align="center" border="0">

  <tr class="add_title" > 
     <td colspan="2">���˹����ϸ��Ϣ��</td>
  </tr>
  
  <tr class="add_head"> 
    	<td align="left" colspan="4">
  		���������ԡ� 
  	</td>
  </tr>
  
  <tr class="add_content">
      <td align="right" class="add_head" width="25%">
      	�ID
      </td>
      
      <td class="result_head" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityId"/>
      </td>
      
      <td align="right" class="add_head" width="25%">
      	�����
      </td>    
      
      <td class="result_head" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityName"/>
      </td>
  </tr>

  <tr class="add_content">
      <td align="right" class="add_head">
      	�ۺ�ģʽ
      </td>     
      
      <td class="result_head">
      	<bean:write property="WFProcessDefine/Activity/joinType"/>
      </td>
      
      <td align="right" class="add_head">
      	��֧?��?
      </td>
      
      <td class="result_head">
      	<bean:write property="WFProcessDefine/Activity/splitType"/>
      </td>
  </tr>

  <tr class="add_content">
      <td align="right" class="add_head">
      	���ȼ�
      </td> 
      
      <td class="result_head" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/priority"/>
      </td>
  </tr>

  <tr class="add_head"> 
    	<td align="left" colspan="4">
  		����չ���ԡ� 
  	</td>
  </tr>

  <tr class="add_content">
      <td align="right" class="add_head">
      	����URL
      </td> 
      
      <td class="result_head" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/urlInfo"/>
      </td>
  </tr>  

  <tr class="add_head">   
  	<td align="left" colspan="4">
  		�����������Ϣ�� 
  	</td>
  </tr>

  <tr class="add_content">
      <td align="right" class="add_head">
      	����������
      </td>
      
      <td class="result_head" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/organization"/>
      </td>
  </tr>    
      
  <tr class="add_content">
      <td align="right" class="add_head">
      	�������б�
      </td>   
      
      <td class="result_head" colspan="3">
      
      	    <table border="0" cellspacing="1" cellpadding="1" class="result" align="center" width="30%">

		      <tr class="result_head"> 
		        <td width="10%" height="16">����</td>
		        <td width="25%" height="16">����</td>
		        <td width="25%" height="16">ID</td>
		      </tr>
		      
		      <tr class="result_content">      
		        <td>��ɫ</td>
		        <td>ϵͳ����Ա</td> 
		        <td>1001</td>         
		      </tr>
		  
		      <tr class="result_content">      
		        <td>��ɫ</td>
		        <td>ϵͳ����Ա</td> 
		        <td>1001</td>         
		      </tr>
		  
		      <tr class="result_content">      
		        <td>��ɫ</td>
		        <td>ϵͳ����Ա</td> 
		        <td>1001</td>         
		      </tr>
		      
		      <tr class="result_content">      
		        <td>��ɫ</td>
		        <td>ϵͳ����Ա</td> 
		        <td>1001</td>         
		      </tr>

	</table> 

      </td>
     
  </tr>
 
  <tr class="add_head">   
  	<td align="left" colspan="4">��ʱ��������Ϣ�� </td>
  </tr>
    
  <tr class="add_content">
      <td align="right" class="add_head">ʱ������</td>     
      <td colspan="3" >3 �� 2 Сʱ 30 ����</td>
  </tr>  
  
  <tr class="add_content">
      <td align="right" class="add_head">���ѷ�ʽ</td>     
      <td >�����ʼ�</td>
      <td align="right" class="add_head">��ǰ����ʱ��</td>     
      <td >1 ��</td>
  </tr>
  
  <tr class="add_head">
  	<td align="left" colspan="4">
  		���������ԡ� 
  	</td>
  </tr>
  
  <tr class="add_content">
      <td align="right" class="add_head">
      	��������
      </td>     
      
      <td class="result_head">
      	<bean:write property="WFProcessDefine/Activity/rollbackType"/>
      </td>
      
      <td align="right" class="add_head">
      	���˶���
      </td> 
      
      <td class="result_head">
      	<bean:write property="WFProcessDefine/Activity/rollback-action"/>
      </td>
  </tr>      

</table>

<table width="100%" border="0" cellspacing="1" cellpadding="1" class="query" align="center">
  <tr class="add_bottom">
    <td colspan="3" align="center" width="75%">
    </td>
    
    <td colspan="1" align="center">
        <a href="WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>">
          <img border="0" src="/internet/WFCOMMON/images/button/xghddy.gif"  width="90" height="19">
        </a> 
    </td>
   </tr>  
</table> 

