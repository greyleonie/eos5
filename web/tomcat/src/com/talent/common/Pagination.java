package com.talent.common;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;




public class Pagination implements Serializable{

  public final static String CURRENT_TAG = "currentPage";//当前页数
  public final static String PAGINATION_ACTION_TAG = "paginationAction";//缓存操作
  public final static String FIRST_ACTION = "First";//执行跳到第一页操作
  public final static String NEXT_ACTION = "Next";//执行跳到下一页操作
  public final static String PREVIO_ACTION = "Previo";//执行跳到上一页操作
  public final static String LAST_ACTION = "Last";//执行跳到最一页操作
  public final static String GOTO_PAGE_ACTION = "gotoPage";//执行跳到指定的某一页操作
  public final static String PAGES_GOTO = "pageSelect";//执行goto操作时,用户所指定的页数
  //start表示当前页开始的记录行数,此行数是相对于totalCount而言的
  //一般来说,start=每页行数*(当前页数-1)
  //start的index为0;也就是说,当start=10时,为第11行记录
  private int start;
  private int end;//当前页结束的记录行数
  private int totalCount;//总行数
  private int rowsPerPage;//每页行数
  private int currentPage;//当前页数
  private String orderByFields;//排序的字段,即hsql中的order by 字段1,字段2
  private String orderType;//是降序(desc)还是升级(asc)
  private List data = null;
  private final static int DefPageRows=10; //默认行数
  public Pagination() {
    start = 0;
    end = 0;
    try{
        rowsPerPage = DefPageRows;
    }catch(Exception e){
        System.out.println("Pagination类在构造每页记录数出错！");
        e.printStackTrace();
    }
    currentPage = 1;
    orderByFields="";
    orderType="";
    this.totalCount = 0;
  }
  //构造函数1,当第一次构造它是用到,
  public Pagination(int totalCount) {
	  start = 0;
      end = 0;
      rowsPerPage = DefPageRows;
      currentPage = 1;
      orderByFields="";
      orderType="";
      this.totalCount = totalCount;
  }

  public Pagination(int totalCount,int numPerPage) {
      start = 0;
      end = 0;
      rowsPerPage = numPerPage;
      currentPage = 1;
      orderByFields="";
      orderType="";
      this.totalCount = totalCount;
}
  //当执行翻页动作时用到;此时构造函数早就执行过；
  public Pagination doPagination(String paginationAction, String currentPage){
       doPage(paginationAction,currentPage);
       return this;
   }

  public void doPage(HttpServletRequest request){
	  if(request.getParameter("totalCount")!=null)
		  try{
			  this.totalCount=Integer.parseInt(request.getParameter("totalCount"));
		  }
	  	  catch (Exception e) {}
	  String currentPage0=request.getParameter("currentPage");
	  if(request.getParameter("paginationAction")!=null&&request.getParameter("paginationAction").equals(GOTO_PAGE_ACTION))
		  currentPage0=request.getParameter("pageSelect");
	  doPage(request.getParameter("paginationAction"),currentPage0);
  }
  public void doPage(String paginationAction, String currentPage){
	  int iCurrent = 0;
      try{
        iCurrent = Integer.parseInt(currentPage);
      }catch(NumberFormatException e){
          iCurrent = getCurrentPage();
      }
      if(paginationAction != null){
          if(paginationAction.equals(FIRST_ACTION))
              firstPage();
          if(paginationAction.equals(NEXT_ACTION))
              nextPage(iCurrent);
          if(paginationAction.equals(PREVIO_ACTION))
              previoPage(iCurrent);
          if(paginationAction.equals(LAST_ACTION))
              lastPage();
          if(paginationAction.equals(GOTO_PAGE_ACTION)){
              gotoPage(iCurrent);
          }
      }
  }
  public int getStart(){
       start = rowsPerPage * (currentPage - 1);
       return start;
   }
   public void setStart(int start){
       this.start = start;
   }
   //跳到第一页
   public void firstPage(){
       currentPage = 1;
   }
   //跳到下一页
   public void nextPage(int iCurrent){
        currentPage = iCurrent + 1;
        if(currentPage * rowsPerPage > totalCount){
          lastPage();
        }
    }
    //跳到上一页
    public void previoPage(int iCurrent){
       currentPage = iCurrent - 1;
       if(currentPage <= 0)
           firstPage();
   }
    //跳到最后一页
   public void lastPage(){

        if(totalCount % rowsPerPage == 0){
          currentPage = totalCount / rowsPerPage;
        }
        else{
          currentPage = totalCount / rowsPerPage + 1;
        }
    }
    //跳到指定的某一页
    protected void gotoPage(int pageNumber){
        if(pageNumber <= 1 || (pageNumber > 1 && getTotalCount() <this.getRowsPerPage()))
            firstPage();
        else if(pageNumber * rowsPerPage >= totalCount)
            lastPage();
        else
            currentPage = pageNumber;
    }
    //设置当前页的最后一行的在总行数中的行数,
    public void setEnd(int end){
        this.end = end;
    }
    //得到当前页的最后一行的在总行数中的行数,
    public int getEnd(){
       if(rowsPerPage * currentPage > totalCount)
           end = totalCount;
       else
           end = rowsPerPage * currentPage;
       return end;
   }
   //设置总行数
   public void setTotalCount(int totalCount){
        this.totalCount = totalCount;
    }
    //得到总行数
    public int getTotalCount(){
        return totalCount;
    }
    //设置每页行数
    public void setRowsPerPage(int rowsPerPage){
       this.rowsPerPage = rowsPerPage;
   }
   //得到每页行数
   public int getRowsPerPage(){
       return rowsPerPage;
   }
 //得到总页数
   public int getPages(){
       if(totalCount % rowsPerPage == 0)
           return totalCount / rowsPerPage;
       else
           return totalCount / rowsPerPage + 1;
   }
   //判断能否到第一页;只要能到上一页，肯定就有第一页.
   public boolean firstEnable(){
       return previoEnable();
   }
   //判断能否到最后一页；只要有下一页，就肯定有最后一页.
   public boolean lastEnable(){
       return nextEnable();
   }
   //判断能否到下一页
   public boolean nextEnable(){
       return currentPage * rowsPerPage < totalCount;
   }
   //判断能否到上一页
   public boolean previoEnable(){
       return currentPage > 1;//只要不是第一页，就能到上一页
   }
   //得到当前页数
   public int getCurrentPage(){
        return currentPage;
    }
   //设置当前页数
    public void setCurrentPage(int currentPage){
        this.currentPage = currentPage;
    }
    //得到当前页的数据
    public List getData() {
      return data;
    }
    //设置当前页的数据
    public void setData(List data) {
      this.data = data;
    }
  public String getOrderType() {
    return orderType;
  }
  public void setOrderType(String orderType) {
    this.orderType = orderType;
  }
  public void setOrderByFields(String orderByFields) {
    this.orderByFields = orderByFields;
  }
  public String getOrderByFields() {
    return orderByFields;
  }
}
