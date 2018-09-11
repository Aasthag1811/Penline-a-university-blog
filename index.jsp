<%@page pageEncoding="UTF-8"%> 
 <%@page import="java.sql.*"%>
 <%@page import="java.util.*"%>
 <%@page import="java.io.*"%>
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Penline-Profile</title>
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
<% String username= (String)session.getAttribute("session"); 
   int postid[]=new int[1000];
   int no=0;
   int c=0;
   int mypostid[]=new int[1000];
   String post[]=new String[1000];
   String postdata[]=new String[1000];
   String title[]=new String[1000];
   int quesno[]=new int[1000];
   String question[]=new String[1000];
   String usern[]=new String[1000];
   int i=0,j=0,k=0;
   int e=0;
   int COMMENTATOR[]=new int[1000];
   ResultSet rs= null;
   String POSTTITLE=null;
   ResultSet rs11= null;
   ResultSet rs111=null;
   if(username==null){
	   RequestDispatcher rd= request.getRequestDispatcher("contactusnew.jsp");
       rd.forward(request,response);
   }
for(int l=0;l<1000;l++)
  {
	  postid[l]=0;
	  mypostid[l]=0;
	  post[l]=" ";
	  postdata[l]=" ";
	  title[l]=" ";
	  quesno[l]=0;
	  question[l]=" ";
	  usern[l]=" ";
	  COMMENTATOR[l]=0;
  }
   
