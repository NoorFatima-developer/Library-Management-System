<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>

<%@ page language = "java" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>

<%
// get value of session
String user_type =(String)session.getAttribute("key");
System.out.println(user_type);

if(user_type==null)
{
  request.setAttribute("msg","login first");
  RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
    rd.forward(request,response);
}
else if(user_type.equals("admin"))
{
  request.setAttribute("msg","login first as student");
  RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
    rd.forward(request,response);
}
%>

<html>
<head><title>studentHome</title></head>
<body style="background-color:#a4a0a0;">


<h1 style="text-align:left;"><font size="300" face="italic"><image src="logo1.jpg" width="300" height="250" style="float left">
<em><strong>Library Management System(LMS) </strong></em></font></h1>

<hr>
<u><h1 style="text-align:center;"><font size="300" face="italic">
<em><strong> ..........Welcome to Library Management System.......... </strong></em></font></h1></u>

<!--Buttons-->

  <form name="studentHome" action="studentHome.jsp" method="post">
  <button style="padding:10px 20px;float:left;background-color:none;"><strong>HOME</strong></button>
  </form>

  <form name="studentSearchBook" action="studentSearchBook.jsp" method="post">
  <button style="padding:10px 20px;float: left;background-color:none;"><strong>Search Book</strong></button>
  </form>

  <form name="studentReturnBook" action="studentReturnBook.jsp" method="post">
  <button style="padding:10px 20px;float: left;background-color:none;"><strong>Return Book</strong></button>
  </form>

  <form name="studentViewBooksInfo" action="studentViewBooksInfo.jsp" method="post">
  <button style="padding:10px 20px;float: left;background-color:none;"><strong>ViewBooksInfo</strong></button>
  </form>

  <form name="fine policy" action="studentFinePolicy.jsp" method="post">
  <button style="padding:10px 20px;float: left;background-color:none;"><strong>Fine Policy</strong></button>
  </form>

  <form name="studentBorrowedBooks" action="studentBorrowedBooks.jsp" method="post">
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

<center><h1>Books in Library</h1></center><hr>


<%
		try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/class_test";
			Connection con=DriverManager.getConnection(url, "root", "root");
			Statement st=con.createStatement();
			String query = "select * from bookinfo";
			System.out.println(query);

			ResultSet rs = st.executeQuery(query);

        if(rs.next())
        {
          out.println("<table align='center' border='2' class='table table-bordered table-striped'>");
     		  out.println("<tr><th>bookID</th><th>BookName</th><th>Author</th><th>Edition</th>");
			    String bookName = rs.getString("bookname");
			    String bookid = rs.getString("bookID");
			    String author = rs.getString("author");
			    String edition = rs.getString("edition");

     		  out.println("<tr><td>"+bookid+"</td><td>"+bookName+"</td><td>"+author+"</td><td>"+edition+"");  
                
          while(rs.next())
          {
            bookName = rs.getString("bookname");
			      bookid = rs.getString("bookID");
			      author = rs.getString("author");
			      edition = rs.getString("edition");

     		    out.println("<tr><td>"+bookid+"</td><td>"+bookName+"</td><td>"+author+"</td><td>"+edition+"");
     		  }

		      out.println("</table>");      		    
		    }
			
			  else
			  {
      		out.println("Books not found");
      		RequestDispatcher rd=request.getRequestDispatcher("studentHome.jsp");
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
     		 out.println("<center><a href='studentHome.jsp'><button style='padding:10px 20px;background-color:blue;'><strong>Enter Again</BUTTON></a></strong></strong></center>");
    	 }			
		
%>

</body>
</html>