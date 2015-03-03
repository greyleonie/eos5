
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
<%int i=0;

//String newsRecords="0";
String cmpsNoticeRecords="0";
String meetNoticeRecords="0";
String arrangeRecords="0";
String userId=base.util.TalentContext.getValue(pageContext,null,"SessionEntity/operatorID");
String username=base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userID");
//System.out.println("*****userId:"+userId);
//out.println(username);
tools.util.DeskInfo.queryDeskInfo(request,userId,username);

//newsRecords=(String)request.getAttribute("newsRecords");
cmpsNoticeRecords=(String)request.getAttribute("cmpsNoticeRecords");
meetNoticeRecords=(String)request.getAttribute("meetNoticeRecords");
arrangeRecords=(String)request.getAttribute("arrangeRecords");

//ArrayList newsList=(ArrayList)request.getAttribute("newsList");
ArrayList cmpsNoticeList=(ArrayList)request.getAttribute("cmpsNoticeList");
ArrayList meetNoticeList=(ArrayList)request.getAttribute("meetNoticeList");
ArrayList arrangeList=(ArrayList)request.getAttribute("arrangeList");

ArrayList dbWorkFlowList = (ArrayList)request.getAttribute("dbWorkFlowList");
String dbWorkFlowRecords = "0";
dbWorkFlowRecords=(String)request.getAttribute("dbWorkFlowRecords");
if(dbWorkFlowRecords==null) dbWorkFlowRecords= "0";
ArrayList dpmtNoticeList = (ArrayList)request.getAttribute("dpmtNoticeList");
String dpmtNoticeRecords = "0";
dpmtNoticeRecords=(String)request.getAttribute("dpmtNoticeRecords");
if(dpmtNoticeRecords==null) dpmtNoticeRecords= "0";

int countNews=0;
int countCmpsNotice=0;
int countMeetNotice=0;
int countArrange=0;
int countDb = 0;
int countDpmtNotice = 0;

//if(newsList!=null){
// countNews=newsList.size();
//}
if(cmpsNoticeList!=null){
countCmpsNotice=cmpsNoticeList.size();
}
if(meetNoticeList!=null){
countMeetNotice=meetNoticeList.size();
}
if(arrangeList!=null){
countArrange=arrangeList.size();
}
if(dbWorkFlowList!=null){
countDb=dbWorkFlowList.size();
}
if(dpmtNoticeList!=null){
countDpmtNotice=dpmtNoticeList.size();
}
 %>
<body>
<form>

