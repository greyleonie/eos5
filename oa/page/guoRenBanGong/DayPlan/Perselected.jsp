<%@ include file="/internet/common.jsp" %>
<!-- Insert your jsp/html code here -->

<!-- Insert your jsp/html code here -->

<html>


<body>

<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td> </td>
  </tr>
</table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="23"><img src="/internet/images/red_BODY_left.gif" width="23" height="23"></td>
    <td background="/internet/images/red_BODY_bg.gif"><table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><table height="23"  border="0" cellpadding="0" cellspacing="0">
              <tr align="center">
                <td width="82" class="Column_blue">选择人员</td>
              </tr>
          </table></td>
        </tr>
    </table></td>
    <td width="15"><img src="/internet/images/red_BODY_right.gif" width="15" height="23"></td>
  </tr>
</table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
 <form name="form1" method="post" action="tools.pr.pr_DoSelectedMan.do">

  <html:hidden property="PageCond/begin"  />
 <html:hidden property="PageCond/length" value="10" />
 <html:hidden property="PageCond/count" />
 <html:hidden property="EOSOPERTEMP/ORGID"/>
 <html:hidden property="EOSOPERTEMP/OPERATORNAME[@criteria='like']"/>
 
    <html:hidden property="Order/col1/@order" />
  <html:hidden property="Order/col1"/>
    <html:hidden property="EOSOPERTEMP/ORGID" name="EOSEMPREF/ORGID"/>

      <html:hidden property="GWMC"/>
           <html:hidden property="manage_user"/>


  <tr>
    <td width="15" background="/internet/images/red_BODY_leftbg.gif">&nbsp;</td>
    <td><table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>
          <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right" class="text">
              <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0" class="text">
                  <tr>
                  <td width="20%" nowrap>

                  </td>
                  <td width="40%">

                  </td>
                    <td width="12%" align="right" nowrap>
                    </td>

                   <td width="28%" align="left">

                  </td>
                  </tr>
              </table>
              </td>
            </tr>
            <tr>
              <td height="1" bgcolor="#BCBCBC"> </td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="28" align="left" valign="middle" class="text_red">可选人员列表：</td>
          <td width="60" height="28" valign="middle">&nbsp;</td>
          <td height="28" align="left" valign="middle"><span class="text_green">已选人员列表：</span></td>
        </tr>
        <tr>
          <td valign="top"><table width="136"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="8"><img src="/internet/images/chang_left.gif" width="8" height="174"></td>
                <td valign="top" background="/internet/images/chang_bg2.gif"><table width="100%" height="170"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="10"> </td>
                    </tr>
                    <tr>
                      <td><select name="select1" size="9" multiple class="input_none" >
            <logic:iterate property="list[@type='notsel']" id="result1">
                          <option value="<bean:write id="result1" property="EOSOPER/USERID"/>"><bean:write id="result1" property="EOSOPER/OPERATORNAME"/></option>
    </logic:iterate>
                      </select></td>
                    </tr>
                    <tr>
                      <td height="10"> </td>
                    </tr>
                </table></td>
                <td width="8"><img src="/internet/images/chang_right.gif" width="8" height="174"></td>
              </tr>
          </table></td>
          <td valign="middle"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="30" align="center"><input name="Submit4" type="button" class="change" value=">" onclick="javascript:moveDualList(document.form1.select1, document.form1.select2, false )"></td>
              </tr>
              <tr>
                <td height="30" align="center"><input name="Submit5" type="button" class="change" value=">>" onclick="javascript:moveDualList(document.form1.select1, document.form1.select2, true )"></td>
              </tr>
              <tr>
                <td height="30" align="center"><input name="Submit6" type="button" class="change" value="<<" onclick="javascript:moveDualList(document.form1.select2, document.form1.select1, true )"></td>
              </tr>
              <tr>
                <td height="30" align="center"><input name="Submit7" type="button" class="change" value="<"  onclick="javascript:moveDualList(document.form1.select2, document.form1.select1, false )"></td>
              </tr>
          </table></td>
          <td valign="top"><table width="136"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="8"><img src="/internet/images/chang_left.gif" width="8" height="174"></td>
                <td valign="top" background="/internet/images/chang_bg2.gif"><table width="100%" height="174"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="10"> </td>
                    </tr>
                    <tr>
                      <td><select name="select2" size="9" multiple class="input_none" >
