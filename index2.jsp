<%@page pageEncoding="UTF-8"%> 
 <%@page import="java.sql.*"%>
 <%@page import="java.util.*"%>
 <%@page import="java.io.*"%>
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.DriverManager"%>
<html>
<% try{ 
	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con=null;
String dbUrl="jdbc:ucanaccess://C:\\Users\\Aashi Jain\\Desktop\\projectadjava.accdb";
con= DriverManager.getConnection(dbUrl);  
ResultSet rs16=null;
String s16=null; 
ResultSet rs17=null;
String s17=null;
int posti = Integer.parseInt(request.getParameter("postid1"));
s16="DELETE * FROM post WHERE postid=?";
PreparedStatement ps16=con.prepareStatement(s16);
ps16.setInt(1,posti);
int z= ps16.executeUpdate();
	s17="DELETE * FROM question WHERE postid=?";
	 PreparedStatement ps17=con.prepareStatement(s17);
	 ps17.setInt(1,posti);
	 int z1= ps17.executeUpdate();
	  RequestDispatcher rd1= request.getRequestDispatcher("index.jsp");
	     rd1.forward(request,response);
	 }
	 catch(Exception e){
		 System.out.print(e.getMessage());
		 }
 %> </html>


