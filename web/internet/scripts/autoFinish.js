  var g_ArrBookList;
  var g_MainDiv = null;
  var g_Body = null;
  var g_FirstTd = null;
  var g_CurrentTd = null;
  var g_InputObject = null;
  var g_OldInnerTxt = "";
  var g_NewInnerTxt = "";
  var g_TdCssClassName = "autofinish_over";
  var g_TbCssClassName = "autofinish";
  var g_AddListContainer = null;
  var g_IgnoreIE = false;
  g_IgnoreIE = (navigator.userAgent.indexOf('MSIE 5') != -1 || navigator.userAgent.indexOf('Mac') != -1);
  var display_width = 600; // 层允许显示的宽度
  var display_height = 200; // 层允许显示的高度
     
  
  function f_OnKeyUp(obj, event) { 
	 
    var kc = event.keyCode;
    var sTemp = "13,27,38,40,9,116,";
    kc = kc + "";
    if (sTemp.indexOf(kc) > -1) {
      return false;
    }
    f_InitDivData(obj, event); 
    if (g_NewInnerTxt == "" && kc != 32) {
      f_SetDivDisplay(false);
    }
    else {
      f_SetDivDisplay(true);
    }
   
  }
  
  function f_OnKeyPress() {
    return;
  }
  
  function f_OnChange() {
    return;
  }
  
  function f_OnBlur() {
    if (g_InputObject == null) {
      return;
    }
  
    var s = g_InputObject.value;
    var x = s.substr(s.length - 1, 1);
    if (x == "," || x == ";") {
      g_InputObject.value = s.substr(0, s.length - 1);
    }
   
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
  
  function f_CreateTable() {
    var oTable = document.createElement("table");
    oTable.border = 0;
    oTable.cellSpacing = 2;
    oTable.cellPadding = 2;
    oTable.className = g_TbCssClassName;
    return oTable;
  }
  
  function f_CreateRow(table) {
    var rowNode = table.insertRow( -1);
    return rowNode;
  }
  
  function f_CreateColumn(row, i) {
    var colNode = row.insertCell(document.all ? -1 : 0);
    colNode.id = "tdACMA_" + i;
    colNode.zIndex = i;
    colNode.align = "left";
    colNode.style.cursor = document.all ? "hand" : "pointer";
    colNode.style.width = display_width-28;  // 设定表格的宽度
    colNode.onmouseover = f_TdOnmouseover;
    colNode.onclick = f_TdOnclick;
    if (i == 0) {
      colNode.className = g_TdCssClassName;
      g_FirstTd = colNode;
      g_CurrentTd = colNode;
    }
    else {
      colNode.className = "";
    }
  
    return colNode;
  }
  
  function f_TdOnmouseover(e) {
    var o;
    if (!e) {
      var e = window.event;
    }
  
    if (e.target) {
      o = e.target;
    }
  
    if (e.srcElement) {
      o = e.srcElement;
    }
 
    while (o.tagName != "TD") {
      o = o.parentNode;
    }
 
    o.className = "";
    if (g_CurrentTd != null) {
      g_CurrentTd.className = "";
    }
  
    g_CurrentTd = o;
    g_CurrentTd.className = g_TdCssClassName;
  }
  
  // 鼠标选择内容
  function f_TdOnclick() {
    f_FillCurrentEmail();
  }
  
  // 初始化层的内容
  function f_InitDivData(objInput, event) {
    var oTb, oTr, oTd;
    g_ArrBookList = f_GetArrBookList(event);
    if (g_ArrBookList != null) {
      g_MainDiv.innerHTML = "";
      
      oTb = f_CreateTable();
    
      g_MainDiv.appendChild(oTb);
      for (var i = 0; i < g_ArrBookList.length; i++) {
        oTr = f_CreateRow(oTb);
        oTd = f_CreateColumn(oTr, i);
        // 这里添加层里显示的内容
        var sStrongTextTitle = g_ArrBookList[i][1];
        var newInnerTxtStart= g_ArrBookList[i][1].indexOf(g_NewInnerTxt);
        if (newInnerTxtStart>-1) {
		  var start=newInnerTxtStart;
		//  if(g_NewInnerTxt!="")start++;
        //  sStrongTextTitle =g_ArrBookList[i][1].substring(0, newInnerTxtStart)+
         //  "<b>" + g_NewInnerTxt + "</b>" +
          //    g_ArrBookList[i][1].substring(newInnerTxtStart, g_ArrBookList[i][1].length);
        sStrongTextTitle= sStrongTextTitle.replace(g_NewInnerTxt,"<b>" + g_NewInnerTxt + "</b>");
}
        
       oTd.innerHTML = "<span style='width:200'>" + sStrongTextTitle + "&nbsp;</span>" +
            "<span style='width:130'>" + g_ArrBookList[i][2] + "&nbsp;</span>" + 
            "<span style='width:130'>" + g_ArrBookList[i][3] + "&nbsp;</span>"+
            "<span style='width:30'>" + g_ArrBookList[i][5] + "&nbsp;/</span>";
      }
      
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
          tDiv.innerHTML = '<iframe id="ifAddList" scrolling="no" marginwidth="0" marginheight="0" frameborder="1" height="100%" width="100%" > </iframe>';
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
        if (document.all && !g_IgnoreIE) {
          var ifr = document.getElementById("ifAddList");
          ifr.style.width = (oTb.offsetWidth + 1) + "px";
          ifr.style.height = (oTb.offsetHeight + 1) + "px";
        }
     
      }
      
    }


    // 取得所有符合条件的内容，然后把它们放入数组中存储
    function f_GetArrBookList(event) {
      if (g_InputObject == null) {
        return null;
      }
 	 
      var s = g_InputObject.value;
      var k = s.length;
      var iLastSign = 0;
      // 以 "," 或者 ";" 作为一个输入项的结束符号
      if (s.lastIndexOf(",") > s.lastIndexOf(";")) {
        iLastSign = s.lastIndexOf(",");
      }
      else {
        iLastSign = s.lastIndexOf(";");
      }

      g_NewInnerTxt = s.substring(iLastSign + 1, k);
      if (event.keyCode == 8) {
        g_NewInnerTxt = s.substring(iLastSign + 1, k - 1);
      }
  
      g_NewInnerTxt = f_Trim(g_NewInnerTxt);
      g_OldInnerTxt = s.substring(0, iLastSign);
      g_OldInnerTxt = f_Trim(g_OldInnerTxt);
      var arr = new Array();
      var re;
      var j = 0;
      if (g_NewInnerTxt == "") {
        if (event.keyCode == 32) {
          // 输入空格时，显示所有的地址
          arr = textbookArray;
        }
      }
      else {
        try {
          re = new RegExp(g_NewInnerTxt, "gi"); 
          for (var i = 0; i < textbookArray.length; i++) {
            if (re.test(textbookArray[i][1])) {
              // 如果输入的字符串匹配的话，就将它放到数组arr中
              arr[j] = textbookArray[i];
              j++;
            }
          }
        }
        catch (ex) {}
      }
      return arr;
    }


    function f_EnterKey() {
      f_FillCurrentEmail();
    }


    function f_EscapeKey() {
      return;
    }
 
 
    function f_BackSpaceKey(obj, event) {
      f_InitDivData(obj, event);
      if (g_NewInnerTxt == "") {
        f_SetDivDisplay(false);
      }
      else {
        f_SetDivDisplay(true);
      }

    }

    function f_UpKey() {
      if (g_CurrentTd == null) {
        return;
      }

      var k = g_CurrentTd.zIndex - 1;
      if (k == -1) {
        k += 1;
      }

      var oTd = document.getElementById("tdACMA_" + k);
      g_CurrentTd.className = "";
      g_CurrentTd = oTd;
      g_CurrentTd.className = g_TdCssClassName;

      // 点击键盘向上键时，层g_AddListContainer里内容相应的要向下滚动
      //if ((oTd.offsetTop+display_height) <= g_AddListContainer.scrollHeight) {
      if ((oTd.offsetTop) < g_AddListContainer.scrollTop) {
          g_AddListContainer.scrollTop = g_AddListContainer.scrollTop - 22;
      }
      
      f_SetDivDisplay(true);
    }


    function f_DownKey() { 
      if (g_CurrentTd == null) {
        return;
      }

      var k = g_CurrentTd.zIndex + 1;
      if (k == g_ArrBookList.length) {
        k -= 1;
      }
   
      var oTd = document.getElementById("tdACMA_" + k); 
      g_CurrentTd.className = "";
      g_CurrentTd = oTd;
      g_CurrentTd.className = g_TdCssClassName;
      
      // 点击键盘向下键时，层g_AddListContainer里内容相应的要向上滚动
      if (oTd.offsetTop >= display_height) {
          g_AddListContainer.scrollTop = g_AddListContainer.scrollTop + 22;
      }
      
      f_SetDivDisplay(true);
      
    }

    // 去除字符串前后的空格
    function f_Trim(str) { 
      str = str.replace(/(^\s*)|(\s*$)/g, "");
      return str; 
    }