<logic:iterate property="list[@type='sel']" id="result">
                          <option value="<bean:write id="result" property="PERSONS/id"/>"><bean:write id="result" property="PERSONS/name"/></option>
    </logic:iterate>
                      </select></td>
                    </tr>
                    <tr>
                      <td height="10"> </td>
                    </tr>
                </table></td>
                <td width="8"><img src="/internet/images/chang_right.gif" width="8" height="174"></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="96%" height="15"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" align="center"><table width="250"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="9"><img src="/internet/images/button_left.gif" width="9" height="22"></td>
              <td align="center" background="/internet/images/button_di.gif"><input name="Submit2" type="button" class="button_new" value="确 定" onclick="mysubmit()">


      &nbsp; <input name="Submit32" type="button" class="button_new" value="返 回" onclick="doReturn()"></td>
              <td width="9"><img src="/internet/images/button_right.gif" width="9" height="22"></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    <td width="15" background="/internet/images/red_BODY_rightbg.gif">&nbsp;</td>
  </tr>
</form></table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="18"><img src="/internet/images/red_BODY_downleft.gif" width="24" height="24"></td>
    <td background="/internet/images/red_BODY_downbg.gif">&nbsp;</td>
    <td width="18"><img src="/internet/images/red_BODY_downright.gif" width="24" height="24"></td>
  </tr>
</table>
<Script language="JavaScript">
var len=0;
var len1=0;
for(len=0;len<document.form1.select1.length;len++)
{
for(len1=0;len1<document.form1.select2.length;len1++)
{
if(document.form1.select1.options[len].value==document.form1.select2.options[len1].value)
{
document.form1.select2.options[len1].text=document.form1.select1.options[len].text;
document.form1.select1.options[len]=null;


}

}
}

for(len1=0;len1<document.form1.select2.length;len1++)
{
for(len=0;len<document.form1.select1.length;len++)


{
if(document.form1.select1.options[len].value==document.form1.select2.options[len1].value)
{
document.form1.select2.options[len1].text=document.form1.select1.options[len].text;
document.form1.select1.options[len]=null;


}

}
}
</script>
</body>
  </html>
<SCRIPT LANGUAGE="JavaScript">

function compareOptionValues(a, b)

{ var sA = parseInt( a.value, 36 );  

  var sB = parseInt( b.value, 36 );  

  return sA - sB;

}
function compareOptionText(a, b) 

{ 
  var sA = parseInt( a.text, 36 );  

  var sB = parseInt( b.text, 36 );  

  return sA - sB;

}
function moveDualList( srcList, destList, moveAll ) 

{
if (  ( srcList.selectedIndex == -1 ) && ( moveAll == false )   )

  {

    return;

  }
  
newDestList = new Array(destList.options.length);
var len = 0;
for( len = 0; len < destList.options.length; len++ ) 
{ if ( destList.options[ len ] != null )

    {

      newDestList[ len ] = new Option( destList.options[ len ].text, destList.options[ len ].value, destList.options[ len ].defaultSelected, destList.options[ len ].selected );

    }

  }



  for( var i = 0; i < srcList.options.length; i++ ) 

  { 

    if ( srcList.options[i] != null && ( srcList.options[i].selected == true || moveAll ) )

    {
       newDestList[ len ] = new Option( srcList.options[i].text, srcList.options[i].value, srcList.options[i].defaultSelected, srcList.options[i].selected );

       len++;

    }

  }
  //newDestList.sort( compareOptionValues );   
  for ( var j = 0; j < newDestList.length; j++ ) 

  {

    if ( newDestList[ j ] != null )

    {

      destList.options[ j ] = newDestList[ j ];

    }

  }
for( var i = srcList.options.length - 1; i >= 0; i-- ) 

  { 

    if ( srcList.options[i] != null && ( srcList.options[i].selected == true || moveAll ) )

    {
        srcList.options[i]       = null;

    }

  }



} 
function mysubmit()
{
   fld_str="";
   fld_text="";
   for (i=0; i<  document.form1.select2.options.length; i++)
   {
      options_value= document.form1.select2.options(i).value;
      options_text = document.form1.select2.options(i).text;
      fld_str+=options_value+",";
      fld_text+=options_text+",";
    }

    fld_str=fld_str.substring(0,fld_str.length-1);
    fld_text = fld_text.substring(0,fld_text.length-1);
       document.form1("PageCond/count").value='0';

       window.returnValue = fld_str+"|"+fld_text;
       window.close();


}
function doQuery()
{
var frm=document.form1;
alert("ok");
frm.action="tools.pr.pr_DoSelectedMan.do?EOSOPER/OPERATORNAME="+frm("textfield3").value;
if(frm.checkbox.checked)
frm.action="tools.pr.pr_DoSelectedMan.do?EOSOPER/USERID="+frm("textfield3").value;

frm.submit();

}
function doReturn()
{

       window.close();

}
</script>

