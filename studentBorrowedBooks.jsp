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
<head><title>studentborrowedbooks</title></head>
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

<center><h1>Your Borrowed Books</h1></center><hr>
<%
		try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/class_test";
			Connection con=DriverManager.getConnection(url, "root", "root");
			Statement st=con.createStatement();

      // get value of student email
      String stemail =(String)session.getAttribute("emailID");
      System.out.println(stemail);
      

      // search issuebooks against login emailID
			String query = "select * from issuebooks where studentemail='"+stemail+"'";
			System.out.println(query);

			ResultSet rs = st.executeQuery(query);

      if(rs.next())
      {
			    String studentName = rs.getString("studentname");
			    String studentEmail = rs.getString("studentemail");
			    String studentPhone = rs.getString("studentphone");
			    String bookId = rs.getString("bookID");
          String bookName = rs.getString("bookname");
          Date issueDate=rs.getDate("issuedate");

          out.println("<table align='center' border='1' class='table table-bordered table-striped'>");
          out.println("<tr><th>Student Name</th><th>Student Email</th><th>Student Phone#</th><th>Book ID</th><th>Book Name</th><th>Book IssueDate</th>");
     		  out.println("<tr><td>"+studentName+"</td><td>"+studentEmail+"</td><td>"+studentPhone+"</td><td>"+bookId+"<td>"+bookName+"</td><td>"+issueDate+"</td></tr>");  
                
          while(rs.next())
          {
            System.out.println("found student");
            studentName = rs.getString("studentname");
			      studentEmail = rs.getString("studentemail");
			      studentPhone = rs.getString("studentphone");
			      bookId = rs.getString("bookID");
            bookName = rs.getString("bookname");
            issueDate=rs.getDate("issueDate");

     		    out.println("<tr><td>"+studentName+"</td><td>"+studentEmail+"</td><td>"+studentPhone+"</td><td>"+bookId+"<td>"+bookName+"</td><td>"+issueDate+"</td></tr>");
     		  }
		      out.println("</table>");      		    
		  }
			
			else
			{
          System.out.println("noo book is issued");
          request.setAttribute("msg","noo Book is issued to you");
      		RequestDispatcher rd=request.getRequestDispatcher("studentHome.jsp");
      	  rd.forward(request,response);
			}

    	out.println("</body></html>");
      out.close();
      st.close();
      con.close();

    }catch(Exception e)
     {
     		out.println("<h3>Error : "+e);
     		out.println("<center><a href='studentHome.jsp'><button style='padding:10px 20px;background-color:blue;'><strong>Home</BUTTON></a></strong></strong></center>");
     }			
		
%>

</body>
</html>