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

  public final static String CURRENT_TAG = "currentPage";//��ǰҳ��
  public final static String PAGINATION_ACTION_TAG = "paginationAction";//�������
  public final static String FIRST_ACTION = "First";//ִ��������һҳ����
  public final static String NEXT_ACTION = "Next";//ִ��������һҳ����
  public final static String PREVIO_ACTION = "Previo";//ִ��������һҳ����
  public final static String LAST_ACTION = "Last";//ִ��������һҳ����
  public final static String GOTO_PAGE_ACTION = "gotoPage";//ִ������ָ����ĳһҳ����
  public final static String PAGES_GOTO = "pageSelect";//ִ��goto����ʱ,�û���ָ����ҳ��
  //start��ʾ��ǰҳ��ʼ�ļ�¼����,�������������totalCount���Ե�
  //һ����˵,start=ÿҳ����*(��ǰҳ��-1)
  //start��indexΪ0;Ҳ����˵,��start=10ʱ,Ϊ��11�м�¼
  private int start;
  private int end;//��ǰҳ�����ļ�¼����
  private int totalCount;//������
  private int rowsPerPage;//ÿҳ����
  private int currentPage;//��ǰҳ��
  private String orderByFields;//������ֶ�,��hsql�е�order by �ֶ�1,�ֶ�2
  private String orderType;//�ǽ���(desc)��������(asc)
  private List data = null;
  private final static int DefPageRows=10; //Ĭ������
  public Pagination() {
    start = 0;
    end = 0;
    try{
        rowsPerPage = DefPageRows;
    }catch(Exception e){
        System.out.println("Pagination���ڹ���ÿҳ��¼������");
        e.printStackTrace();
    }
    currentPage = 1;
    orderByFields="";
    orderType="";
    this.totalCount = 0;
  }
  //���캯��1,����һ�ι��������õ�,
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
  //��ִ�з�ҳ����ʱ�õ�;��ʱ���캯�����ִ�й���
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
   //������һҳ
   public void firstPage(){
       currentPage = 1;
   }
   //������һҳ
   public void nextPage(int iCurrent){
        currentPage = iCurrent + 1;
        if(currentPage * rowsPerPage > totalCount){
          lastPage();
        }
    }
    //������һҳ
    public void previoPage(int iCurrent){
       currentPage = iCurrent - 1;
       if(currentPage <= 0)
           firstPage();
   }
    //�������һҳ
   public void lastPage(){

        if(totalCount % rowsPerPage == 0){
          currentPage = totalCount / rowsPerPage;
        }
        else{
          currentPage = totalCount / rowsPerPage + 1;
        }
    }
    //����ָ����ĳһҳ
    protected void gotoPage(int pageNumber){
        if(pageNumber <= 1 || (pageNumber > 1 && getTotalCount() <this.getRowsPerPage()))
            firstPage();
        else if(pageNumber * rowsPerPage >= totalCount)
            lastPage();
        else
            currentPage = pageNumber;
    }
    //���õ�ǰҳ�����һ�е����������е�����,
    public void setEnd(int end){
        this.end = end;
    }
    //�õ���ǰҳ�����һ�е����������е�����,
    public int getEnd(){
       if(rowsPerPage * currentPage > totalCount)
           end = totalCount;
       else
           end = rowsPerPage * currentPage;
       return end;
   }
   //����������
   public void setTotalCount(int totalCount){
        this.totalCount = totalCount;
    }
    //�õ�������
    public int getTotalCount(){
        return totalCount;
    }
    //����ÿҳ����
    public void setRowsPerPage(int rowsPerPage){
       this.rowsPerPage = rowsPerPage;
   }
   //�õ�ÿҳ����
   public int getRowsPerPage(){
       return rowsPerPage;
   }
 //�õ���ҳ��
   public int getPages(){
       if(totalCount % rowsPerPage == 0)
           return totalCount / rowsPerPage;
       else
           return totalCount / rowsPerPage + 1;
   }
   //�ж��ܷ񵽵�һҳ;ֻҪ�ܵ���һҳ���϶����е�һҳ.
   public boolean firstEnable(){
       return previoEnable();
   }
   //�ж��ܷ����һҳ��ֻҪ����һҳ���Ϳ϶������һҳ.
   public boolean lastEnable(){
       return nextEnable();
   }
   //�ж��ܷ���һҳ
   public boolean nextEnable(){
       return currentPage * rowsPerPage < totalCount;
   }
   //�ж��ܷ���һҳ
   public boolean previoEnable(){
       return currentPage > 1;//ֻҪ���ǵ�һҳ�����ܵ���һҳ
   }
   //�õ���ǰҳ��
   public int getCurrentPage(){
        return currentPage;
    }
   //���õ�ǰҳ��
    public void setCurrentPage(int currentPage){
        this.currentPage = currentPage;
    }
    //�õ���ǰҳ������
    public List getData() {
      return data;
    }
    //���õ�ǰҳ������
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
