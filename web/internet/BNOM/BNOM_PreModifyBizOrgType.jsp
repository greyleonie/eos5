<%@ include file="/internet/BNOM/omappbase.jsp" %>

<body topmargin="0" rightmargin="0" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0">
<table width="100%" height="100%">
  <tr>
   <td>
	<eos:OneTab name="业务机构类型管理" imagePath="/internet/images/tt.gif">	
	<div style="BORDER-LEFT: gray 1px solid; WIDTH:100%;  HEIGHT:100%"> 
		<table width="100%" height="500" cellpadding="0" cellspacing="0" bgcolor="#eeeeee" align="center">
		    <tr height="15"><td></td></tr>
		    <tr height="15">
		      <td><font size="2"><br><br><br>
		        &nbsp;&nbsp;&nbsp;&nbsp;作为对标准组织机构的补充，业务机构维护多维的业务组织模型。它可以帮您实现矩阵式的机构管理。
		        <br><br>&nbsp;&nbsp;&nbsp;&nbsp;功能主要包括：<br>
		          <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--增加/删除业务机构类型
		          <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--增加/删除业务子机构
		          <br><br>&nbsp;&nbsp;&nbsp;&nbsp;你可以点击按钮
		    	&nbsp;<input type="button" value="修改业务机构类型" title="修改业务机构类型" onclick="javascript:top.window.location.href='BNDICT.pr_automata.BNDICT_P_DictDetailQuery.do?BNDICT_V_Dictionary/businTypeID=BNORG_BizOrgType&PageCond/begin=0&PageCond/length=10&PageCond/count=-1&BNOMtag=9999&backURL=/internet/BNOM.pr_automata.BNOM_P_ShowBizOrgMain.do'" class="button"></input>
		    	在业务字典管理功能中配置业务机构类型。</font>
		      </td>
		    </tr>
		    <tr>
		      <td align="center">
		      
		    	<table width="94%">
		    	    <tr><td>		
						<!--<iframe name="detailWindow" marginwidth=0 frameborder=0
				     		marginheight=0  width="100%" scrolling=no  height="500" src="BNDICT.pr_automata.BNDICT_P_DictDetailQuery.do?BNDICT_V_Dictionary/businTypeID=BNORG_BizOrgType&PageCond/begin=0&PageCond/length=10&PageCond/count=-1"> 
						</iframe>-->
			    	</td></tr>
				</table>
		      </td>
		    </tr>
		</table>
	</div>
	</eos:OneTab>
   </td>
  </tr>
</table>

</body>