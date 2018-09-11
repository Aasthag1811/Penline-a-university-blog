<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->


<!DOCTYPE HTML>
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

<!---header---->
<div class="header">
	 <div class="container">
		  <div class="logo">
			  <img src="images/newlogo.gif" title="" />
		  </div>
			 <!---start-top-nav---->
                                             <br><br><br>
				  <span class="menu"> </span>
                         <form action="loginnew.jsp" method="post">
				 <input type="text" name="Username" required/>
				 <input type="password" name="Password" required/>
				 <input type="submit" value="login"/>
                         </form>
		<div class="clearfix"> </div>
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
<div class="contact-content">
	 <div class="container">
		     <div class="contact-info">
			 <h2>SIGN UP</h2>
		     </div>
			 <div class="contact-details">
			 <form action="signupnew.jsp" method="get">
				 <input type="text" name="name" placeholder="Enter Your Name" required/>
				 <input type="text" name="password" placeholder="Enter Your Password" required/>
				  <input type="text" name="unique" placeholder=" Enter a Unique ID"  required/>
				  <input type="text" name="eid" placeholder=" Enter your Outlook ID"  required/>
				   <%// int m=0;
			           //  session.setAttribute("session",m); %>
				 <input type="submit" value="get OTP"/>
			 </form>
		  </div>
			 </div>
	 </div>
</div>
<!---->
<div class="footer">
	 <div class="container">     <br><br><br><br><br>
	 <p>Copyrights © Mody University</a></p>
	 </div>
</div>
</body>
</html>

