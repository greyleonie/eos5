<%@include file="/internet/common.jsp"%>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;����ǩ��</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="60" align="center" style="font-size:30px;font-weight:bold;color:#ff0000;letter-spacing:5pxfont-family:����;"  id="printTable">������ί��У����ǩ��</td>
				</tr>
			</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">			  
			  <tr height="40"> 
				<td height="40" align="center" nowrap class="td1" style='font-size:20px;font-family:����;'><b>�������ƣ�</b></td>
				<td colspan="3" nowrap class="td1" colspan="2" style='font-size:20px;font-family:����;'><bean:write property="MR_APPLY/MeetingName"   /></td>
			  </tr>
			  <tr>
			    <td height="40" align="center" nowrap class="td1" style='font-size:20px;font-family:����;'><b>�������⣺</b></td>
			    <td colspan="3" nowrap class="td1" colspan="2" style='font-size:20px;font-family:����;'><bean:write property="MR_APPLY/TOPIC"   /></td>
		      </tr>
		      <tr>
			    <td height="40" align="center" nowrap class="td1" style='font-size:20px;font-family:����;'><b>��ʼʱ�䣺</b></td>
			    <td nowrap class="td1" style='font-size:20px;font-family:����;'><bean:write property="MR_APPLY/STARTDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
			    <td width="10%" height="25" align="center" nowrap class="td1" style='font-size:20px;font-family:����;'><b>����ص㣺</b></td>
			    <td width="40%" nowrap class="td1" style='font-size:20px;font-family:����;'><bean:write property="MR_APPLY/MRNAME"  /></td>
	          </tr>	
			  <tr>
			    <td height="40" align="center" nowrap class="td1" style='font-size:20px;font-family:����;'><b>�����ˣ�</b></td>
			    <td nowrap class="td1" style='font-size:20px;font-family:����;'><bean:write property="MR_APPLY/Moderator"   /></td>
			    <td width="10%" height="25" align="center" nowrap class="td1" style='font-size:20px;font-family:����;'><b>Ӧ��������</b></td>
				<td width="40%" nowrap class="td1"><div id='count' style='font-weight:bolder;font-size:34px;color:red;font-family:����;vertical-align:middle;'> <bean:write property="entity/count"/>��</div></td>
		      </tr>
			  <tr> 
				<td height="120" align="center" nowrap class="td1" rowspan='2' style='font-size:20px;font-family:����;height:60px;'><b>�ѵ���Ա��</b></td>
				<td height="60" width="40%" nowrap class="td1" colspan="3"><div id='rcount' style='font-weight:bolder;font-size:34px;vertical-align:middle;height:60;font-family:����;color:blue;height:60px;'> <bean:write property="entity/rcount"    />��</div>	</td>
			  </tr>
			  <tr> 
				<td height="60" align="left" nowrap class="td1" colspan="3" style='white-space:normal;word-break:break-all;overflow:hidden;'><DIV id='rname'style='vertical-align:middle;height:60;color:blue;font-size:28px;font-family:����;'><bean:write property="rname/name"    /></DIV></td>
			  </tr>
			  <tr> 
				<td height="120" align="center" nowrap class="td1" rowspan='2' style='font-size:20px;font-family:����;height:60px;'><b>δ����Ա��</b></td>
				<td height="60" width="40%" nowrap class="td1" colspan="3"><div id='nrcount' style='font-weight:bolder;font-size:34px;height:60;color:red;font-family:����;vertical-align:middle;'> <bean:write property="entity/nrcount"    />��</div></td>
			  </tr>
			  <tr> 
				<td height="60" align="left" nowrap class="td1" colspan="3" style='white-space:normal;word-break:break-all;overflow:hidden;'><DIV id='nrname' style='vertical-align:middle;height:60;color:red;font-size:28px;font-family:����;'><bean:write property="nrname/name"    /></DIV></td>
			  </tr>
			</table>
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="�� ��" onClick="history.back()"></td></tr>
			</table>
<script>

	var bflag=<bean:write property="result/entity/bflag"   />;
	var flag=<bean:write property="result/entity/flag"   />;
	
	
	function update(){
			//alert();
			var sub = new HiddenSubmit("oa.bizMeetingManage.bizMeetingStart");
			sub.add("applyid", <bean:write property="MR_APPLY/APPLYID"   />);
			if (sub.submit()) {
				var ret = sub.getValue("root/return/code");
				if (ret == null || ret == "0") {
					alert("ʵʱ����ʧ��,����ϵ����Ա!");
				} else {
					var rcount= sub.getValues("root/data/entity/rcount");
					var nrcount=sub.getValues("root/data/entity/nrcount");
					var rname= sub.getValues("root/data/rname/name");
					var nrname=sub.getValues("root/data/nrname/name");
					document.getElementById('rcount').innerText=rcount+'��';
					document.getElementById('nrcount').innerText=nrcount+'��';
					document.getElementById('rname').innerText=rname;
					document.getElementById('nrname').innerText=nrname;
				}
			}
			if(bflag==0||flag==0){
				sendMsg();
			//alert();
			}
	}
	
	function sendMsg() 
		{ 
			var myDate = new Date();
			var year=myDate.getFullYear(); 
			var month=myDate.getMonth()+1; 
			var date=myDate.getDate();
			
			var str_a1=year+'-'+month+'-'+date+' '+myDate.toLocaleTimeString();   var str_a1x2=str_a1.split(" ");
			var str_a2='<bean:write property="MR_APPLY/STARTDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd hh:mm:ss"/>';   var str_a2x2=str_a2.split(" ");
			var a1d=str_a1x2[0].split("-");
			var a2d=str_a2x2[0].split("-");
			if(a1d[0]<1970 || a2d[0]<1970) {alert("���ֵ����С��1970��");return;}
			var rulea1=a1d[1]+"/"+a1d[2]+"/"+a1d[0]+"  "+str_a1x2[1];
			var rulea2=a2d[1]+"/"+a2d[2]+"/"+a2d[0]+"  "+str_a2x2[1];
			var cha= (Date.parse(rulea1)-Date.parse(rulea2))/1000/60;
			var sub = new HiddenSubmit("oa.bizMeetingManage.bizSendMsg");
			sub.add("applyid", <bean:write property="MR_APPLY/APPLYID"   />);
			if(cha<-1&&cha>=-20&&bflag==0){
				sub.add("op", "all");
				if (sub.submit()) {
					var ret = sub.getValue("root/return/code");
					if (ret == null || ret == "0") {
						alert("���ŷ���ʧ��!");
					} else {
						bflag=1;
					}
				}
			}
			if(cha<=1&&cha>=0&&flag==0){
				sub.add("op", "on");
				if (sub.submit()) {
					var ret = sub.getValue("root/return/code");
					if (ret == null || ret == "0") {
						alert("���ŷ���ʧ��!");
					} else {
						flag=1;
					}
				}
			}
		} 
	
	window.setInterval("update()", 5000);
	
	
		
</script>