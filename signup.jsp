<%
String user_type =(String)session.getAttribute("key");
System.out.println(user_type);

if(user_type==null)
{
  request.setAttribute("msg","login first");
  RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
  rd.forward(request,response);
}
else if(user_type.equals("student"))
{
  request.setAttribute("msg","login as admin first");
  RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
  rd.forward(request,response);
}
%>

<html>
<head><title>Home</title></head>
<body style="background-color:#a4a0a0;">

<h1 style="text-align:left;"><font size="300" face="italic"><image src="logo1.jpg" width="300" height="250" style="float left">
<em><strong>Library Management System(LMS) </strong></em></font></h1>

<hr>
<u><h1 style="text-align:center;"><font size="300" face="italic">
<em><strong> ..........Welcome to Library Management System.......... </strong></em></font></h1></u>

<!--Buttons-->

<form name="home" action="home.jsp" method="post">
<button style="padding:10px 20px;float:left;background-color:none;"><strong>HOME</strong></button>
</form>

<form name="add admin" action="signup.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Add User</strong></button>
</form>

<form name="add student" action="signup.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Add Librarian</strong></button>
</form>

<form name="addbook" action="addBook.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Add Book</strong></button>
</form>

<form name="deleteBook" action="deleteBook.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Delete Book</strong></button>
</form>

<form name="updateBook" action="updateBook.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Update Book</strong></button>
</form>

<form name="searchBook" action="searchBook.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>SEARCH BOOK</strong></button>
</form>

<form name="issueBook" action="issueBook.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Issue Book</strong></button>
</form>

<form name="returnBook" action="retuenBook.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Return Book</strong></button>
</form>

<form name="viewBooksInfo" action="viewBooksInfo.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>ViewBooksInfo</strong></button>
</form>

<form name="fine policy" action="finePolicy.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Fine Policy</strong></button>
</form>

<form name="borrowedBooks" action="borrowedBooks.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Borrowed Books</strong></button>
</form>

<form name="madeby" action="made.html" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>MadeBy</strong></button>
</form>

<hr>
<br>
<br>
<br>
<br>
<hr>

   
<!--form validation-->
<script language="JavaScript" type="text/javaScript">

  function validate()
  {
      var emstring=document.singup.email.value;
      var at=emstring.indexof("@");
      var dot=emstring.lastindexof(".");

      if ( document.signup.username.value == "" )
      {
          alert("User name is empty!!");      
          return false;
      }

      if(document.signup.password.value == "")  
      {
          alert("password is empty!!");
          document.signup.password.focus();
          return false;
      }  

      if(document.signup.password.value!=document.signup.confirm_password.value)
      {
          alert("New Password and Confirm new Password doesnt match");
          document.signup.confirm_password.focus();
          return false;
      }
               
      if ( document.signup.city.value == "" )
      {
         alert("City is empty!!");
          return false;
      }

      if ( document.signup.phone.value == "" )
      {   
          alert("Telephone is empty!!");
          return false;
      }
          
      if ( document.signup.email.value == "" )    
      {
        alert("Please enter email address!");
        return false;
      }

      if(at<1 || at+1>=dot || dot+1>emstring.length)
      {
        alert("Invalid email!!!");
        return false;
      }

      return true;
  }

</script>


<!--SignupForm-->
<form align="center" method="POST" action="signup" name="signup" onclick="return validate()">
<center><h1>Sign-Up</h1></center><h3 align="right">

<fieldset>
<center><legend>Please fill in this form to create an account.</legend></center>    
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
    	<td>Phone#</td>
    	<td><input type="text" name="phone" required></center><br></td>
    </tr>
    
    <tr>
    	<td>City</td>
    	<td><input type="text" name="city" required></center><br></td>
    </tr>
    
    <tr>
    	<td>Usertype(admin/student)</td>
      <td >
      <select name="usertype">
      <option value=" "></option>   
      <option value="admin">Admin</option>
      <option value="student">Student</option>
      </select>
      </td> 
    </tr>	

    <tr> 
      <td colspan="2"><center><input type="submit" value="submit" required></center><br></td>
    </tr>

    </table>
</fieldset>
</form>

</body>
</html>