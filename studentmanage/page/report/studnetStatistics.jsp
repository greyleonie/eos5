
<%@ page language="java" contentType="image/jpeg;charset=GB2312" import="java.util.*,java.awt.*,java.awt.geom.*" 
import="java.awt.image.*,com.sun.image.codec.jpeg.*"%>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">

<html>
<body>
<%
  int width=600,height=500;
   BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
   Graphics g=image.getGraphics();
   Graphics2D g2d=(Graphics2D) g;
   g.setColor(new Color(236,233,216));
   g.fillRect(0,0,width,height);
   g.setColor(Color.white);
   g.drawRect(10,35,width-21,height-47);
   g.setColor(Color.black);
   g.drawRect(10,35,width-20,height-46);
   
   g.setColor(Color.black);
   g.setFont(new Font("经典繁淡古",Font.PLAIN,22));
   g.drawString("中共广州市委党校（广州行政学院）班级基本情况统计表",15,25);
   int book_sales[]=new int[5];
   
   for(int i=0;i<book_sales.length;i++){
      book_sales[i]=1+(int)(Math.random()*100);
   }
   String book_title[]={"男学员","女学员"};
   Color color[]=new Color[5];
   
   color[0]=new Color(99,99,0);
   color[1]=new Color(255,169,66);
  
   g.setFont(new Font("简体",Font.BOLD,16));
   g.drawString("班级百分率（%）",20,50);
   g.drawString("学员",500,465);
   g.setFont(new Font("SansSerf",Font.PLAIN,12));
   int salesValue=0;
   for(int i=418;i>0;i-=38){
      g.setColor(Color.lightGray);
      g.drawLine(80,(i+27),520,(i+27));
      salesValue+=10;
      
    }
    g.setColor(Color.black);
    g.drawLine(80,40,80,445);
    g.drawLine(80,445,550,445);
    int drawHigh=0;
    
    for(int i=0;i<book_title.length;i++){
       g.setColor(color[i]);
       drawHigh=(int)(Math.ceil(book_sales[i]*3.8));
       g.fill3DRect(110+i*80,445-drawHigh,50,drawHigh,true);
       g.setColor(Color.black);
       g.drawString(book_title[i],110+i*80,465);
    }
   g.dispose();
   ServletOutputStream sos=response.getOutputStream();
   JPEGImageEncoder encoder=JPEGCodec.createJPEGEncoder(sos);
   encoder.encode(image);

%>
</body>
</html>