<table width="508" align="center" >
	<tr>
		<td class="text" align="center" width="344"> 
			<table cellSpacing="0" cellPadding="0" width="807" align="center" border="0">
				<tbody>
					<tr vAlign="top">
						<td width="400" height="279" align="center" rowspan="2" >
							<table cellspacing="0" cellpadding="0" width="100%" border="0">
						        <tbody>
						          <tr>
						            <td width="48%">
						            <table height="27" cellspacing="0" cellpadding="0" width="100%" border="0">
						                <tbody>
						                  <tr>
						                    <td width="34"><img src="/internet/images/fir.gif" width="34" height="27"></td>
						                    <td class="text_red" width="108" bgcolor="#ebebeb" title='当前有<%=cmpsNoticeRecords%>条校院通知'>校院通知&nbsp;(<%=cmpsNoticeRecords%>)</td>
						                    <td background="/internet/images/left_bg.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
						                        <tr>
						                          <td width="40%"><img src="/internet/images/se.gif" width="43" height="27"></td>
						                          <td width="60%" align="right" class="text">【<a href="javascript:toWorkFlowMoreLink('DX_OASYS_INFO','DX_OASYS_INFO_NOTICE','oa.prNews.noticeList.do?NewsOrg/Columns/criteria/value=校院通知')">更多</a>】&nbsp; </td>
						                        </tr>
						                    </table></td>
						                  </tr>
						                </tbody>
						            </table></td>
						          </tr>
						          <tr>
						            <td height="5"></td>
						          </tr>
						          <tr>
						            <td><table width="99%" height="100" border="0" cellpadding="0" cellspacing="0">
						                <tbody>
						                <%i=0; 
						                
						              for(int k=0;k<countCmpsNotice;k++){
						                  tools.util.Notice notice =(tools.util.Notice)cmpsNoticeList.get(k);
						                %>
						               
						                 <%i++; %>
						                  <tr>
						                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/internet/images/img.gif" width="11" height="11">
						                    <a href="javascript:toWorkFlowMoreLink('DX_OASYS_INFO','DX_OASYS_INFO_NOTICE','oa.prNews.noticeView.do?pageID=2&fid=<%=notice.getNoticeID()%>')"><%=notice.getTitle()%>
						                    &nbsp;(<%=notice.getCteateTime()%>)</a>
						                    </td>
						                  </tr>
						               
						                <%}//end innerNotice
						                if(i<7){
						                for(int j=5-i;j>0;j--){%>
						                  <tr>
						                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/internet/images/img.gif" width="11" height="11"></td>
						                  </tr>
						                <%}}%>
						                </tbody>
						            </table></td>
						          </tr>
						        </tbody>
						      </table>
						</td>
						
						
			<td width="10" height="125"></td>
						<td align="middle" width="413" height="125">
						<table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td width="48%"><table height="27" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                  <tr>
                    <td width="34"><img src="/internet/images/fir.gif" width="34" height="27"></td>
                    <td class="text_red" width="108" bgcolor="#ebebeb" title='当前有<%=dpmtNoticeRecords%>条部门公告'>部门公告&nbsp;(<%=dpmtNoticeRecords%>)</td>
                    <td background="/internet/images/left_bg.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="40%"><img src="/internet/images/se.gif" width="43" height="27"></td>
                          <td width="60%" align="right" class="text">【<a href="javascript:toWorkFlowMoreLink('DX_OASYS_INFO','DX_OASYS_INFO_DEP','oa.prNews.noticeList.do?NewsOrg/Columns/criteria/value=部门公告')">更多</a>】&nbsp; </td>
                        </tr>
                    </table></td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td><table width="99%" height="100" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                <%i=0; 
                
              for(int k=0;k<countDpmtNotice;k++){
                  tools.util.Notice notice =(tools.util.Notice)dpmtNoticeList.get(k);
                %>
               
                 <%i++; %>
                  <tr>
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/internet/images/img.gif" width="11" height="11">
                    <a href="javascript:toWorkFlowMoreLink('DX_OASYS_INFO','DX_OASYS_INFO_DEP','oa.prNews.noticeView.do?pageID=2&fid=<%=notice.getNoticeID()%>')"><%=notice.getTitle()%>
                    &nbsp;(<%=notice.getCteateTime()%>)</a>
                    </td>
                  </tr>
               
                <%}//end innerNotice
                if(i<7){
                for(int j=5-i;j>0;j--){%>
                  <tr>
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/internet/images/img.gif" width="11" height="11"></td>
                  </tr>
                <%}}%>
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table>
						</td>
					</tr>
					<tr>
					
					
			<td width="10" height="139"></td>
						<td>
						<table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td width="48%"><table height="27" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                  <tr>
                    <td width="34"><img src="/internet/images/fir.gif" width="34" height="27"></td>
                    <td class="text_red" width="108" bgcolor="#ebebeb" title='当前有<%=meetNoticeRecords%>条会议公告'>会议公告&nbsp;(<%=meetNoticeRecords%>)</td>
                    <td background="/internet/images/left_bg.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="40%"><img src="/internet/images/se.gif" width="43" height="27"></td>
                          <td width="60%" align="right" class="text">【<a href="javascript:toWorkFlowMoreLink('DX_OASYS_INFO','DX_OASYS_INFO_MEETING','oa.prNews.noticeList.do?NewsOrg/Columns/criteria/value=会议公告')">更多</a>】&nbsp; </td>
                        </tr>
                    </table></td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td><table width="99%" height="100" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                <%i=0; 
                
              for(int k=0;k<countMeetNotice;k++){
                  tools.util.Notice notice =(tools.util.Notice)meetNoticeList.get(k);
                %>
               
                 <%i++; %>
                  <tr>
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/internet/images/img.gif" width="11" height="11">
                    <a href="javascript:toWorkFlowMoreLink('DX_OASYS_INFO','DX_OASYS_INFO_MEETING','oa.prNews.noticeView.do?pageID=2&fid=<%=notice.getNoticeID()%>')"><%=notice.getTitle()%>
                    &nbsp;(<%=notice.getCteateTime()%>)</a>
                    </td>
                  </tr>
               
                <%}//end innerNotice
                if(i<7){
                for(int j=5-i;j>0;j--){%>
                  <tr>
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/internet/images/img.gif" width="11" height="11"></td>
                  </tr>
                <%}}%>
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table>
						</td>
					</tr>
					<tr>
						<td valign="top">
						<table cellspacing="0" cellpadding="0" width="100%" border="0" style="margin-top: 5px;" >
        <tbody>
          <tr>
            <td width="48%"><table height="27" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                  <tr>
                    <td width="34"><img src="/internet/images/fir.gif" width="34" height="27"></td>
                    <td class="text_red" width="90" bgcolor="#ebebeb" title='当前有<%=dbWorkFlowRecords %>条待办事宜'>待办事宜&nbsp;(<%=dbWorkFlowRecords %>)</td>
                    <td background="/internet/images/left_bg.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="40%"><img src="/internet/images/se.gif" width="43" height="27"></td>
                          <td width="60%" align="right" class="text">【<a href="javascript:toWorkFlowMoreLink('DX_OASYS_DOWORK','DX_OASYS_DOWORK_DB','oa.prDoWork.workFlowAll.do?temptype=1')">更多</a>】&nbsp; </td>
                        </tr>
                    </table></td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td><table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                <%i=0; %>
                <%for(int k=0;k<countDb;k++){ 
                WorkFlowData dbWorkFlowData = (WorkFlowData)dbWorkFlowList.get(k);
                String title = dbWorkFlowData.getTitle();
                 if(title.length()>15) title = title.substring(0,15) + "...";
                %>
                 <%i++; %>
                  <tr>
                    <!--<td width="48%" height="19" class="td_line"><img hspace="8" src="/internet/images/img.gif" width="11" height="11">
                    <a href="javascript:toFlowLink('<bean:write id="resultset" property="DbWorkFlow/type"/>','db')"><bean:write id="resultset" property="DbWorkFlow/title"/>
                    &nbsp;(<bean:write id="resultset" property="DbWorkFlow/flowDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>)</a>
                    </td>-->
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/internet/images/img.gif" width="11" height="11">
                    <a href="javascript:toFlowLink('<%=dbWorkFlowData.getTypeFlag() %>',<%=dbWorkFlowData.getChannelID() %>,<%=dbWorkFlowData.getFlowID() %>,'<%=dbWorkFlowData.getType() %>','db')"><%=title %>
                    &nbsp;(<%=dbWorkFlowData.getFlowDate() %>)</a>
                    <!--
                    <a href="javascript:toWorkFlowMoreLink('DX_OMMSYS_OMMMGR','DX_OMMSYS_OMMMGR_APPLY','OMM.prRequest.prRequestList.do?temptype=1')"><%=title %>
                    &nbsp;(<%=dbWorkFlowData.getFlowDate() %>)</a>-->
                    </td>
                  </tr>
                <%} %>
                <%if(i<7){
                for(int j=5-i;j>0;j--){%>
                  <tr>
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/internet/images/img.gif" width="11" height="11"></td>
                  </tr>
                <%}}%>
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table>
						</td>
						
						
			<td width="10" height="139"></td>
						
						<td>
						<table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td width="48%"><table height="27" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                  <tr>
                    <td width="34"><img src="/internet/images/fir.gif" width="34" height="27"></td>
                    <td class="text_red" width="108" bgcolor="#ebebeb" title='当前有<%=arrangeRecords%>条工作安排' onclick="toopenwindow()">工作安排&nbsp;(<%=arrangeRecords%>)</td>
                    <td background="/internet/images/left_bg.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="40%"><img src="/internet/images/se.gif" width="43" height="27"></td>
                          <td width="60%" align="right" class="text">【<a href="javascript:toMoreLink('DX_OASYS_AFFAIR','DX_OASYS_AFFAIR_WORKARRANGE','DX_OASYS_AFFAIR_WORKARRANGE_ACCEPT','oa.prAffair.acceptArrangeList.do',1)">更多</a>】&nbsp; </td>
                        </tr>
                    </table></td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td><table width="100%" height="100" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                <%i=0; 
				for(int k=0;k<countArrange;k++){
					tools.util.Arrange arrange=(tools.util.Arrange)arrangeList.get(k);

				%>
                <%i++; %>
                  <tr>
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/internet/images/img.gif" width="11" height="11">
                    <a href="javascript:toopenwin('oa.prAffair.acceptArrangeView.do?fid=<%=arrange.getArrangeId()%>&flag=desk')"><%=arrange.getTaskSum()%>
                    &nbsp;(<%=arrange.getCalendar()%>)</a>
                    </td>
                  </tr>               
                <%}//end arrange
				
				if(i<7){
                for(int j=5-i;j>0;j--){%>
                  <tr>
                    <td width="48%" height="19" class="td_line"><img hspace="8" src="/internet/images/img.gif" width="11" height="11"></td>
                  </tr>
                <%}}%>
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table>
						</td>
					</tr>
				</tbody>
			</table>
		<td>
	</tr>
</table>
</form>
<!--漂浮代码使用层  开始-->
<div id="codefans_net" style="position:absolute">
<!--<a href="oa.prNews.noticeView.do?pageID=2&fid=1030">
<img src="/internet/ShareImage/37665164.gif" border="0">
</a>-->
</div>
<!--漂浮代码使用层  结束-->
</body>


<script>
		function toopenwindow(){
		 	var d = new Date(); 		 	
			var now=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
			window.open("http://app.gzswdx.gov.cn/internet/teachWorkManage.prNetCenter.centerTaskList.do?input/degree=0&input/BeginDate="+now+"&input/EndDate="+now);
		}
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
		window.open(h);
	}else{
window.parent.leftFrame.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID;
window.location.href  = "common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;
	}

}

