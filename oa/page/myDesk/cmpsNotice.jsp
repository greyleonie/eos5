
<%@include file="/internet/common.jsp"%>
<%@page import="java.util.ArrayList,tools.util.WorkFlowData" %>
<style type="text/css">
<!--

a:link {
    COLOR: #000000
}
a:visited {
    COLOR: #880000 
}

.td_line {
	font-size: 12px;
	line-height: 20px;
	color: #000000;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #D0D0D0;
	border-right-color: #D0D0D0;
	border-bottom-color: #D0D0D0;
	border-left-color: #D0D0D0;
}


-->
</style>
<link href="images/style.css" rel="stylesheet" type="text/css">
<%int i=0;

String newsRecords="0";
String cmpsNoticeRecords="0";
String meetNoticeRecords="0";
String arrangeRecords="0";
String userId=base.util.TalentContext.getValue(pageContext,null,"SessionEntity/operatorID");
String username=base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userID");
tools.util.DeskInfo.queryDeskInfo(request,userId,username,"cmpsNotice");
cmpsNoticeRecords=(String)request.getAttribute("cmpsNoticeRecords");
ArrayList cmpsNoticeList=(ArrayList)request.getAttribute("cmpsNoticeList");
int countCmpsNotice=0;
if(cmpsNoticeList!=null){
countCmpsNotice=cmpsNoticeList.size();
}
 %>
<body>
<table width="489" align="center"  bgcolor="white">
	<tr>
		<td align="center" valign="top"><table width="100%"  border="0" cellspacing="10" cellpadding="0">
        <tr>
          <td width="50%" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table8">
            <tr>
              <td width="29"><img src="/internet/images/index_pic_tc01.gif" width="29" height="30" alt=""></td>
              <td background="/internet/images/index_pic_tcbg.gif" class="cn6"><img src="/internet/images/spacer.gif" width="15" height="8">УԺ֪ͨ</td>
              <td width="80" align="right" background="/internet/images/index_pic_tcbg.gif" class="cn8"><a href="javascript:toWorkFlowMoreLink('DX_OASYS_INFO','DX_OASYS_INFO_NOTICE','oa.prNews.noticeList.do?NewsOrg/Columns/criteria/value=УԺ֪ͨ')"><img src="images/index_button_more-24.gif" alt="" width="36" height="11" hspace="10" border="0"></a>
                </td>
              <td width="2" align="right"><img src="/internet/images/index_pic_tc02.gif" width="2" height="30" alt=""></td>
            </tr>
          </table>
            <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table7">
              <tr>
                <td align="center" valign="top">
                <%i=0; 
						                
						              for(int k=0;k<10;k++){
						                  tools.util.Notice notice =(tools.util.Notice)cmpsNoticeList.get(k);
						                %>
						               
						                 <%i++; %>
                
                
                	<table width="95%"  border="0" cellspacing="0" cellpadding="0">
	                    <tr>
	                      <td height="24" bgcolor="white" ><img src="/internet/images/index_meun02.gif" alt="" width="3" height="3" hspace="8" align="absmiddle"><a href="javascript:toWorkFlowMoreLink('DX_OASYS_INFO','DX_OASYS_INFO_NOTICE','oa.prNews.noticeView.do?pageID=2&fid=<%=notice.getNoticeID()%>')"><%=notice.getTitle()%>
						                    &nbsp;(<%=notice.getCteateTime()%>)</a></td>
	                    </tr>
                  	</table>
                  	<%}%>
                  	
                </td>
              </tr>
            </table></td>
	</tr>
</table>
</body>


<script>
function toLink(pid,leftID,subID,subaction,flag){

//window.parent.leftFrame.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID;
window.location.href  = "common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;

}

