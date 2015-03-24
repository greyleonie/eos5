package com.talent.common.tag;

import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import org.apache.struts.util.*;

import com.talent.common.Pagination;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: 南方科能</p>
 * @version 1.0
 */

public class WindyPaginationTag extends TagSupport{
   private final static String TABLE_TAG="<table width=\"90%\" style=\"font-size:12px;\" border=\"0\" cellspacing=\"3\" cellpadding=\"2\">";
   private final static String TABLE_END_TAG="</table>";
   private final static String TR_TAG="<tr>";
   private final static String TR_END_TAG="</tr>";
   private final static String TD_CENTER_TAG="<td nowrap width=\"45%\" align=\"center\">";
   private final static String TD_END_TAG="</td>";
   private final static String TD_RIGHT_TAG="<td nowrap width=\"55%\" align=\"right\">";
   private final static String HIDDEND_CURRENTPAGE="<input type=\"hidden\" name=\"currentPage\" value=";//没完成
   private final static String HIDDEND_TOTALCOUNT="<input type=\"hidden\" name=\"totalCount\" value=";//没完成
   private final static String HIDDEND_PAGINATION_ACTION="<input type=\"hidden\" name=\"paginationAction\" value=\"\">";

   protected boolean filter=true;//是否过滤html
   protected String name;//actionForm的名称
   protected String property;//pagination在actionForm中的变量
   private boolean order;
   public WindyPaginationTag() {
     order=true;
   }
   //组装String
   private String poplutateString() throws java.io.IOException,JspException{
     String enter ="\r\n";
     String empty="&nbsp&nbsp&nbsp";
     String context=((HttpServletRequest)pageContext.getRequest()).getContextPath();
     //定义变量----start
     //应该从system.properties中读
     String IMAGE_NO_FIRST = "<img src=\""+context+"/talent/images/First_no.gif\" alt=\"第一页\" width=\"18\" height=\"13\" border=\"0\">"; //efrom2应动态生成
     String    IMAGE_NO_NEXT = "<img src=\""+context+"/talent/images/Next_no.gif\" alt=\"下一页\" width=\"14\" height=\"13\" border=\"0\">"; //efrom2应动态生成
     String  IMAGE_NO_PERVIO = "<img src=\""+context+"/talent/images/Previous_no.gif\" alt=\"上一页\" width=\"14\" height=\"13\" border=\"0\">"; //efrom2应动态生成
     String IMAGE_NO_LAST = "<img src=\""+context+"/talent/images/Last_no.gif\" alt=\"最后一页\" width=\"18\" height=\"13\" border=\"0\">"; //efrom2应动态生成

     String IMAGE_FIRST = "<img src=\""+context+"/talent/images/First.gif\" alt=\"第一页\" width=\"18\" height=\"13\" border=\"0\">"; //efrom2应动态生成
     String     IMAGE_NEXT= "<img src=\""+context+"/talent/images/Next.gif\" alt=\"下一页\" width=\"14\" height=\"13\" border=\"0\">"; //efrom2应动态生成
     String  IMAGE_PERVIO= "<img src=\""+context+"/talent/images/Previous.gif\" alt=\"上一页\" width=\"14\" height=\"13\" border=\"0\">"; //efrom2应动态生成
     String IMAGE_LAST = "<img src=\""+context+"/talent/images/Last.gif\" alt=\"最后一页\" width=\"18\" height=\"13\" border=\"0\">"; //efrom2应动态生成
     //定义变量----end
     JspWriter out = pageContext.getOut();
     Pagination pagination = (Pagination)RequestUtils.lookup(pageContext, name, property, null);
     StringBuffer sb = new StringBuffer("");
     sb.append(TABLE_TAG+enter);
     sb.append(TR_TAG+enter);
     sb.append(TD_CENTER_TAG+enter);
     sb.append("当前第"+pagination.getCurrentPage()+"页 共"+pagination.getTotalCount()+"记录 分");
     sb.append(pagination.getPages()+"页显示"+enter);
     sb.append(TD_END_TAG+enter);
     sb.append(TD_RIGHT_TAG+enter);
     sb.append(HIDDEND_CURRENTPAGE+"\""+pagination.getCurrentPage()+"\">"+enter);
     sb.append(HIDDEND_TOTALCOUNT+"\""+pagination.getTotalCount()+"\">"+enter);
     sb.append(HIDDEND_PAGINATION_ACTION+enter);
     String submitHref = "<a href=\"javascript:this.document."+this.getName()+".submit()\"";
     submitHref+=" oncontextmenu=\"return false\"  onclick=\"this.document."+this.getName()+".paginationAction.value='"+pagination.FIRST_ACTION+"';\">";
     if(pagination.firstEnable())
       sb.append(submitHref+IMAGE_FIRST+"</a>"+empty+enter);
     else
       sb.append(IMAGE_NO_FIRST+empty+enter);
      if(pagination.previoEnable()){
        String pervioHref= submitHref.replaceFirst(".paginationAction.value='"+pagination.FIRST_ACTION+"';",".paginationAction.value='"+pagination.PREVIO_ACTION+"';");
        sb.append(pervioHref+IMAGE_PERVIO+"</a>"+empty+enter);
      }else
         sb.append(IMAGE_NO_PERVIO+empty+enter);
     if(pagination.nextEnable()){
       String nextHref= submitHref.replaceFirst(".paginationAction.value='"+pagination.FIRST_ACTION+"';",".paginationAction.value='"+pagination.NEXT_ACTION+"';");
       sb.append(nextHref+IMAGE_NEXT + "</a>" + empty + enter);
     }else
        sb.append(IMAGE_NO_NEXT+empty+enter);
      if(pagination.lastEnable()){
        String lastHref= submitHref.replaceFirst(".paginationAction.value='"+pagination.FIRST_ACTION+"';",".paginationAction.value='"+pagination.LAST_ACTION+"';");
        sb.append(lastHref+IMAGE_LAST + "</a>" + empty + enter);
      }else
          sb.append(IMAGE_NO_LAST+empty+enter);
     String myForm="this.document."+this.getName();
     sb.append("<a href=\"javascript:"+myForm+".submit()\"");
     sb.append(" oncontextmenu=\"return false\" onclick=\"if("+myForm+".pageSelect.value==''){ alert('页码必须输入');return false;}"+enter);
     sb.append(" else {"+myForm+".paginationAction.value='gotoPage';}\">前往</a>"+enter);
     sb.append("<input type=text size='4' onlytype='int' onfocus='checkTextBoxInput()' name='pageSelect' value=''/>页"+enter);
     sb.append(TD_END_TAG+enter+TR_END_TAG+enter+TABLE_END_TAG);
     return new String(sb);
   }
   public int doStartTag() throws JspException{
      JspWriter out = pageContext.getOut();
      try{
        out.print(this.poplutateString());
      }catch(java.io.IOException ie){
         ie.printStackTrace();
         throw new JspException("错误信息: 在处理翻页时出错");
       }
     return 0;
   }


    public void release(){
        super.release();
        filter = true;
        name = null;
        property = null;
    }




   //setter/getter
  public boolean isFilter() {
    return filter;
  }
  public void setFilter(boolean filter) {
    this.filter = filter;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public void setProperty(String property) {
    this.property = property;
  }
  public String getProperty() {
    return property;
  }
  public boolean isOrder() {
    return order;
  }
  public void setOrder(boolean order) {
    this.order = order;
  }
}

