
 function clearPass(ID,password,Login_ID){
	 if(password==null||password==""){
	 alert("密码已经为空不用清除");
	 return;
	 }
	 else{
		 if(confirm("登录财号为"+Login_ID+"的密码将被清空,你确定要清空吗？")==false)
			 return;
		  else{
			  document.forms[0].method.value="toClearPass";
			  document.forms[0].user_ID.value=ID
			  document.forms[0].submit();
		  }
	 }

}

function change(obj, self){
  if (document.all(obj).style.display == "none"){
    self.src = "/internet/image/minus.gif";
    document.all(obj).style.display = "block";
	//document.all(obj).className = "f12";
  } else {
    self.src ="/internet/image/plus.gif";
    document.all(obj).style.display = "none";
	//document.all(obj).className = "f13";
  }    
}

function check(obj){
  var cid = obj.getAttribute('cid');
  var id = obj.getAttribute('id');
  if (obj.checked == true){
    //recurResources(obj.cid, true);
    recurResources(cid, true);
    recurResourcesUp(id,true);
  } else {
    //recurResources(obj.cid, false);
    recurResources(cid, false);
  }
}

//************************************************************
var ns = navigator.appName == "Netscape";
if(ns){
    HTMLDocument.prototype.getElementsById=function (strTagName,strId){
        var arrObj=new Array();
        var tagObjs=this.getElementsByTagName(strTagName); 
        for(var i=0;i<tagObjs.length;i++){
            var idValue=tagObjs[i].getAttribute("id");
            if(idValue==strId){
                arrObj[arrObj.length]=tagObjs[i];
            }
        }  
        return arrObj;
    }
}
//************************************************************


function recurResources(id, index){
  var i;
  if(ns){
      var obj=document.getElementsById("INPUT",id);
  } else {
      var obj = document.all(id);
  }
   
  if (obj != null){
      if (typeof(obj.length) != "undefined"){
        for (i=0; i<obj.length; i++){
          obj[i].checked = index;
          recurResources(obj[i].getAttribute('cid'), index);  
        }
      } else {
        obj.checked = index;
        recurResources(obj.getAttribute('cid'), index);        
      }
  }
}
function doBack(){
    if(navigator.appName == "Microsoft Internet Explorer"){
        history.back();
        return;
    }
    var moduleform = document.forms[0];
    var action="<gdp:context/>/privilege/userAction.do?action=list";

    moduleform.action = action;
    moduleform.submit();
}
//..........................................................
function checkUp(obj){
//	alert("ok")
  var id = obj.getAttribute('id');
  if (obj.checked == true){
    //recurResources(obj.cid, true);
    recurResourcesUp(id, true);
  } else {
    //recurResources(obj.cid, false);
    recurResourcesUp(id, false);
  }
}
function recurResourcesUp(id, index){
  
  var obj = document.all("list/moduAndOper");
 // alert(obj);
  if (obj != null && index==true){
	   for(var i = 0 ;i<obj.length;i++){
		if(obj[i].getAttribute('cid')==id){
          obj[i].checked = index;
		  recurResourcesUp(obj[i].getAttribute('id'), index);  
		}
	   }
    }
 // else if(obj!=null && index==false){
   	//   for(var i = 0 ;i<obj.length;i++){
	//	if(obj[i].getAttribute('cid')==id){
       //   obj[i].checked = index;
		  //recurResourcesUp(obj[i].getAttribute('id'), index);  
	//	}
	 //  }
//  }

}
