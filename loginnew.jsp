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
<title>LOGIN</title>
</head>
<body>
<%
try
{
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
     Connection con=null;
     int count=0;
     ResultSet rs= null;
     String dbUrl="jdbc:ucanaccess://C:\\Users\\Aashi Jain\\Desktop\\projectadjava.accdb";
     con= DriverManager.getConnection(dbUrl);
     Statement stmt= con.createStatement();
     String us=request.getParameter("Username");
     String pwd= request.getParameter("Password");
     String check="SELECT * FROM user WHERE USERNAME='"+us+"' AND PASSWORD='"+pwd+"' ";
     rs=stmt.executeQuery(check);
     while(rs.next())
     {count++;}
    	 //String redirectURL1 = "index.html";
         //response.sendRedirect(redirectURL1);
         
        // HttpSession s=request.getSession(true);
         //s.setAttribute("user",us);
          //String s1=rs.getString("role");
           //if(s1.equals("cust"))
        	   if(count>0)
        	   {

                   request.getSession();    
                  session.setAttribute("session",us);
           RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
        rd.forward(request,response);
          //PrintWriter out=response.getWriter();  
    	      }
     else
     {
    	// String redirectURL2 = "file:///G:/web/contact.html";
         //response.sendRedirect(redirectURL2);
   	 RequestDispatcher rd= request.getRequestDispatcher("contactusnew.jsp");
         rd.forward(request,response);
     }
         //int i=ps.executeUpdate();
     rs.close();
     stmt.close();
     con.close(); 
}
 catch(Exception ex)
     { out.println(ex);
     ex.printStackTrace();
     }%>
</body>
</html>