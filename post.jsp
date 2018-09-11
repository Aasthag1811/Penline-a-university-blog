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
	 String username=(String)session.getAttribute("session");
      String o=new String("disabled");
      
    //redirect user to login page if not logged in
    
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
    String postd=request.getParameter("postdata");
    String mytitle=request.getParameter("title");
    String c=request.getParameter("com");
    if(c==null)
    {
    	c="a";
    }
    int a;
    if(c.compareTo(o)==0)
    {  
    	a=0;
    }
    else
    {
    	a=1;
     }
    
     Connection con=null;
     int userid= 0;
     ResultSet rs= null;
     String dbUrl="jdbc:ucanaccess://C:\\Users\\Aashi Jain\\Desktop\\projectadjava.accdb";
     con= DriverManager.getConnection(dbUrl);
     String selectuserid = "SELECT UNIQUEID FROM user WHERE USERNAME=?";
     PreparedStatement preparedStatement = con.prepareStatement(selectuserid);
          preparedStatement.setString(1,username);
          rs = preparedStatement.executeQuery();
          while (rs.next()) {
        		userid = rs.getInt("UNIQUEID");
                 PreparedStatement ps=con.prepareStatement("insert into Post(Postdata,UNIQUEID,TITLE,COMMENTS) values(?,?,?,?)");
     ps.setString(1,postd);
     ps.setInt(2,userid);
     ps.setString(3,mytitle);
     ps.setInt(4,a);
     int j=ps.executeUpdate();
          }
RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
rd.forward(request,response);
}
catch(Exception ex)
    { out.println(ex);
    ex.printStackTrace();
    }
 %>
</body>
</html>