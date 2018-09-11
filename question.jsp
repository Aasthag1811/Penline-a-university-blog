<%@page pageEncoding="UTF-8"%> 
 <%@page import="java.sql.*"%>
 <%@page import="java.util.*"%>
 <%@page import="java.io.*"%>
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
     try { 
    	 String username=(String)session.getAttribute("session");
         
         //redirect user to login page if not logged in
         
    	 
      //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
     //Connection con=DriverManager.getConnection("jdbc:odbc:MS Access Database","","");
     /* Passing argument through the question mark */
    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
     Connection con=null;
     ResultSet rs= null;
     ResultSet rs1=null;
     int uniqueid=0;
     ResultSet rs20=null;
     String dbUrl="jdbc:ucanaccess://C:\\Users\\Aashi Jain\\Desktop\\projectadjava.accdb";
     con= DriverManager.getConnection(dbUrl);
     String myquestion = request.getParameter("question");
     int postid = Integer.parseInt(request.getParameter("postid"));
     
     String s5="SELECT UNIQUEID FROM user where USERNAME=?";
	 PreparedStatement ps5=con.prepareStatement(s5);
      ps5.setString(1,username);
      rs20 = ps5.executeQuery();
      
      while (rs20.next()) {
    	uniqueid=rs20.getInt("UNIQUEID"); 
    	
      

    PreparedStatement ps4=con.prepareStatement("insert into Question(POSTID,QUESTION,UNIQUEID) values(?,?,?)");
     ps4.setInt(1,postid);  
  ps4.setString(2,myquestion);
  ps4.setInt(3,uniqueid);
     int i=ps4.executeUpdate();   
     
      RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
     rd.forward(request,response);
           }
     }

catch(Exception ex)
{ out.println(ex); } 

%>
</body>
</html>