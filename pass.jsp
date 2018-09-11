<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div class="contact-details">
			 <form action="check.jsp" method="post">
				 <input type="text" name="oldp" placeholder="Enter Your old password" required/>
				 <input type="text" name="newp" placeholder="Enter Your  new Password" required/>				
				 <input type="text" name="uid" placeholder="Enter Your  unique id" required/>				
				 <input type="submit" value="change Password"/>
			 </form>
		  </div>
</body>
</html>