%>
<!---header---->
<div class="header">
	 <div class="container">
		  <div class="logo">
			  <a href="index.jsp"><img src="images/newlogo.gif" title="" /></a>
		  </div>
			 <!---start-top-nav---->
			 <div class="top-menu" style="width: 682px;">
				  <span class="menu"> </span>
				     <h3 style="text-align:rightmost;">WELCOME <%=username %></h3>
				     
				   
				     
				   <ul>
						<li class="active"><a href="index.jsp">MY PROFILE</a></li>
						<li><a href="wall.jsp">WALL</a></li>
						
							<li><a href="pass.jsp">CHANGE PASSWORD</a></li>
								<li><a href="http://www.modyuniversity.ac.in/">VISIT MU</a></li>
									<li><a href="https://exchange2013.modyuniversity.ac.in/owa/auth/logon.aspx?replaceCurrent=1&url=https%3a%2f%2fexchange2013.modyuniversity.ac.in%2fowa">WEBMAIL</a></li>
						<li><a href="contactusnew.jsp">LOGOUT</a></li>
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
<!--/header-->
<div class="content">
	 <div class="container">
		 <div class="content-grids">
			 <div class="col-md-8 content-main">
				 <div class="content-grid">
				 <div class="content-form"> 
					 <h3>NEW POST</h3>  
					<form action="post.jsp">
                        <input type="text" placeholder="ENTER YOUR TITLE" name="title"></textarea>
						<textarea placeholder="ENTER YOUR CONTENT HERE" name="postdata"></textarea>
                         Disable Comments<input type="checkbox" name="com" value="disabled">
                   

   				<input type="submit" value="POST"/>
				   </form>
						 </div>

				 </div>
			  </div>
			  <div class="col-md-4 content-right">
				 <div class="recent">
				 <%
			     int comm[]=new int[1000];
				 try{
				 /*Class.forName("oracle.jdbc.driver.OracleDriver");	   
			     String dbUrl="jdbc:oracle:thin:@localhost:8080:xe:projectadjava.accdb";
			     con= DriverManager.getConnection(dbUrl);*/
			     Connection con=null;
			     Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			     String dbUrl="jdbc:ucanaccess://C:\\Users\\Aashi Jain\\Desktop\\projectadjava.accdb";
			     con= DriverManager.getConnection(dbUrl);
			     String s11="SELECT POSTID,TITLE,Postdata FROM Post WHERE UNIQUEID =(SELECT UNIQUEID FROM user WHERE USERNAME=?) ";
				 PreparedStatement ps11=con.prepareStatement(s11);
				 ps11.setString(1,username);
				 rs11= ps11.executeQuery();
			        while (rs11.next()) {
			    	postid[k]=rs11.getInt("POSTID"); 
			    	post[k]=rs11.getString("TITLE");
			    	postdata[k]=rs11.getString("Postdata");
			    				     	k++;
			     %>
			     		 	<%      }
			        
			        for(int x=0;x<k;x++)
			        {
			        for(int y=0; y<(k-x);y++)
			        {
			        if(postid[y]<postid[y+1])
			        {int temp;
			        temp=postid[y];
			        postid[y]=postid[y+1];
			        postid[y+1]=temp;
			        
			        String temp1;
			        temp1=post[y];
			        post[y]=post[y+1];
			        post[y+1]=temp1;
			        
			        temp1=postdata[y];
			        postdata[y]=postdata[y+1];
			        postdata[y+1]=temp1;
			        
			        }}                  }
			        con.close();
			        }
			      catch(Exception ex)
			      {
			    	  ex.printStackTrace();
			      }
			     
				 %>
					 <h3>RECENT POSTS</h3>
					 <ul>
					
					 <li><a href=<%= "\"Single.jsp?POSTTITLE="+post[0]+"\"" %> ><%=post[0]%> </a></li>
					
					 <li><a href=<%= "\"Single.jsp?POSTTITLE="+post[1]+"\"" %> ><%=post[1]%></a></li>
					
					 <li><a href=<%= "\"Single.jsp?POSTTITLE="+post[2]+"\"" %> ><%=post[2]%></a></li>
					 
					 <li><a href=<%= "\"Single.jsp?POSTTITLE="+post[3]+"\"" %> ><%=post[3]%></a></li>
					 </ul>
				 </div>
				 <div class="comments">
				 <%
				 try
				 {
				 Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
			     Connection con=null;
			     ResultSet rs12= null;
			     ResultSet rs13=null;
			     String dbUrl="jdbc:ucanaccess://C:\\Users\\Aashi Jain\\Desktop\\projectadjava.accdb";
			     con= DriverManager.getConnection(dbUrl);
			     String s11="SELECT POSTID FROM Post WHERE UNIQUEID=(SELECT UNIQUEID FROM user WHERE USERNAME=?) ";
			     PreparedStatement ps11= con.prepareStatement(s11);
			     ps11.setString(1,username);
			     rs11= ps11.executeQuery();
			     j=0;
			     while(rs11.next())
			     {
			    	mypostid[j]=rs11.getInt("POSTID"); 
			    	j++;
			     }
			     
			     String ss=null;
			    
			     ss="SELECT * FROM Question WHERE POSTID=? ";
				 		k=0;					
				 for(i=0;i<=j;i++){			
					 PreparedStatement ps111=con.prepareStatement(ss);
						 ps111.setInt(1,mypostid[i]);
						 rs111= ps111.executeQuery();
						 
					        while (rs111.next()) {
					        	quesno[k]=rs111.getInt("QUESNO"); 
					        	question[k]=rs111.getString("QUESTION");
						    	COMMENTATOR[k]=rs111.getInt("UNIQUEID");
						    	k++;
						    	
					     }
					       
				    }
				 
			        for(int x=0;x<k;x++)
			        {
			        for(int y=0; y<(k-x);y++)
			        {
			        if(quesno[y]<quesno[y+1])
			        {int temp;
			        temp=quesno[y];
			        quesno[y]=quesno[y+1];
			        quesno[y+1]=temp;
			        
			        temp=COMMENTATOR[y];
			        COMMENTATOR[y]=COMMENTATOR[y+1];
			        COMMENTATOR[y+1]=temp;
			        
			        String temp1;
			        temp1=question[y];
			        question[y]=question[y+1];
			        question[y+1]=temp1;
                    }
			        }    
			        }
			        
			        String s14=null; 
			        
			    for(i=0;i<=3;i++){
			        s14="SELECT USERNAME FROM user WHERE UNIQUEID=? ";
					 PreparedStatement ps13=con.prepareStatement(s14);
					 ps13.setInt(1,COMMENTATOR[i]);
					 rs13= ps13.executeQuery();
					
				        while (rs13.next())
                       {
				    	usern[i]=rs13.getString("USERNAME");
				        c++;
				     }
			    }
			   
			    ResultSet rs15=null;
			    String s15=null;
				 for(i=0;i<3;i++)
				 {
					 s15="SELECT TITLE FROM Post WHERE POSTID=(SELECT POSTID FROM Question WHERE QUESNO=?)";
					 PreparedStatement ps15=con.prepareStatement(s15);
					 ps15.setInt(1,quesno[i]);
					 rs15= ps15.executeQuery();
				        while (rs15.next()) {
				    	title[i]=rs15.getString("TITLE");
				    	
				      }
					 
					 }
				 }
			      catch(Exception ex)
			      {
			    	 // ex.printStackTrace();
			      }
			     
				 %>
				 
				 
				 
				 
				    
					 <h3>RECENT QUESTIONS</h3>
					 
					 <ul>
					 
					 <li><a href=<%= "\"Single.jsp?POSTTITLE="+title[0]+"\"" %> ><%=usern[0]+" "%></a>  : <a href=<%= "\"Single.jsp?POSTTITLE="+title[0]+"\"" %> ><%=title[0] %></a></li>
					 <li><a href=<%= "\"Single.jsp?POSTTITLE="+title[1]+"\"" %> ><%=usern[1]+" "%></a>  : <a href=<%= "\"Single.jsp?POSTTITLE="+title[1]+"\"" %>><%=title[1] %></a></li>
					 <li><a href=<%= "\"Single.jsp?POSTTITLE="+title[2]+"\"" %> ><%=usern[2]+" "%></a>  : <a href=<%= "\"Single.jsp?POSTTITLE="+title[2]+"\"" %>><%=title[2] %></a></li>
					
					 </ul>
				 </div>
				 <div class="clearfix"></div>
				 <div class="clearfix"></div>
			  </div>
			  <div class="clearfix"></div>
		  </div>
	  </div>
