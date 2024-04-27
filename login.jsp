<%
  String error = ((String)request.getAttribute("msg"));
  if(error==null)
  {
    error="";
  }

  String user_type =(String)session.getAttribute("key");
  if(user_type!=null)  // means k agr  koi login hua he to dbara login hone ki bjaye us k home pr chla jaye
  {
       if(user_type.equals("student"))
      {
        RequestDispatcher rd=request.getRequestDispatcher("studentHome.jsp");
        rd.forward(request,response);
      }
       if(user_type.equals("admin"))
      {
        RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
        rd.forward(request,response);
      }
  }

%>

<html>
<head><title>Log-in</title></head>
<body style="background-color:#a4a0a0;">

<h1><%out.println(error);%></h1>

<br/>
<h1 style="text-align:left;"><font size="300" face="italic"><image src="logo1.jpg" width="300" height="250" style="float left">
<em><strong>Library Management System(LMS) </strong></em></font></h1>

<!--log-inForm-->
<hr>
<form align="center" method="POST" action="login" name="login" >

<center><h1>Log-In</h1></center><hr>
<fieldset>
<center><legend>Please fill in this form to log-in to account.</legend></center>   
  
    <table align="center" border="2">
    <tr>
      <td>Username</td>
      <td><input type="text" name="username" required></center></center><br></td>
    </tr>

    <tr>
      <td>Password</td>
      <td><input type="password" name="password" required></center><br></td>
    </tr>

    <tr>
      <td>Email</td>
      <td><input type="email" name="email" required></center><br></td>
    </tr>
 
    <tr>
      <td colspan="2"><center><input type="submit" value="log-in" required></center><br></center></td>
    </tr>

    </table>
</fieldset>
</form>

</body>
</html>