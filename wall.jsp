 <%@page pageEncoding="UTF-8"%> 
 <%@page import="java.sql.*"%>
 <%@page import="java.util.*"%>
 <%@page import="java.io.*"%>
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<title>Blogging Website</title>
	<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Personal Blog Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"
	/>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Oswald:100,400,300,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,300italic' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
		  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<!--end slider -->
		<!--script-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<!--/script-->
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
				});
			});
</script>
<!---->

</head>
<body>
<% 
int postid[]= new int[1000];	
int id=0;
String name=null;
			        	String post[] = new String[1000];
			        	int i=0;
int uniqueid[]=new int[1000];
String postdata[]=new String[1000];
int comm[]=new int[1000];
Connection con=null;
int count=0;
ResultSet rs= null;
ResultSet rs1= null;


			        	  
		%>
<!---header---->

<div class="header">
	 <div class="container">
		  <div class="logo">
			  <a href="index.jsp"><img src="images/newlogo.gif" title="" /></a>
		  </div>
			 <!---start-top-nav---->
			 <div class="top-menu">
				  <span class="menu"> </span>
				   <ul>
						<li class="active"><a href="wall.jsp"><font size="16">WALL</font></a></li>
						<div class="clearfix"> </div>
				 </ul>
			 </div>
			 <div class="clearfix"></div>
					<script>
					$("span.menu").click(function(){
					$(".top-menu ul").slideToggle("slow" , function(){
					});
					});
					</script>
				<!---//End-top-nav---->
	 </div>
	 <%
try
{
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
     String dbUrl="jdbc:ucanaccess://C:\\Users\\Aashi Jain\\Desktop\\projectadjava.accdb";
     
     con= DriverManager.getConnection(dbUrl);	 
	 String s1="SELECT * FROM Post";
	 PreparedStatement ps3=con.prepareStatement(s1);
            rs = ps3.executeQuery();
      
      while (rs.next()) {
    	postid[i]=rs.getInt("POSTID"); 
    	post[i]=rs.getString("TITLE");
    	postdata[i]=rs.getString("Postdata");
    	uniqueid[i]=rs.getInt("UNIQUEID");
    	comm[i]=rs.getInt("COMMENTS");
      i++;
      }
for(int x=0;x<i;x++)
{
for(int y=0; y<(i-x);y++)
{
if(postid[y]<postid[y+1])
{int temp;
temp=postid[y];
postid[y]=postid[y+1];
postid[y+1]=temp;


temp=uniqueid[y];
uniqueid[y]=uniqueid[y+1];
uniqueid[y+1]=temp;

String temp1=null;
temp1=post[y];
post[y]=post[y+1];
post[y+1]=temp1;	  


temp1=postdata[y];
postdata[y]=postdata[y+1];
postdata[y+1]=temp1;

temp=comm[y];
comm[y]=comm[y+1];
comm[y+1]=temp;
}}}}
	 catch(Exception ex)
     { out.println(ex); }
	 	  
for(int e=0; e<i;e++)
	{ 
    	String abc="SELECT USERNAME FROM user WHERE UNIQUEID=?";
	 PreparedStatement ps3=con.prepareStatement(abc);
     ps3.setInt(1,uniqueid[e]);
     rs1 = ps3.executeQuery();
		
     while (rs1.next()) { 
      name = rs1.getString("USERNAME");
              }
     
     %>
	 </div>
<!--/header-->
<div class="content">
	 <div class="container">
		 <div class="content-grids">
			 <div class="col-md-8 content-main">
				 <div class="content-grid"><h2><insert><%=name%></insert></h2>
					 <div class="content-grid-info">
		         			
						 <div class="post-info">
						 
						 <h2><a href=<%= "\"Single.jsp?POSTTITLE="+post[e]+"\"" %> ><%=post[e]%></a> </h2>
						 <p><b><%=postdata[e] %></b></p> 
						 </div>
					 </div>
					 <div class="content-form">
					<form action="question.jsp" >
			<br> <h6>POST NO-<input type="text" style="width:100px; " value="<%= postid[e] %>" name="postid"/></h6>
                       			
				<% if(comm[e]==1)
					{%>
					 <h3>Leave a comment</h3>
						<textarea style="width:500px; height:100px;" placeholder="Write a Comment" name="question" ></textarea>
						<input type="submit" value="COMMENT"/><%} %>
						
				   </form>
				 		</div>

				 </div>
			  </div>
			  <div class="clearfix"></div>
		  </div>
	  </div>
</div>
<%} 
rs1.close();
%>
<!---->
<div class="footer">
	 <div class="container">
	 <p>Copyrights © Mody University</p>
	 </div>
</div>