</div>
<% 
for(e=0;e<j;e++)
{%>
	 </div>
<!--/header-->
<div class="content">
	 <div class="container">
		 <div class="content-grids">
			 <div class="col-md-8 content-main">
				 <div class="content-grid"><h2><insert><%=username%></insert></h2>
					 <div class="content-grid-info">
		         			
						 <div class="post-info">
						 
						 <h2><a href=<%= "\"Single.jsp?POSTTITLE="+post[e]+"\"" %> ><%=post[e]%></a> </h2>
						 <p><b><%=postdata[e] %></b></p> 
						</form>
						 </div>
					 </div>
					 <div class="content-form">
					  
					<form action="question.jsp" >
			
					 POST NO- <input type="text" style="width:100px;" value="<%=postid[e] %>" name="postid"/>
					
					
					
					 <h3>Leave a comment</h3>
						<textarea style="width:500px; height:100px;" placeholder="Write a Comment" name="question" ></textarea>
						<input type="submit" value="COMMENT"/>
					</form>
				   <form action="index2.jsp">
					   DO YOU WANT TO DELETE POST NO-<input type="text" style="width:100px;" value="<%=postid[e] %>" name="postid1"/>
         <input type="submit" name="good" value="delete"> 
            	 
					 </form>
				   <%} %>
				 		</div>

				 </div>
			  </div>
			  <div class="clearfix"></div>
		  </div>
	  </div>
</div>




<!---->
<div class="footer">
	 <div class="container">
	 <p>Copyrights © Mody University</p>
	 </div>
</div>


