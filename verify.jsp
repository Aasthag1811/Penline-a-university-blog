 <%@page import="java.sql.*"%>
 <%@page import="java.util.*"%>
 <%@page import="java.io.*"%>
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.DriverManager"%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%String us=(String)session.getAttribute("name");
 String pwd=(String)session.getAttribute("password");
 int uid =(Integer)session.getAttribute("uid");
 String eid=(String)session.getAttribute("eid");
 int r=(Integer)session.getAttribute("random");
 Connection con=null;
 Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
 String dbUrl="jdbc:ucanaccess://C:\\Users\\Aashi Jain\\Desktop\\projectadjava.accdb";
 con= DriverManager.getConnection(dbUrl);	
String r1=request.getParameter("otp");
int r2=Integer.parseInt(r1);
if(r2==r)
 { PreparedStatement ps=con.prepareStatement("insert into user(USERNAME , PASSWORD, UNIQUEID) values(?,?,?)");
     ps.setString(1,us);
     ps.setString(2,pwd);
     ps.setInt(3,uid);
     int i=ps.executeUpdate();  
     session.setAttribute("session",us);   
     RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
     rd.forward(request,response);}
else
{ RequestDispatcher rd= request.getRequestDispatcher("contactusnew.jsp");
rd.forward(request,response);
	
}
%>
</body>
</html>