function toWorkFlowMoreLink(pid,leftID,subaction){
	var tmp='<bean:write property="trs" />';
	if(tmp=='1'){
		window.open("http://app.gzswdx.gov.cn/"+subaction);
	}else{
	window.parent.leftFrame.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID+"&pageID=2";
	window.location.href  = subaction;}
}


function toFlowLink(typeFlag,channelID,id,flow,type){
var pid,leftID,subID,subaction,flag,ctype;
if(flow=='SendArchive'){
	ctype=1;
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
	ctype=1;
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
	ctype=1;
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
	ctype=1;
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
	ctype=1;
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
	ctype=1;
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
	ctype=1;
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
	ctype=1;
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
	ctype=1;
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
	ctype=1;
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
	ctype=1;
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
	ctype=1;
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
	ctype=1;
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
}else {
	ctype=2;
	  subaction = typeFlag+'_addedit.jsp?ChannelId='+channelID+'&ObjectId='+id;
}
 
var tmp='<bean:write property="trs" />';

	if(ctype==2){
		//alert('http://wcm65.gzswdx.gov.cn:9090/wcm/dxapps/paperapply/paperapply_' + subaction);
		window.open('http://wcm65.gzswdx.gov.cn:9090/wcm/dxapps/paperapply/paperapply_' + subaction);
	
	}else{
	if(tmp==1){
		//var h="common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;
		//var h= "common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;
		window.open('http://app.gzswdx.gov.cn/' + subaction);
	}else{
window.parent.leftFrame.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID;
window.location.href  = "common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;
	}

 // window.parent.leftFrame.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID;
 // window.location.href  = "common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;
}}

