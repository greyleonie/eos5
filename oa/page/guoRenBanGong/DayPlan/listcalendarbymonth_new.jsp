<%@ page  import="java.util.*,org.w3c.dom.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
	<HEAD>
		<%
		com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request
				.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);
		//String userId = base.util.TalentContext.getValue(pageContext, null,"SessionEntity/operatorID");
		int toyear = 0;
		int tomonth = 0;
		String year = reqContext.getEntityValue("year");
		String month = reqContext.getEntityValue("month");
		Calendar calendar = Calendar.getInstance();
		if (!"null".equalsIgnoreCase(year) && !"null".equalsIgnoreCase(month)
				&& !"".equalsIgnoreCase(year) && !"".equalsIgnoreCase(month)
				&& year != null && month != null) {
			calendar
					.set(Integer.parseInt(year), Integer.parseInt(month) - 1, 1);
			toyear = new Integer(year).intValue();
			tomonth = new Integer(month).intValue() - 1;
		} else {
			calendar.set(calendar.get(Calendar.YEAR), calendar
					.get(Calendar.MONTH), 1);//当前月
			toyear = calendar.get(Calendar.YEAR);
			tomonth = calendar.get(Calendar.MONTH);
		}
		int listindex = 0;
		String userID = reqContext.getEntityValue("SessionEntity/userID");

		%>
		<TITLE>工作日历</TITLE>
		<LINK rel=stylesheet type=text/css href="/internet/DayPlan/basic_new.css" media=screen>
		<SCRIPT src="/internet/DayPlan/BX.1.0.1.U.js"></SCRIPT>
		<SCRIPT src="/internet/DayPlan/TabControl.1.1.U.js"></SCRIPT>
		<STYLE type=text/css>A {
	COLOR: #2b2b2b
}
html { overflow-x:hidden; }
BODY {
	BORDER-BOTTOM: 0px; BORDER-LEFT: 0px; BACKGROUND: #fff; BORDER-TOP: 0px; BORDER-RIGHT: 0px;margin:0px 0px 0px 0px;font-family: 幼圆;
	
}
.clear {
	LINE-HEIGHT: 0px; MARGIN: 0px auto; HEIGHT: 0px; CLEAR: both; FONT-SIZE: 0px
}
.dateDiv {
	BORDER-BOTTOM: #d2878b 1px solid; BORDER-LEFT: #d2878b 1px solid; MARGIN-TOP: 12px; BORDER-TOP: #d2878b 1px solid; BORDER-RIGHT: #d2878b 1px solid
}
.dateTop {
	PADDING-LEFT: 80px; WIDTH: 200px; FONT: bold 60px/60px Arial; BACKGROUND: url(/internet/DayPlan/date_bk.jpg) no-repeat; HEIGHT: 70px; COLOR: #bd0110
}
.dateTop IMG {
	DISPLAY: inline
}
.dateTable TABLE {
	BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; WIDTH: 260px; BORDER-COLLAPSE: separate; HEIGHT: 180px; MARGIN-LEFT: 10px; BORDER-TOP: medium none; BORDER-RIGHT: medium none
}
.dateTable TD {
	BORDER-BOTTOM: #ccc 1px solid; TEXT-ALIGN: center; BORDER-LEFT: #ccc 1px solid; MARGIN: 6px; WIDTH: 23px; FONT: 14px Arial; BACKGROUND: #f6f6f6; HEIGHT: 20px; BORDER-TOP: #ccc 1px solid; BORDER-RIGHT: #ccc 1px solid
}
.week TD {
	BORDER-BOTTOM: #8f8f8f 1px solid; BORDER-LEFT: #8f8f8f 1px solid; BACKGROUND: #8f8f8f; COLOR: #fff; BORDER-TOP: #8f8f8f 1px solid; BORDER-RIGHT: #8f8f8f 1px solid
}
.dateTable TABLE .gameday {
	BACKGROUND: #00a1e9; COLOR: #fff
}
.dateTable TABLE .othergameday {
	BACKGROUND: #F98943; COLOR: #fff
}
.dayinfo {
	Z-INDEX: 99; POSITION: absolute; WIDTH: 229px; COLOR: #000
}
.dayinfo UL {
	PADDING-BOTTOM: 5px; PADDING-LEFT: 10px; PADDING-RIGHT: 10px; BACKGROUND: url(/internet/DayPlan/dayinfo_bk.gif); PADDING-TOP: 0px
}
.dayinfo LI {
	BACKGROUND: url(/internet/DayPlan/dayinfo_libk.gif) repeat-x 50% bottom;
}
.dayinfo IMG {
	DISPLAY: block
}
.dateTable {
	POSITION: relative
}
.top1 {
	TOP: 50px
}
.top2 {
	TOP: 78px
}
.top3 {
	TOP: 107px
}
.top4 {
	TOP: 136px
}
.top5 {
	TOP: 164px
}
.top6 {
	TOP: 193px
}
</STYLE>

	<SCRIPT>
		function toopenwindow(){
		 	var d = new Date(); 		 	
			var now=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
			window.open("http://app.gzswdx.gov.cn/internet/teachWorkManage.prNetCenter.centerTaskList.do?input/degree=0&input/BeginDate="+now+"&input/EndDate="+now);
		}
	</SCRIPT>
	</head>
	<BODY>
		<DIV id=curDateStrBox class=dateTop></DIV>
		<DIV id=msgbox class=dateTable>
			<!--<DIV style="DISPLAY: none" class=dayinfo><IMG alt=信息顶部 src="/internet/DayPlan/dayinfo_top.gif"><UL>
					<LI>08:00 NBA常规赛 凯尔特人VS马刺</LI>
					<LI>10:30 NBA常规赛 小牛VS湖人</LI>
			</UL><IMG alt=信息底部 src="/internet/DayPlan/dayinfo_bot.gif"></DIV>-->
			<%org.w3c.dom.Document dom = reqContext.getDocument();
		NodeList all = dom.getElementsByTagName("day");
		List list=new ArrayList();
		for (int i = 0; i < all.getLength(); i++) {
			out.print("<DIV style=\"DISPLAY: none;\" class=\"dayinfo\"><IMG alt=信息顶部 src=\"/internet/DayPlan/dayinfo_top.gif\"><UL>");
			int itemcount = 0;
			Node mm = all.item(i);
			NodeList t = mm.getChildNodes();

			if (t.getLength() != 0)
			{
				System.out.println(t.getLength());
				for (int j = 0; j < t.getLength(); j++) {
					//取第一个实体的记录;
					NodeList ca = t.item(j).getChildNodes();
					String work_time = "";//提醒时间;
					String task_sum = "";//摘要;
					String pid = "";//序列号;
					String anMan = "";//日程安排人;
					String createDate = "";//建立日期;
					String type = "";
					String beginTime="";
					String imgPath = "";
					String content="";
					for (int k = 0; k < ca.getLength(); k++) {
						if (ca.item(k).getNodeName().equals("USERID"))
							userID = ca.item(k).getFirstChild().getNodeValue();
						if (ca.item(k).getNodeName().equals("beginTime")){
							beginTime = ca.item(k).getFirstChild().getNodeValue();
							beginTime=beginTime.substring(beginTime.indexOf(" ")+1);
							beginTime=beginTime.substring(0,beginTime.indexOf(":00.0"));
						}
						if (ca.item(k).getNodeName().equals("CALENDAR")){
							createDate = ca.item(k).getFirstChild()
									.getNodeValue();
							String tmp=createDate.substring(createDate.lastIndexOf(".")+1);
							boolean flag=false;
							for(int x=0;x<list.size();x++){
								if(list.get(x).toString().equals(tmp)){
									flag=true;
									break;
								}
							}
							if(!flag)
								list.add(tmp);
						}
						if (ca.item(k).getNodeName().equals("TASKCONTENT"))
							content = ca.item(k).getFirstChild()
									.getNodeValue();
						if (ca.item(k).getNodeName().equals("AWOKETIME"))
							work_time = ca.item(k).getFirstChild()
									.getNodeValue();
						if (ca.item(k).getNodeName().equals("ScheduleID"))
							pid = ca.item(k).getFirstChild().getNodeValue();
						if (ca.item(k).getNodeName().equals("type"))
							type = ca.item(k).getFirstChild().getNodeValue();
						if (ca.item(k).getNodeName().equals("TASKSUM"))
							if (ca.item(k).getFirstChild() != null)
								task_sum = ca.item(k).getFirstChild()
										.getNodeValue();
							else
								task_sum = "";
					}
					///
					//String tempStr=((begin_time+ "－" + end_time).length()>11)?((begin_time+ "－" + end_time).substring(0,11)):((begin_time+ "－" + end_time));		
					String temp1[] = work_time.split(" ");
					String tempStr = temp1[1].substring(0, 5);
					//String task = (task_sum.length() > 6) ? ((String) (task_sum).substring(0, 6) + ".."): (task_sum);
					String task = task_sum;
					if (type.trim() == "1" || type.trim().equals("1")) {
						imgPath = "/internet/images/jiaoxue.gif";
					} else {
						imgPath = "/internet/images/rili.gif";
					}
					//out.print("<LI style='background-position:top;text-align:left;background-image:url("+imgPath+");background-repeat: no-repeat;'>&nbsp;&nbsp;&nbsp;"+beginTime+" ("+task+")"+content+"</LI><LI style=\"list-style:none;height:2px;line-height:2px\"></LI>");
					out.print("<LI><font color=\"#BD0110\"><b>"+task+"</b></font>("+beginTime+")"+content+"</LI>");
					if (itemcount < 1) {
						itemcount++;
					}
				}
			}
			out.println("</UL><IMG alt=信息底部 src=\"/internet/DayPlan/dayinfo_bot.gif\"></DIV>");

		}
	%></DIV>
		<SCRIPT>(function() {
                          var infobox = $("msgbox").getElementsByTagName("div");
                          var solarMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
                          function solarDays(y, m) {
                              if (m == 1)
                                  return (((y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0)) ? 29 : 28);
                              else
                                  return (solarMonth[m]);
                          }
                          var curDateStrBox = $('curDateStrBox');
                          var d = new Date();
                          var mm = d.getMonth();
                          var yyyy = d.getFullYear();
                          //var mm = 6;
                          //var yyyy = 2011;
                          var week0 = new Date(yyyy, mm, 1).getDay();
                          curDateStrBox.innerHTML = (mm + 1) + '<img src="/internet/DayPlan/date_pic.gif" alt="工作日历" width="125" height="31" />';
                          var htmlx = '<table style="width:442px;height:200px;" cellspacing="12" id="calendarBox"><tr class="week"><td style="">日</td><td>一</td><td>二</td><td>三</td><td>四</td><td>五</td><td>六</td></tr>';
                          //var htmlx = '<table style="width:900px;height:600px;" cellspacing="12" id="calendarBox"><tr class="week"><td style="">日</td><td>一</td><td>二</td><td>三</td><td>四</td><td>五</td><td>六</td></tr>';
                          var ddTemp = 0;
                          var nullday = -1;
                          var left = ["25px", "88px", "151px", "214px", "167px", "142px", "205px"];
                          var top = ["top1", "top2", "top3", "top4", "top5", "top6"];
                          for (var j = 0; j < 6; j++) {
                              htmlx += '<tr>';
                              for (var i = 0; i < 7; i++) {
                                  if ((j == 0 && i < week0) || ddTemp >= solarDays(yyyy, mm)) {
                                      htmlx += '<td></td>';
                                      nullday = -1;
                                  } else {
                                      var dd = ++ddTemp;
                                      if (dd == d.getDate()) {
                                      //if (dd == 11) {
                                          htmlx += '<td class="gameday"><span style="cursor:pointer" onclick="toopenwindow()">' + dd + '</span></td>';
                                      } else {
                                      	  if(false<%
                                      	  	for(int x=0;x<list.size();x++){
                                      	  		out.print("||dd=="+list.get(x));
                                      	  	}
                                      	  %>){
                                      	  	htmlx += '<td class="othergameday"><span style="cursor:pointer;" onclick="toopenwindow()">' + dd + '</span></td>';
                                      	  }else{
                                          	htmlx += '<td><span style="cursor:pointer" onclick="toopenwindow()">' + dd + '</span></td>';
                                          }
                                      }
                                      var boxday = ++nullday;
                                      if (boxday >= 0) {
                                          infobox[boxday].getElementsByTagName("img")[0].src = "/internet/DayPlan/dayinfo_top_r.gif";
                                          infobox[boxday].setAttribute("class", top[j] + " dayinfo");
                                          infobox[boxday].setAttribute("className", top[j] + " dayinfo");
                                          infobox[boxday].style.left = left[i];
                                          if (i == 4) {
                                              infobox[boxday].getElementsByTagName("img")[0].src = "/internet/DayPlan/dayinfo_top.gif";
                                          }
                                          if (i == 5 || i == 6) {
                                              infobox[boxday].getElementsByTagName("img")[0].src = "/internet/DayPlan/dayinfo_top_l.gif";
                                          }
                                      }
                                  }
                              }
                              htmlx += '</tr>';
                          }
                          $('msgbox').innerHTML += htmlx + "</table>";
                          var tc_76 = new TabControl();
                          tc_76.addRange($("calendarBox").getElementsByTagName("span"), $("msgbox").getElementsByTagName("div"));
                          tc_76.triggerType = 'mouseover';
                          tc_76.enableSlide = false;
                          tc_76.defaultPage = d.getDate() - 1;
                          //tc_76.defaultPage = 11 - 1;
                          tc_76.init();
                          var alldiv = $("msgbox").getElementsByTagName("div");
                          for (var k = 0; k < alldiv.length; k++) {
                              alldiv[k].getElementsByTagName("ul")[0].onmouseout = function() {
                                  this.parentNode.style.display = "none";
                              }
                          }
                      })();</SCRIPT>
	</BODY>
</HTML>
<SCRIPT>
	window.scrollTo(0,9999999);
</SCRIPT>
