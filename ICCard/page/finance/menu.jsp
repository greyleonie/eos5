<%@include file="/internet/common.jsp"%>
<%@page import="java.util.*,talent.core.*" %>
<%
  Date now = new Date();
  String timestr = TalentFunctions.formatUtilDate(now);
%>
<html>
<head>

<title>������ί��У��Ϣһ�廯ƽ̨</title>
</head>

<body bgcolor="#D6EEFF">
<table width="170"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/internet/image/left_menu_01.gif" width="170" height="32"></td>
  </tr>
  <tr>
    <td><img src="/internet/image/left_menu_02.gif" width="170" height="20"></td>
  </tr>
  <tr>
    <td background="/internet/image/left_menu_bg.gif">
	<table width="80%" height="300"  border="0" align="center" cellpadding="0" cellspacing="0" onClick="menu3(this)">
      
	 
      <tr>
        
        
		<td class="menu31">
		<script type="text/javascript">
       
         //function(id, pid, name, url, title, target, icon, iconOpen, open)
         
         eosMenuTree = new dTree('eosMenuTree');
		 
         eosMenuTree.add(0,-2,'�������','','','mainframe');
         
		 	eosMenuTree.add('Report_Detail','0','��ϸ����','','','mainframe');
		
               eosMenuTree.add('Report_Detail_Day','Report_Detail','�ս�����ϸ','ICCard.prFinance.prDayDetail.do?QueryBizLogsByIds/init=init','','mainframe');
		
               eosMenuTree.add('Report_Detail_Person','Report_Detail','���˽�����ϸ','ICCard.prFinance.prPersonDetail.do?QueryBizLogsByIds/userid=0&fromCardData0=&fromCardData1=&actstr=begin','','mainframe');
            
            eosMenuTree.add('Report_Square','0','���㱨��','','','mainframe');
		
               eosMenuTree.add('Report_Square_Day','Report_Square','�ս��׽���','ICCard.prFinance.prDaySettlementView.do?QueryDayBizLogCols/init=init&actstr=daysettlementview','','mainframe');
		
               eosMenuTree.add('Report_Square_Month','Report_Square','�½��׽���','ICCard.prFinance.prMonthSettlementView.do?QueryDayBizLogCols/init=init&actstr=monthsettlementview','','mainframe');
               
               eosMenuTree.add('Report_Square_Class','Report_Square','�༶����','ICCard.prFinance.prClassSettlementView.do?QueryClassBizLogCols/init=init','','mainframe');
		
         document.write(eosMenuTree);

     </script>
		</td>
        
      </tr>
	  
     
	  
      
      <tr>
      <a href="javascript:void(0)" onClick="return false">
        <td height="260" colspan="2" > </td>
      </a>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="/internet/image/left_menu_03.gif" width="170" height="25"></td>
  </tr>
</table>
</body>
</html>