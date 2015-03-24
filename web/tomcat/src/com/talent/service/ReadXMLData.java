package com.talent.service;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import com.talent.web.form.CourseAdjustForm;
//读取xml文件
public class ReadXMLData{

  public static  ArrayList readCourseAdjust(HttpServletRequest req,String fileName){
    ArrayList list=new ArrayList();
    FileInputStream fis=null;
    Document doc;
    DocumentBuilderFactory factory;
    DocumentBuilder docBuilder;

    try{
       String classId="";
       String className="";
       String adjustTime="";
       String noticeTime="";
       String adjustContent="";

       int countRecord=0;
       String path="";
       path=req.getRealPath("/");
       path+="/courseAdjust"+"/"+fileName;
       fis=new FileInputStream(path);
       factory = DocumentBuilderFactory.newInstance();
       factory.setValidating(false);
       docBuilder = factory.newDocumentBuilder();
       doc = docBuilder.parse(fis);

      NodeList nodeList = doc.getElementsByTagName("notice");
      if(nodeList!=null){
        countRecord=nodeList.getLength();
      }


      for(int i=0;i<countRecord;i++){
         Node child=nodeList.item(i);
         CourseAdjustForm form=new CourseAdjustForm();
         if(child.getNodeType()==Node.ELEMENT_NODE){//取出classId
           classId= child.getAttributes().getNamedItem("id").getNodeValue();
           className= child.getAttributes().getNamedItem("className").getNodeValue();
           adjustTime= child.getAttributes().getNamedItem("adjustTime").getNodeValue();
           adjustContent= child.getAttributes().getNamedItem("adjustContent").getNodeValue();
           noticeTime= child.getAttributes().getNamedItem("noticeTime").getNodeValue();
           form.setClassId(classId);
         }
    list.add(form);
      }
    }catch(Exception e){
      System.out.println("=======readCourseAdjust=========errors:"+e);
    }
    return list;
  }





}
