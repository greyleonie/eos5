<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
.text_legend {
	font-size: 18px;
	color: #BF0404;
	line-height: 24px;
	font-weight:bold;
	font-family: "经典中圆简";
}
-->
</style>
<html:html locale="true">
	<head>
		<title>系统消息</title>
		<OBJECT ID="Card Control" WIDTH="" HEIGHT="" CLASSID="CLSID:00BCB426-4501-496F-B780-267302BE3BA3" codebase="/ActiveX/card.cab" name="cardcontrol">
		</OBJECT>
		<OBJECT ID="StandardCom Control" WIDTH="" HEIGHT="" CLASSID="CLSID:1538AED7-C401-4A0B-B0A8-D3A8AA53DF0B" codebase="/ActiveX/com.cab" name="comcontrol">
		</OBJECT>
		<!-- 把发卡数据写入卡中 -->
		<script language="javascript">
			var controlflag=0;	//控件标志位，0表示退出网页时，不执行cardcontrol.Quit()
			
			function WriteIntoCard(){
			controlflag=1;
			var com=0;
			cardcontrol.Init(com);	//初始化串口
			
			try{
				if(document.all.Data0.value.length>0){
					if(cardcontrol.WriteData(7,0,document.all.Data0.value)==0){
						WriteIntoCardError();
						return;
						}
					
				}

				if(document.all.Data1.value.length>0){
					if(cardcontrol.WriteData(7,1,document.all.Data1.value)==0){
						WriteIntoCardError();
						return;
					}
				}

				if(document.all.Data2.value.length>0){
					if(cardcontrol.WriteData(7,2,document.all.Data2.value)==0){
						WriteIntoCardError();
						return;
						}
				}
			}
			catch(theException){
				WriteIntoCardError();
			}
			cardcontrol.Quit();
			}
			
			function WriteIntoCardError(){
				if(window.confirm("写卡出现异常，请您检查操作是否有误，确定无误后再点击“确定”按钮重新写卡！")){
					cardcontrol.Quit();
					WriteIntoCard();
				}
				else{
					info.innerHTML="操作失败！";
					
				}
			}
			
						
			function SendToElock(controlid,len,elockData){
			controlflag=1;//alert(controlid);alert(elockData);
			var com=3;
			controlid = controlid*1;
			len = len*1;
			if(comcontrol.SetPopedomToElock(com,controlid,len,elockData)==0 && comcontrol.SetPopedomToElock(com,controlid,len,elockData)==0 && comcontrol.SetPopedomToElock(com,controlid,len,elockData)==0)
				alert(controlid+"号控制器权限下传失败！");
			else
				alert(controlid+"号控制器权限下传成功！");
			}
						
			function SendToPOS(){
			controlflag=1;
			var com=3;
			var posid=document.all.POSID.value*1;
			var count=document.all.BlackListLen.value*1;
			//alert(count);
			if(comcontrol.SendDataToPOS(com,posid,document.all.POSData.value,count,document.all.BlackListData.value)==0)
				alert("收费机设置信息下传失败！");
			}
			
			function Exit(){
			if(controlflag!=0)
			cardcontrol.Quit();
			}
		</script>
		<%
		/*
		SuccessMsgForm smf=(SuccessMsgForm)request.getAttribute(talent.core.Constants.SUCCESSMESSAGE_KEY);
		String info=smf.getInfo();		//获取info参数
		String url=smf.getUrl();		//获取即将转向的url
		*/
		String info=base.util.TalentContext.getValue(pageContext,null,"info");
		String url=base.util.TalentContext.getValue(pageContext,null,"url");
		
	
		
		%>
		
		<script language="JavaScript">
			　　function goBack(a)
			　　{
			window.navigate(a);
			　　}
			function AutoClose()
			{
			Exit();
			window.close();
			}
			　　function AutoForword()
			　　{
			//WebServerENV.ROOTPATH+url;
			Exit();
			window.opener.location.href="<%=url%>";
			window.close();
			　　}
		</script>
		
	</head>
	
	<body class='Standard-BodyStyle' leftMargin=0 topMargin=0 onUnload="Exit()">
		
		<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TR>
			  <TD >
					<table width="400" height="165" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#000099">
						<tr>
						  <td height="20" bordercolor="#0000CC" bgcolor="4A82D1"><span class="STYLE1">　系统消息</span></td>
						</tr>
					
						<tr>
						  <td height="110" align="center" valign="middle" bgcolor="#FFFFFF" ><table border=0 width="80%" align=center>
                            <tr>
                              <td width="23%" align="center" id="info"><img src="/internet/image/tst.jpg" width="51" height="40" align="middle" /></td>
                              <td width="77%" align="center" class="text_legend" id="info">
                                 
                                  <b><%=info%></b> </td>
                            </tr>
                          </table>
						    <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                              <tr>
                                <td bgcolor="#FFFFFF">&nbsp;</td>
                                <td valign="top" bgcolor="#FFFFFF">&nbsp;</td>
                                <td bgcolor="#FFFFFF">&nbsp;</td>
                              </tr>
                              <tr>
                                <td width="25%" bgcolor="#FFFFFF">&nbsp;</td>
                                <td width="50%" valign="top" bgcolor="#FFFFFF"><div align="center">
                                    <logic:present property="ButtonType">
                                      <logic:equal property="ButtonType" value="0">
                                        <script>
																	AutoNavigateToClose();
																</script>
                                        <input name="button" type="button" Class="button_02" onClick="AutoClose()" value="确 定"/>
                                      </logic:equal>
                                      <logic:equal property="ButtonType" value="1">
                                        <script>
																	AutoNavigateToForword();
																</script>
                                        <input name="button" type="button" Class="button_02" onClick="AutoForword()" value="确 定"/>
                                      </logic:equal>
                                    </logic:present>
                                </div></td>
                                <td width="25%" bgcolor="#FFFFFF">&nbsp;</td>
                              </tr>
                            </table></td>
						</tr>
					</table>
					</TD>
			</TR></TABLE>
	
		<logic:present property="list[@type='CARDDATALIST']/CARDDATA">
			<%int i=0; 
			%>
			<logic:iterate id="CardData" property="list[@type='CARDDATALIST']">
				
				 
				<input type="hidden" name="Data<%=i++%>" value='<bean:write id="CardData" property="CARDDATA"/>'>
			
			</logic:iterate>
			<script>
				WriteIntoCard();
			</script>
		</logic:present>
		
		<logic:present property="ELOCKDATA_KEY">
			<script>
				SendToElock(<bean:write id="<%=talent.core.Constants.ELOCKDATA_KEY%>" property="controlerID" />,<bean:write id="<%=talent.core.Constants.ELOCKDATA_KEY%>" property="elockDataLen" />,"<bean:write id="<%=talent.core.Constants.ELOCKDATA_KEY%>" property="elockData" />");
			</script>
		</logic:present>
		
		<logic:present property="list[@type='ELOCKDATALIST']/Elock/ElockDataLen">
			<logic:iterate id="ElockData" property="list[@type='ELOCKDATALIST']">
				<script>
					SendToElock(<bean:write id="ElockData" property="Elock/ControlerID"/>,<bean:write id="ElockData" property="Elock/ElockDataLen"/>,"<bean:write id="ElockData" property="Elock/ElockData"/>");
				</script>
			</logic:iterate>
		</logic:present>
		
		<logic:present property="POSDATA_LIST_KEY">
			<input type="hidden" name="POSData" value="<bean:write property="<%=talent.core.Constants.POSDATA_LIST_KEY %>"/>"/>
			<!--
			<input type="hidden" name="POSID" value="<bean:write property="<%=talent.core.Constants.POSID_KEY %>"/>"/>
			<input type="hidden" name="BlackListLen" value="<bean:write property="<%=talent.core.Constants.BLACKLIST_LEN_KEY %>"/>"/>
			<input type="hidden" name="BlackListData" value="<bean:write property="<%=talent.core.Constants.BLACK_LIST_KEY %>"/>"/>
			-->
			<script>
				SendToPOS();
			</script>
		</logic:present>
	</body>
	
</html:html>