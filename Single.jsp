 <%@page pageEncoding="UTF-8"%> 
 <%@page import="java.sql.*"%>
 <%@page import="java.util.*"%>
 <%@page import="java.io.*"%>
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.DriverManager"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<title>Penline</title>
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
<%String title=request.getParameter("POSTTITLE"); %>
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
						<li class="active"><font size="16"><%= title%></font></li>

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
</div>
<%

String s175=null;
String s1753=null;
String data=null;
int WhoAsked[]=new int[1000];
int whowroteit=0;
int postid=0;
String question[]=new String[100];
int i=0;
ResultSet rs2017=null;
String nameUser[]=new String[1000];
				 try { 
					  //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
				     //Connection con=DriverManager.getConnection("jdbc:odbc:MS Access Database","","");
				     /* Passing argument through the question mark */
				    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
				    Connection con=null;
		     	    String dbUrl="jdbc:ucanaccess://C:\\Users\\Aashi Jain\\Desktop\\projectadjava.accdb";
				    con= DriverManager.getConnection(dbUrl);
				 ResultSet rs20=null;
				 ResultSet rs201=null;
				 s175="SELECT * FROM Post WHERE TITLE=?";
				 PreparedStatement ps17=con.prepareStatement(s175);
		         ps17.setString(1,title);
		         rs20 = ps17.executeQuery();
		          		          while (rs20.next()) {
		        	 		        	data=rs20.getString("Postdata");
		        	postid=rs20.getInt("POSTID");
		        	whowroteit=rs20.getInt("UNIQUEID");
		        		          }		
	          		        s1753="SELECT * FROM Question WHERE POSTID=?";
		       				 PreparedStatement ps173=con.prepareStatement(s1753);
		       		         ps173.setInt(1,postid);
		   		             rs201 = ps173.executeQuery();
		   		             i=0;
		   		          		          while (rs201.next()) {
		   		        	    	question[i]=rs201.getString("QUESTION");
		   		        	    	WhoAsked[i]=rs201.getInt("UNIQUEID");
		   		        	i++;
	     }		
		   		          		          for(int l=0;l<i;l++)
		   		          		          {
		   		 String users="SELECT USERNAME FROM user WHERE UNIQUEID=?";
		   		PreparedStatement pstat=con.prepareStatement(users);
		         pstat.setInt(1,WhoAsked[l]);
		         rs2017 = pstat.executeQuery();
		          		          while (rs2017.next()) {
		          		        	  nameUser[l]=rs2017.getString("USERNAME");
		   		 
		 }}
				 }
    catch(Exception ex)
  { 
  ex.printStackTrace();
  }
%>
<!--/header-->
<div class="single">
	 <div class="container">
		  <div class="col-md-8 single-main">
			  <div class="single-grid">
					
					</br>
					<p><%= data %></p>
			  </div>
                          <div class="content-form">
                          
					 <h3>COMMENTS</h3>
					 <ul>
					 <% int j=0;
					 for(j=0;j<i;j++){%>
					 <li><%=nameUser[j]+" "+":"+" "+question[j]%></li><% }%>
					 </ul>
				 </div>
		  </div>
		  
				 		
				 <div class="clearfix"></div>
			  </div>
			  <div class="clearfix"></div>
		  </div>
	  </div>
</div>
 
<div class="content-form" style="width:25%; float:bottom;">
					  
					<form action="question.jsp" >
			
					<input type="hidden" style="width:100px;" value="<%= postid %>" name="postid"/>
                                      	 
					
					 <h3>Leave a comment</h3>
						<textarea style="width:500px; height:100px;" placeholder="Write a Comment" name="question" ></textarea>
						<input type="submit" value="COMMENT"/>
				   </form>
				 		</div>				 		
				 		
<!---->
<div class="footer">
	 <div class="container">
	 
	 <p>Copyrights © Mody University</p>
	 </div>
</div>