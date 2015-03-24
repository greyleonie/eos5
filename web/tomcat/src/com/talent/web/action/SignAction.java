package com.talent.web.action;

import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.talent.web.form.SignForm;
import com.talent.dao.student.SignDAO;
import javax.servlet.http.HttpSession;

import java.io.File;
import com.talent.web.form.ThesisForm;
import org.apache.struts.upload.FormFile;
import java.io.FileOutputStream;

import java.io.FileInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import com.talent.hibernate.Eosoperator;



public class SignAction extends DispatchAction{
  public ActionForward toSignPage(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,HttpServletResponse response)throws Exception{
  String specialID=request.getParameter("specialID");
  String subjectName=request.getParameter("subjectName");
  SignForm signForm=(SignForm)form;
  if(specialID.equals("")&&specialID!=null)
  signForm.setSpecialID(new Integer(specialID));
  request.setAttribute("subjectName",subjectName);
  request.setAttribute("signForm",signForm);
  return mapping.findForward("toSignPage");
  }

public ActionForward upload(ActionMapping mapping, ActionForm form,
          HttpServletRequest request,HttpServletResponse response)throws Exception{
String f=(String)request.getParameter("f");
System.out.println("================================f:"+f);
return mapping.findForward("load");
}
  
  public ActionForward save(ActionMapping mapping,ActionForm form,
                            HttpServletRequest request,HttpServletResponse response)throws Exception{
    SignForm signForm=(SignForm)form;
    SignDAO signDao=new SignDAO();
    String lastUserName="";
    String subjectId="";
    String currentUserName="";
    String currentSubjectId="";
    boolean result=false;
    HttpSession session=request.getSession();
    boolean canSave=true;
    currentUserName=signForm.getName();
    currentSubjectId=signForm.getSpecialID().toString();
   
    if(session.getAttribute("userName")!=null){
      lastUserName = (String) session.getAttribute("userName");
    }
    if(session.getAttribute("subjectId")!=null){
     subjectId = (String) session.getAttribute("subjectId");
   }
   if(subjectId.equals(currentSubjectId)&&lastUserName.equals(currentUserName)){//already save or not
      canSave=false;
   }
   if(canSave==true){
     result = signDao.saveSignInfo(signForm);
     session.setAttribute("userName",currentUserName);
     session.setAttribute("subjectId",currentSubjectId);
   }

    if(result==true){
       request.setAttribute("msg","个人信息提交成功！");
       return mapping.findForward("successPage");
    }else{
      String subjectName=request.getParameter("subjectName");
      String msg="个人信息提交失败！";;
      if(canSave==false){
        msg="你已经在专题\""+subjectName+"\"报了名，"+msg;
      }
        request.setAttribute("msg",msg);
        request.setAttribute("subjectName",subjectName);
        return mapping.findForward("toSignPage");
    }
  }

  public  ActionForward upLoadFile(ActionMapping mapping,ActionForm form,
                            HttpServletRequest request,HttpServletResponse response){
   try{
     ThesisForm sisForm=(ThesisForm)form;
     FormFile formFile=(FormFile)sisForm.getFile1();
     byte fileData[]= formFile.getFileData();
     FileOutputStream fos=null;
     String contextPath=request.getContextPath();
     String serverRealPath=request.getRealPath(contextPath);

    int index=serverRealPath.lastIndexOf("\\");
    String partPath="";
    if(serverRealPath!=null&&!serverRealPath.equals("")){
       partPath=serverRealPath.substring(0,index);
    }
    int len=fileData.length;
    fos=new FileOutputStream(partPath+"\\subjectCourse"+"\\"+formFile);
    fos.write(fileData,0,len);
    fos.close();
   }catch(Exception e){
    e.printStackTrace();
   }
       return null;
  }

  public ActionForward teachPlanInfo(ActionMapping map, ActionForm form,
                                      HttpServletRequest req,HttpServletResponse res){//��ʾ��ѧ�ƻ�
   try{
	  req.setCharacterEncoding("gb2312");
     String className="";
     int isAdd=0;
     className=req.getParameter("className");
     String realPath = req.getRealPath("/");
     File dir = new File(realPath + "\\teachPlan");
     File[] files = dir.listFiles();
    ArrayList classArray=new ArrayList();
    classArray.add("         ----选择---          ");
     int fileCounter=0;
     FileInputStream fis=null;
     File file=null;
     String content="";
     String str="";
     BufferedReader br=null;
     File targetFile=null;//������ʵ��ļ�
     Eosoperator user=(Eosoperator)req.getSession().getAttribute("user");
     Integer theType=user.getOperatorType();
     int userType=0;//Ĭ��Ϊ��ʦ
     if(theType!=null){
       userType=theType.intValue();
     }
   if(files!=null){
        fileCounter=files.length;

        for(int i=0;i<fileCounter;i++){
            file=(File)files[i];
            String curClassName=file.getName().substring(0,file.getName().indexOf("."));//ѭ��ȡ�����а༶
          if(userType==1){//�����ѧԱ
         if(className!=null&&!className.equals("")&&className.equals(curClassName)){//����İ༶��Ʋ�Ϊ��
                 targetFile=file;
                 classArray.add(new String(curClassName.getBytes("GBK")));
                 break;
           }
         if(classArray.size()==0)  classArray.add(new String(curClassName.getBytes("GBK")));
       }else if(userType==0){//����ǽ�ʦ
         if((className.equals("")||className==null)){//��һ�ν���
             classArray.add(new String(curClassName.getBytes("GBK")));
             if(targetFile==null)targetFile=file;
          }else{//���ǵ�һ�ν���
             classArray.add(new String(curClassName.getBytes("GBK")));
             if(className!=null&&!className.equals("")&&className.equals(curClassName)){//����İ༶��Ʋ�Ϊ��
                targetFile=file;
          }
          }
       }//else if
          }//for
        if(targetFile!=null){
          fis = new FileInputStream(targetFile);
        }
        if(fis!=null){
          br=new BufferedReader(new InputStreamReader(fis));
        }
        if(br!=null){
        while((str=br.readLine())!=null){
          content+=str;
        }
        }
     }//end if
     else{
    	 String msg="-----------";
    	 msg=new String(msg.getBytes("GBK"));
    	
            classArray.add(msg);
            isAdd++;
     }
 if(userType==0&&fileCounter==0&&isAdd==0){
	 String msg="-----------";
	 msg=new String(msg.getBytes("GBK"));
   classArray.add(msg);
 } 
     req.setAttribute("fileCounter",new Integer(fileCounter));
     req.setAttribute("classArray",classArray);//�༶
     req.setAttribute("content",content);//�����ļ�����
     req.setAttribute("className",className);//��ʾ�İ༶���

   }catch(Exception e){
     System.out.println("========teachPlanInfo=========errors:"+e);
   }
   System.out.println("===66");
   return map.findForward("planInfo");
 }

}