function toFlowLink1(flow,type){
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
		window.open('http://app.gzswdx.gov.cn/' + subaction);
	}else{
window.parent.leftFrame.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID;
window.location.href  = "common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;
	}

 // window.parent.leftFrame.location.href = "oa.prDesk.leftFrame.do?PID="+pid+"&leftID="+leftID;
 // window.location.href  = "common.pr.baseTopFrame.do?menuID="+leftID+"&subid="+subID+"&subaction="+subaction+"&flag="+flag;

}
 var left=(window.screen.width-500)/2;
 //var top=(window.screen.height-300)/2;
 //document.getElementById('img').style.left=left;
 //document.getElementById('img').style.top=top;
 
/**漂浮代码  开始**/
/*
var x = 50,y = 60 
var xin = true, yin = true 
var step = 1 
var delay = 10 
var obj=document.getElementById("codefans_net") 
function float() { 
var L=T=0
var R= document.body.clientWidth-obj.offsetWidth 
var B = document.body.clientHeight-obj.offsetHeight 
obj.style.left = x + document.body.scrollLeft 
obj.style.top = y + document.body.scrollTop 
x = x + step*(xin?1:-1) 
if (x < L) { xin = true; x = L} 
if (x > R){ xin = false; x = R} 
y = y + step*(yin?1:-1) 
if (y < T) { yin = true; y = T } 
if (y > B) { yin = false; y = B } 
} 
var itl= setInterval("float()", delay) 
obj.onmouseover=function(){clearInterval(itl)} 
obj.onmouseout=function(){itl=setInterval("float()", delay)} 
//*/
/**漂浮代码  结束**/
</script>