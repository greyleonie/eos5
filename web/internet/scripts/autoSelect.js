  var g_MainDiv = null;
  var g_Body = null;
  var g_AddListContainer = null;
  var g_IgnoreIE = false;
  g_IgnoreIE = (navigator.userAgent.indexOf('MSIE 5') != -1 || navigator.userAgent.indexOf('Mac') != -1);
  var display_width = 280; // 层允许显示的宽度
  var display_height = 200; // 层允许显示的高度
     
  
  function f_OnKeyUp(obj, event) { 
    var kc = event.keyCode;
    var sTemp = "13,27,38,40,9,116,";
    kc = kc + "";
    if (sTemp.indexOf(kc) > -1) {
      return false;
    }
    f_InitDivData(obj,listName,index); 

   
  }
  
  function f_OnKeyPress() {
    return;
  }
  
  function f_OnChange() {
    return;
  }
  
  function f_OnBlur() {
  if(g_AddListContainer != null){
  	g_AddListContainer.style.display = "none";
  }
  }

  function f_OnClick() {
      return;
  }
  function f_OnPasete() {
    return;
  }
  
  function f_InitMain() {
    if (g_Body == null) {
      g_Body = document.body;
    }
  
    if (g_MainDiv == null) {
      g_MainDiv = f_CreateDiv();
      g_Body.appendChild(g_MainDiv);
    } 
    
  }
  
  function f_CreateDiv() {
    var div = document.createElement("div");
    div.id = "divEmailAddressMain";
    div.style.position = "absolute";
    div.style.display = "";  
    return div;
  }
  
  function f_SetDivDisplay(bTrue) {
    if (bTrue) {
      g_AddListContainer.style.display = "";
    }
    else {
      g_AddListContainer.style.display = "none";
    }
    
  }
  
  function f_GetX(e) {
    var l = e.offsetLeft;
    while (e = e.offsetParent) {
      l += e.offsetLeft;
    }
  
    return l;
  }
  
  function f_GetY(e) {
    var t = e.offsetTop;
    while (e = e.offsetParent) {
      t += e.offsetTop;
    }
   
    return t;
  }

   // 初始化层的内容
  function f_InitDivData(objInput) {
  	  f_InitMain();
      g_MainDiv.innerHTML = "";
      var e = objInput;
      if (!document.getElementById("dvAddListContainer")) {
        var tDiv = document.createElement("div");
        tDiv.id = "dvAddListContainer";
        with(tDiv.style) {
          position = "absolute";
          zIndex = "99";
          display = "none";
          width = height = "0px";
        }
        if (document.all && !g_IgnoreIE) {
          tDiv.innerHTML = '<iframe id="ifAddList" onfocus="f_SetDivDisplay(true)" onblur="f_SetDivDisplay(false)"   src="oa.prThingsManage.goodsSelectTree.do" scrolling="auto" marginwidth="0" marginheight="0" frameborder="1" height="100%" width="100%" > </iframe>';
        }
          
          document.body.appendChild(tDiv);
      }
    
        g_AddListContainer = document.getElementById("dvAddListContainer");
        g_AddListContainer.style.left = (f_GetX(e) + 1) + "px";
        g_AddListContainer.style.top = (f_GetY(e) + 24) + "px";
        g_AddListContainer.style.display = "";
        g_AddListContainer.style.width = display_width + "px"; // 这个能自动调整大小吗？
        g_AddListContainer.style.height = display_height + "px"; 
        g_AddListContainer.style["overflow"] = "auto";
        

        g_AddListContainer.appendChild(g_MainDiv);
        g_MainDiv.style.left = 0;
        g_MainDiv.style.top = 0;

     
      
      
    }
  

    // 去除字符串前后的空格
    function f_Trim(str) { 
      str = str.replace(/(^\s*)|(\s*$)/g, "");
      return str; 
    }
