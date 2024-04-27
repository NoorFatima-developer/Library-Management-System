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
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Search Book</strong></button>
</form>


<form name="issueBook" action="issueBook.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Issue Book</strong></button>
</form>

<form name="returnBook" action="returnBook.jsp" method="post">
<button style="padding:10px 20px;float: left;background-color:none;"><strong>Return Books</strong></button>
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


<form align="center" method="POST" action="searchBook" name="searchBook" >

<center><h3>searchBook-Form</h3></center><hr>
<fieldset>
<center><legend>Please enter book name you want to search.</legend></center>   
  
    <table align="center" border="2">

    <tr>
      <td>BookName</td>
      <td><input type="text" name="bookname" required></center><br></td>
    </tr>

 
 
    <tr>
      <td colspan="2"><center><input type="submit" value="searchbook" required></center><br></center></td>
    </tr>

    </table>
</fieldset>
</form>


</body>
</html>