function toopenwin(action){
    //var action = "";
	var width = 600;
	var height = 500;
	var xposition = (screen.width-width)/2;
	var yposition = (screen.height-height-25)/2;
	window.open(action,'openwin','height='+height+',width='+width+',left='+ xposition +',top='+ yposition +',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no');
	
}


  
function toMoreLink(pid,leftID,subID,subaction,flag){

var tmp='<bean:write property="trs" />';
	if(tmp=='1'){
		var h="common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;
		toopenwin(h);
	}else{
window.parent.leftFrame.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID;
window.location.href  = "common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;
	}

}

function toWorkFlowMoreLink(pid,leftID,subaction){
	var tmp='<bean:write property="trs" />';
	if(tmp=='1'){
		toopenwin("http://app.gzswdx.gov.cn/"+subaction);
	}else{
	window.parent.leftFrame.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID+"&pageID=2";
	window.location.href  = subaction;}
}

function toFlowLink(flow,type){
var pid,leftID,subID,subaction,flag;
if(flow=='SendArchive'){
	pid = 'DX_OASYS_ARCHIVE';
	leftID = 'DX_OASYS_ARCHIVE_SENDARCHIVE';
	if(type=='db'){
	  subID = 'DX_OASYS_ARCHIVE_SENDARCHIVE_NOW';
	  subaction = 'oa.prSendArchive.sendList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_ARCHIVE_SENDARCHIVE_PASS';
	  subaction = 'oa.prSendArchive.sendList.do?temptype=2';
	  flag=2;
	}
}else if(flow=='ReceiveArchive'){
	pid = 'DX_OASYS_ARCHIVE';
	leftID = 'DX_OASYS_ARCHIVE_RECEIVEARCHIVE';
	if(type=='db'){
	  subID = 'DX_OASYS_ARCHIVE_RECEIVEARCHIVE_NOW';
	  subaction = 'oa.prReceiveArchive.receiveList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_ARCHIVE_RECEIVEARCHIVE_PASS';
	  subaction = 'oa.prReceiveArchive.receiveList.do?temptype=2';
	  flag=2;
	}

}else if(flow=='COMM_PURCHASE'){
	pid = 'DX_OASYS_THINGSMANAGE';
	leftID = 'DX_OASYS_THINGSMANAGE_PURCHASE';
	if(type=='db'){
	  subID = 'DX_OASYS_THINGSMANAGE_PURCHASE_DB';
	  subaction = 'oa.prThingsManage.purchaseList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_THINGSMANAGE_PURCHASE_YB';
	  subaction = 'oa.prThingsManage.purchaseList.do?temptype=2';
	  flag=2;
	}
}else if(flow=='COMM_STOREOUT'){
	pid = 'DX_OASYS_THINGSMANAGE';
	leftID = 'DX_OASYS_THINGSMANAGE_STOREOUT';
	if(type=='db'){
	  subID = 'DX_OASYS_THINGSMANAGE_STOREOUT_DB';
	  subaction = 'oa.prThingsManage.storeOutList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_THINGSMANAGE_STOREOUT_YB';
	  subaction = 'oa.prThingsManage.storeOutList.do?temptype=2';
	  flag=2;
	}
}else if(flow=='CAPT_PURCHASE'){
	pid = 'DX_OASYS_ASSETSMANAGE';
	leftID = 'DX_OASYS_ASSETSMANAGE_PURCHASE';
	if(type=='db'){
	  subID = 'DX_OASYS_ASSETSMANAGE_PURCHASE_DB';
	  subaction = 'oa.prAssetsManage.purchaseList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_ASSETSMANAGE_PURCHASE_YB';
	  subaction = 'oa.prAssetsManage.purchaseList.do?temptype=2';
	  flag=2;
	}
}else if(flow=='CAPT_WRITEOFF'){
	pid = 'DX_OASYS_ASSETSMANAGE';
	leftID = 'DX_OASYS_ASSETSMANAGE_WRITEOFF';
	if(type=='db'){
	  subID = 'DX_OASYS_ASSETSMANAGE_WRITEOFF_DB';
	  subaction = 'oa.prAssetsManage.writeOffList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_ASSETSMANAGE_WRITEOFF_YB';
	  subaction = 'oa.prAssetsManage.writeOffList.do?temptype=2';
	  flag=2;
	}
}else if(flow=='UseCarRequest'){
	pid = 'DX_OASYS_CARD';
	leftID = 'DX_OASYS_CARD_USE';
	if(type=='db'){
	  subID = 'DX_OASYS_CARD_USE_DB';
	  subaction = 'oa.prCarManage.useCarList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_CARD_USE_YB';
	  subaction = 'oa.prCarManage.useCarList.do?temptype=2';
	  flag=2;
	}
}else if(flow=='CostClaim'){
	pid = 'DX_OASYS_FINANCE';
	leftID = 'DX_OASYS_FINANCE_COST';
	if(type=='db'){
	  subID = 'DX_OASYS_FINANCE_COST_DB';
	  subaction = 'oa.prFinance.costClaimList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_FINANCE_COST_YB';
	  subaction = 'oa.prFinance.costClaimList.do?temptype=2';
	  flag=2;
	}
}else if(flow=='TravelCostClaim'){
	pid = 'DX_OASYS_FINANCE';
	leftID = 'DX_OASYS_FINANCE_TRAVEL';
	if(type=='db'){
	  subID = 'DX_OASYS_FINANCE_TRAVEL_DB';
	  subaction = 'oa.prFinance.travelCostClaimList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_FINANCE_TRAVEL_YB';
	  subaction = 'oa.prFinance.travelCostClaimList.do?temptype=2';
	  flag=2;
	}
}else if(flow=='BorrowRequest'){
	pid = 'DX_OASYS_FINANCE';
	leftID = 'DX_OASYS_FINANCE_BORROW';
	if(type=='db'){
	  subID = 'DX_OASYS_FINANCE_BORROW_DB';
	  subaction = 'oa.prFinance.borrowRequestList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_FINANCE_BORROW_YB';
	  subaction = 'oa.prFinance.borrowRequestList.do?temptype=2';
	  flag=2;
	}
}else if(flow=='CheckRequest'){
	pid = 'DX_OASYS_FINANCE';
	leftID = 'DX_OASYS_FINANCE_CHECK';
	if(type=='db'){
	  subID = 'DX_OASYS_FINANCE_CHECK_DB';
	  subaction = 'oa.prFinance.checkRequestList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_FINANCE_CHECK_YB';
	  subaction = 'oa.prFinance.checkRequestList.do?temptype=2';
	  flag=2;
	}
}else if(flow=='MR_APPLY'){
	pid = 'DX_OASYS_MR';
	leftID = 'DX_OASYS_MR_APPLY';
	if(type=='db'){
	  subID = 'DX_OASYS_MR_APPLY_DB';
	  subaction = 'oa.prMeetingManage.mrApplyList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OASYS_MR_APPLY_YB';
	  subaction = 'oa.prMeetingManage.mrApplyList.do?temptype=2';
	  flag=2;
	}
}else if(flow=='OmmApply'){
	pid = 'DX_OMMSYS_OMMMGR';
	leftID = 'DX_OMMSYS_OMMMGR_APPLY';
	if(type=='db'){
	  subID = 'DX_OMMSYS_OMMMGR_APPLY_WAITING';
	  subaction = 'OMM.prRequest.prRequestList.do?temptype=1';
	  flag=1;
	}else if(type=='yb'){
	  subID = 'DX_OMMSYS_OMMMGR_APPLY_PROCESSED';
	  subaction = 'OMM.prRequest.prRequestList.do?temptype=2';
	  flag=2;
	}
}
 
var tmp='<bean:write property="trs" />';

	if(tmp==1){
		//var h="common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;
		//var h= "common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;
		toopenwin('http://app.gzswdx.gov.cn/' + subaction);
	}else{
window.parent.leftFrame.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID;
window.location.href  = "common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;
	}

 // window.parent.leftFrame.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID;
 // window.location.href  = "common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;

}

</script>