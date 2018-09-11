<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<%String oldp=request.getParameter("oldp");
String newp=request.getParameter("newp"); 
String uid=request.getParameter("uid"); 
Connection con=null;
int count=0;
ResultSet rs= null;
ResultSet rs11= null;
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
String dbUrl="jdbc:ucanaccess://C:\\Users\\Aashi Jain\\Desktop\\projectadjava.accdb";
con= DriverManager.getConnection(dbUrl);	
String check="SELECT * FROM user WHERE UNIQUEID='"+uid+"' AND PASSWORD='"+oldp+"' ";
PreparedStatement ps1= con.prepareStatement(check);
rs=ps1.executeQuery();
while(rs.next())
{count++;}
if(count>0)
{
	 String s11=" UPDATE user SET PASSWORD ='"+newp+"' WHERE UNIQUEID='"+uid+"' ";
     PreparedStatement ps11= con.prepareStatement(s11);
     int j= ps11.executeUpdate();
     RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
     rd.forward(request,response);
}
else
{
	%>
	<%="cant change" %>
<% }%>

%>

</body>
</html>