
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>

<%@ page language = "java" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>

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
<head><title>borrowedBooks</title></head>
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

<center><h1>Borrowed Books</h1></center><hr>
<%
		try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/class_test";
			Connection con=DriverManager.getConnection(url, "root", "root");
			Statement st=con.createStatement();
			String query = "select * from issuebooks";
			System.out.println(query);

			ResultSet rs = st.executeQuery(query);

        if(rs.next())
        {
			    String studentName = rs.getString("studentname");
			    String studentEmail = rs.getString("studentemail");
			    String studentPhone = rs.getString("studentphone");
			    String bookId = rs.getString("bookID");
          String bookName = rs.getString("bookname");
          java.util.Date issueDate = rs.getDate("issuedate");

          out.println("<table align='center' border='1' class='table table-bordered table-striped'>");
          out.println("<tr><th>Student Name</th> <th>Student Email</th> <th>Student Phone#</th> <th>Book ID</th> <th>Book Name</th> <th>Issue Date</th>");
     		  out.println("<tr><td>"+studentName+"</td><td>"+studentEmail+"</td><td>"+studentPhone+"</td><td>"+bookId+"<td>"+bookName+"</td><td>"+issueDate+"</td>");  
                
          while(rs.next())
          {
            studentName = rs.getString("studentname");
			      studentEmail = rs.getString("studentemail");
			      studentPhone = rs.getString("studentphone");
			      bookId = rs.getString("bookID");
            bookName = rs.getString("bookname");
            issueDate = rs.getDate("issuedate");


     		    out.println("<tr><td>"+studentName+"</td><td>"+studentEmail+"</td><td>"+studentPhone+"</td><td>"+bookId+"<td>"+bookName+"</td><td>"+issueDate+"</td>");
     		    }

		        out.println("</table>");      		    
		    }
			
			  else
			  {
          out.println("No Book is issued to anyone");
      		RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
      	  rd.forward(request,response);
			  }

    	   /* else
    	    {
    	 		out.println("<h3>Book not saved</h3>");
    	 	RequestDispatcher rd=request.getRequestDispatcher("addBook.html");
      	      rd.forward(request,response);
    	    }*/

    	  out.println("</body></html>");
        out.close();
        st.close();
        con.close();

      }catch(Exception e)
    		{
     		    out.println("<h3>Error : "+e);
     		    out.println("<center><a href='searchBook.jsp'><button style='padding:10px 20px;background-color:blue;'><strong>Enter Again</BUTTON></a></strong></strong></center>");
    		}			
		


%>

</body>
</html>