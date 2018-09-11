 <%@page pageEncoding="UTF-8"%> 
 <%@page import="java.sql.*"%>
 <%@page import="java.util.*"%>
 <%@page import="java.io.*"%>
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.DriverManager"%>
 <%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>sign up here</title>
</head>
<body>
<%! public static void send(String from,String password,String to,String sub,String msg){  
    //Get properties object    
    Properties props = new Properties();    
    props.put("mail.smtp.user", "jainaashi1998.ja@gmail.com");
    props.put("mail.smtp.host", "aashi1998");
    props.put("mail.smtp.host", "smtp.gmail.com");    
    props.put("mail.smtp.starttls.enable","true");
    props.put("mail.smtp.socketFactory.port", "465");    
    props.put("mail.smtp.socketFactory.class",    
              "javax.net.ssl.SSLSocketFactory");    
    props.put("mail.smtp.auth", "true");    
    props.put("mail.smtp.port", "465");    
    //get Session   
    Session session = Session.getInstance(props,    
     new javax.mail.Authenticator() {    
     protected PasswordAuthentication getPasswordAuthentication() {    
     return new PasswordAuthentication("jainaashi1998.ja@gmail.com","aashi1998");  
     }    
    });    
    //compose message    
    try {    
     MimeMessage message = new MimeMessage(session);    
     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
     message.setSubject(sub);    
     message.setText(msg);    
     //send message  
     Transport.send(message);    
     System.out.println("message sent successfully");    
    } catch (MessagingException e) {throw new RuntimeException(e);}    
       
}  
   %>
<%

   try
     {
     Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
          Connection con=null;
          int count=0,f=0;
          ResultSet rs= null;
          String dbUrl="jdbc:ucanaccess://C:\\Users\\Aashi Jain\\Desktop\\projectadjava.accdb";
          con= DriverManager.getConnection(dbUrl);
          Statement stmt= con.createStatement();
          String us=request.getParameter("name");
          String pwd=request.getParameter("password");
          int uid =Integer.parseInt(request.getParameter("unique"));
          String eid=request.getParameter("eid");
          session.setAttribute("name",us);
          session.setAttribute("password",pwd);
          session.setAttribute("uid",uid);
          session.setAttribute("eid",eid);
          String check="SELECT * FROM table1 WHERE uniqueid='"+uid+"' AND fname='"+us+"' AND Emailid='"+eid+"'";
          rs=stmt.executeQuery(check);
          int r=0;
          Random rand = new Random();
          
          // Generate random integers in range 0 to 999
          r = rand.nextInt(1000);
          String r1=Integer.toString(r);
          String result="";
          while(rs.next())
          {count++;}
       
          if(count>0)
          {send("jainaashi1998.ja@gmail.com","aashi1998",eid,"OTP FOR PENLINE",r1);
        	
          
          // Recipient's email ID needs to be mentioned.
        //  String to = eid;

          // Sender's email ID needs to be mentioned
          //String from = "aasthag1811@gmail.com";
          // Assuming you are sending email from localhost
          //String host = "localhost";
          // Get system properties object
          //Properties properties = System.getProperties();

          // Setup mail server
          //properties.setProperty("mail.smtp.host", host);

          // Get the default Session object.
          //Session mailSession = Session.getDefaultInstance(properties);

          //try {
             // Create a default MimeMessage object.
            // MimeMessage message = new MimeMessage(mailSession);
             
             // Set From: header field of the header.
            // message.setFrom(new InternetAddress(from));
             
             // Set To: header field of the header.
             //message.addRecipient(Message.RecipientType.TO,
               //                       new InternetAddress(to));
             // Set Subject: header field
             //message.setSubject("OTP FOR PENLINE"); 
             // Now set the actual message
             //message.setText("YOUR OTP IS "+r);
             
             // Send message
            // Transport.send(message);
             //result = "Sent message successfully....";
          //} catch (MessagingException mex) {
        	//  result = "Sent message unsuccessfully....";
            // mex.printStackTrace();
          //}
       
   // PreparedStatement ps=con.prepareStatement("insert into user(USERNAME , PASSWORD, UNIQUEID) values(?,?,?)");
     //ps.setString(1,us);
     //ps.setString(2,pwd);
     //ps.setInt(3,uid);
     //int i=ps.executeUpdate();  
      session.setAttribute("random",r);
     
          }
       
          else
          {
         	// String redirectURL2 = "file:///G:/web/contact.html";
              //response.sendRedirect(redirectURL2);
        	 RequestDispatcher rd= request.getRequestDispatcher("contactusnew.jsp");
              rd.forward(request,response);
          }
            %>        
          <form action="verify.jsp" method="get">
			 <input type="text" name="otp" placeholder=" Enter your OTP sent to your email"  required/>
			  <input type="submit" value="verify"/>
			 </form>
    <%  /*Set 
     the Update query command */ 
     //if(i!=0)
     //{ response.sendRedirect("index.jsp?msg=Thank You for registering with us in Mrbool !"); } 
    // else 
     //{ response.sendRedirect("registerinsert.jsp?msg=Insertion Failed!! Please try again!!! "); } 
    rs.close();
     stmt.close();
     con.close();} 
     catch(Exception ex)
     { out.println(ex); } %>
</body>
</html>